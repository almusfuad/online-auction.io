import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../auction_screens/auction_overview_screen.dart';
import '/providers/authentication/auth.dart';
import '/providers/authentication/validator.dart';
import './profile_screen.dart';
import './reg_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          // _focusEmail.unfocus();
          // _focusPassword.unfocus();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Enter Online-Auction',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            enabled: true,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              // hintText: 'Use your gmail account',
                              // errorBorder: UnderlineInputBorder(
                              //   borderRadius: BorderRadius.circular(6.0),
                              //   borderSide:const BorderSide(color: Colors.red)
                              // ),
                            ),
                            controller: _emailTextController,
                            focusNode: _focusEmail,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => Validator.validateEmail(
                              email: value.toString(),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            controller: _passwordTextController,
                            focusNode: _focusPassword,
                            validator: (value) => Validator.validatePassword(
                              password: value.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 35.0,
                            bottom: 35.0,
                          ),
                          width: deviceSize.width * 0.3,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                User? user =
                                    await Auth.signInUsingEmailPassword(
                                        email: _emailTextController.text,
                                        password: _passwordTextController.text,
                                        context: context);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AuctionsOverviewScreen(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 35.0,
                            bottom: 35.0,
                          ),
                          width: deviceSize.width * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
