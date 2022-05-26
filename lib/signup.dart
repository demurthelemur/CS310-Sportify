import 'package:cs310/login.dart';
import 'package:flutter/material.dart';
import 'objects/styles.dart';
import 'package:email_validator/email_validator.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: 
      Container(
        color: Colors.black,
        width: MediaQuery. of(context).size.width,
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
                          email = value ?? '';
                        },
                      ),
                    ),
                    Container(
                      padding: Dimensions.pPadding,
                      child: TextFormField(
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
                        
                      ),
                    ),
                   
                    Container(
                      padding: Dimensions.pPadding,
                      child: TextFormField(
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
                          pass = value ?? '';
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Email: $email');
                    _formKey.currentState!.save();
                    print('Email: $email');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return loginPage();
                    }));
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
      )
    );
  }
}
