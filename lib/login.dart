import 'package:cs310/homefeed.dart';
import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'objects/auth.dart';
import 'package:email_validator/email_validator.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  late String s;

  String _email = '';
  String _pass = '';

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  Future loginUser() async {
    print(_email);
    dynamic result = await _auth.loginWithEmailPass(_email, _pass);
    print(result);
    if (result is String) {
      _scaffoldkey.currentState?.showSnackBar(SnackBar(
        content: new Text(result.toString()),
        duration: new Duration(seconds: 10),
      ));
    } else if (result is User) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      }));
    } else {
      _scaffoldkey.currentState?.showSnackBar(SnackBar(
        content: new Text(result.toString()),
        duration: new Duration(seconds: 10),
      ));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    s = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            'SPORTIFY',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.appbar,
        ),
        body: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: Dimensions.pPadding,
                        child: TextFormField(
                          key: ValueKey('email'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(width: 4),
                                  const Text('Email'),
                                ],
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Cannot leave e-mail empty';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Please enter a valid e-mail address';
                              }
                            }
                          },
                          onSaved: (value) {
                            _email = value ?? '';
                          },
                        ),
                      ),
                      Container(
                        padding: Dimensions.pPadding,
                        child: TextFormField(
                          key: ValueKey('password'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            label: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  const Icon(Icons.password),
                                  const SizedBox(width: 4),
                                  const Text('Password'),
                                ],
                              ),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Cannot leave password empty';
                              }
                              if (value.length < 6) {
                                return 'Password too short';
                              }
                            }
                          },
                          onSaved: (value) {
                            _pass = value ?? '';
                          },
                        ),
                      ),
                    ]),
              ),
              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.appbar, width: 5)),
                margin: Dimensions.wPadding,
                child: OutlinedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print('Email: $_email');
                      _formKey.currentState!.save();
                      print('Email: $_email');
                      await loginUser();
                      //  await _auth.getUser(_username, _email, _pass);
                    } else {
                      Text('Your email is wrong!');
                    }
                  },
                  child: Text(
                    "Login",
                    style: welcomeText,
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ),
            ],
          ),
        ));
  }
}
