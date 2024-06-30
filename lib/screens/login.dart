  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:notes/google_auth/Auth.dart';

  class LoginPage extends StatelessWidget {
    LoginPage({super.key});

    @override
    Widget build(BuildContext context) {
      double ht = MediaQuery.of(context).size.height;
      double wd = MediaQuery.of(context).size.width;
      var email = TextEditingController();
      var pw = TextEditingController();

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ht * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: wd * 0.1,
                  ),
                  Text(
                    "Notes 🖊️",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ht * 0.07,
              ),
              Container(
                height: ht * 0.6,
                width: wd * 0.9,
                child: Card(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Login',
                          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              labelText: 'Email', border: OutlineInputBorder()),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: TextFormField(
                          controller: pw,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/forgot');
                              }, child: Text("Forgot Password?")),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ht * 0.05,
                        width: (wd * 0.8),
                        child: ElevatedButton(
                          onPressed: () async{
                            var auth =  AuthService();
                            var user= await auth.loginWithEmail( email.text, pw.text);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black, // text color
                            elevation: 3, // button's elevation when it's pressed
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      SizedBox(
                        height: ht * 0.02,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: ht * 0.01,
                      ),
                      SizedBox(
                        height: ht * 0.05,
                        width: (wd * 0.8),
                        child: ElevatedButton(
                          onPressed: () async{

                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white, // text color
                            elevation: 3, // button's elevation when it's pressed
                          ),
                          child: const Text(' 🇬   LogIn with Google'),
                        ),
                      ),
                      SizedBox(
                        height: ht * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                "Signup",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
