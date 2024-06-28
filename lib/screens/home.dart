import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),
      actions: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.exit_to_app))
      ],),


    );
  }
}
