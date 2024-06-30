import 'package:flutter/material.dart';
import 'package:notes/screens/forgot_pw.dart';
import 'package:notes/screens/home.dart';
import 'package:notes/screens/login.dart';
import 'package:notes/screens/signup.dart';
import 'package:notes/screens/verify_pw.dart';
import 'package:firebase_core/firebase_core.dart';

import 'google_auth/AuthWrapper.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyA2jJVG7A4M3MSy-6v3p8o5cRLizG-iNho", appId: "1:496806717341:android:16e380830cdc4ef4533174", messagingSenderId: "496806717341", projectId: "notes-3d9ec")
  );
  runApp(Myapp(

  ));
}


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=> AuthWrapper(),
        '/login':(context)=>LoginPage(),
        '/signup':(context)=>Signup(),
        '/verify':(context)=>VerifyPassword(),
        '/forgot':(context)=>Forgot_Password(),
        '/home':(context)=>Home(),

      },

      debugShowCheckedModeBanner: false,

    );
  }
}
