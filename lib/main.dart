import 'package:flutter/material.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/login.dart';

void main(){
  runApp(Myapp());
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}