import 'package:flutter/material.dart';
import 'package:notes/google_auth/Auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var user=AuthService();
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),
      actions: [
        IconButton(onPressed: ()async{
            await user.signOut();
        }, icon: Icon(Icons.exit_to_app))
      ],),


    );
  }
}
