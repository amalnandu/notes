import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/google_auth/Auth.dart';

class Forgot_Password extends StatelessWidget {
  const Forgot_Password({super.key});

  @override
  Widget build(BuildContext context) {

    var forgot_email=TextEditingController();

    var ht=MediaQuery.of(context).size.height;
    var wd=MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: ht*0.1,),
              Text("Reset Password",style: GoogleFonts.poppins(
                fontSize:20
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 38.0, horizontal: 35),
                child: TextFormField(
                  controller: forgot_email,
                  decoration: InputDecoration(
                      labelText: 'Enter your registered email',
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: ht * 0.05,
                width: (wd * 0.8),
                child: ElevatedButton(
                  onPressed: ()async {
                    var user=AuthService();
                    await user.sendPasswordResetEmail(forgot_email.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black, // text color
                    elevation: 3, // button's elevation when it's pressed
                  ),
                  child: const Text('Send password reset link'),
                ),
              ),
              SizedBox(height: ht*0.03,),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Go back"))

            ],
          ),
        ),
      ),
    );
  }
}
