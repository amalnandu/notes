import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/google_auth/Auth.dart';

class Verify_password extends StatelessWidget {
  const Verify_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed:() async {
            var user =AuthService();
            await user.signOut();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Center(child: Text("Your email is not verified!",style: GoogleFonts.poppins(
            fontSize:20
          ),)),
          SizedBox(height: 20,),
          Center(child: Text("Check your email ✉",style: GoogleFonts.poppins(
              fontSize:20
          ),))
        ],),
      ),
    );
}
}
