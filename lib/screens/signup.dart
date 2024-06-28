
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {

    var name=TextEditingController();
    var email=TextEditingController();
    var password=TextEditingController();
    var confirm_pw=TextEditingController();

    var ht=MediaQuery.of(context).size.height;
    var wd= MediaQuery.of(context).size.width;
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
                            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                                labelText: 'Enter your name', border: OutlineInputBorder()),
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
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder()),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                border: OutlineInputBorder()),
                          ),
                        ),
                      SizedBox(height: 10,),
                        SizedBox(
                          height: ht * 0.05,
                          width: (wd * 0.8),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black, // text color
                              elevation: 3, // button's elevation when it's pressed
                            ),
                            child: const Text('Sign up'),
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
