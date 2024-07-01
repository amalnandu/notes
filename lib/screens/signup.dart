import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/safe_area_values.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../google_auth/Auth.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    var _email = TextEditingController();
    var _password = TextEditingController();
    var _confirm_pw = TextEditingController();

    final _authService = AuthService();
    String _message = '';

    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ht * 0.1,
            ),
            Text(
              "Notes 🖊️",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: ht * 0.07,
            ),
            Center(
              child: Container(
                height: ht * 0.6,
                width: wd * 0.9,
                child: Center(
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign up',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 8.0, horizontal: 15),
                        //   child: TextFormField(
                        //     controller: name,
                        //     decoration: InputDecoration(
                        //         labelText: 'Enter your name',
                        //         border: OutlineInputBorder()),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                labelText: 'Enter your Email',
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: _password,
                            decoration: InputDecoration(
                                labelText: 'Enter your Password',
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_red_eye)),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: _confirm_pw,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {},
                                ),
                                border: OutlineInputBorder()),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: ht * 0.05,
                          width: (wd * 0.8),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_password.text != _confirm_pw.text) {
                                setState(() {
                                  _message = "Passwords do not match";
                                  showTopSnackBar(Overlay.of(context),
                                  const CustomSnackBar.error(message: "Password do not match ")
                                  );
                                });
                              }
                              if (_password.text == _confirm_pw.text) {
                                User? user = await _authService.signUpWithEmail(
                                  _email.text,
                                  _password.text,
                                );

                                if (user != null) {
                                  setState(() {
                                    _message =
                                        'A verification email has been sent to ${_email.text}. Please verify your email before logging in.';

                                    showTopSnackBar(Overlay.of(context),
                                        const CustomSnackBar.success(message: "Verification email sent!")
                                    );

                                    Navigator.pop(context);
                                  });
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black, // text color
                              elevation:
                                  3, // button's elevation when it's pressed
                            ),
                            child: const Text('Verify & Sign up'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Back to login")),


                        if (_message.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              _message,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Password_Field extends StatefulWidget {
  Password_Field({super.key});

  @override
  State<Password_Field> createState() => _Password_FieldState();
}

class _Password_FieldState extends State<Password_Field> {
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
