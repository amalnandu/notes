import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/google_auth/Auth.dart';

class Verify_password extends StatefulWidget {
  const Verify_password({super.key});

  @override
  State<Verify_password> createState() => _Verify_passwordState();
}

class _Verify_passwordState extends State<Verify_password> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  Timer? _timer;

  void _startEmailVerificationCheck(){
    _timer=Timer.periodic(Duration(seconds: 5),(_timer)async {
      await _user.reload();
      if(_user.emailVerified){
        _timer.cancel();
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _startEmailVerificationCheck();


    @override
    void dispose() {
      _timer?.cancel();
      super.dispose();
    }

    }


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
          ),)),
            ElevatedButton(onPressed: ()async{
                    User? user=FirebaseAuth.instance.currentUser;
                    await user?.sendEmailVerification();
            }, child: Text("Resend verification email"))
        ],),
      ),
    );
}
}
