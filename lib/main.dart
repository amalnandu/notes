import 'package:flutter/material.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/signup.dart';
import 'package:notes/screens/verify_pw.dart';

void main(){
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Verify_password(),
    );
  }
}
