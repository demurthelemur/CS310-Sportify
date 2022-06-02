import 'package:cs310/login.dart';
import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'objects/auth.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _pass = '';
  String _username = '';
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  final AuthService _auth = AuthService();

  Future signupUser() async {
    dynamic result = await _auth.registerUserWithEmailPass(_email, _pass);
    print(result);
    if (result is String) {
      _scaffoldkey.currentState?.showSnackBar(SnackBar(
        content: new Text(result.toString()),
        duration: new Duration(seconds: 10),
      ));
    } else if (result is User) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return loginPage();
      }));
    } else {
      _scaffoldkey.currentState?.showSnackBar(SnackBar(
        content: new Text(result.toString()),
        duration: new Duration(seconds: 10),
      ));
    }
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
                            key: ValueKey('username'),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              label: Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 4),
                                    const Text('Username'),
                                  ],
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            validator: (value) {
                              if (value != null) {
                                if (value.isEmpty) {
                                  return 'Cannot leave username empty';
                                }
                              }
                            },
                            onSaved: (value) {
                              _username = value ?? '';
                            }),
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
                      await signupUser();

                      await _auth.getUser(_username, _email, _pass);
                    } else {
                      Text('Your email is wrong!');
                    }
                  },
                  child: Text(
                    "Sign Up",
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
