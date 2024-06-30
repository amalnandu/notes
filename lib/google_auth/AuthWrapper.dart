import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/verify_pw.dart';
import '../screens/home.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return LoginPage();
        }

        User? user = snapshot.data;

        if (user != null && !user.emailVerified) {
          return EmailVerify();
        }

        return Home();
      },
    );
  }
}
