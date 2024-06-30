import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/google_auth/Auth.dart';
import 'package:notes/google_auth/AuthWrapper.dart';

import 'home.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({super.key});

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  final _authy =AuthService();
  late Timer timery;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _startEmailVerificationCheck();
  }

  void _startEmailVerificationCheck() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await _user.reload();
      if (_user.emailVerified) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  AuthWrapper()));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var user = AuthService();
              await user.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your email is not verified!",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "Check your email ✉",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: Text("Resend verification email"),
            ),
          ],
        ),
      ),
    );
  }
}

////



class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  @override
  bool isVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        Duration(seconds: 3),
            (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

      if (isVerified) timer?.cancel();
    });
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Widget build(BuildContext context) => isVerified
      ? Home()
      : Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        'Verify email',
        style: GoogleFonts.poppins(),
      ),
    ),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Text(
                  "A verification Email has been sent to your mail",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(300, 60),
                    maximumSize: Size(300, 60) //////// HERE
                ),
                onPressed: () {
                  if (canResendEmail == true) {
                    sendVerificationEmail();
                  }
                },
                child: Row(
                  children: [
                    Icon(Icons.mail_lock),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Resent Email",
                      style: GoogleFonts.poppins(fontSize: 22),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 38,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shadowColor: Colors.white,
                      elevation: 9,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(300, 60),
                      maximumSize: Size(300, 60) //////// HERE
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(fontSize: 22),
                  )),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    ),
  );
}