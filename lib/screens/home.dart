import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/google_auth/Auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var ht=MediaQuery.of(context).size.height;
    var wd=MediaQuery.of(context).size.width;

    var user=AuthService();
    return Scaffold(
      appBar: AppBar(title: Row(
        children: [
          SizedBox(

            width: wd * 0.05,
          ),
          Text(
            "Notes 🖊️",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: ()async{

         showDialog(
context: context,builder: (BuildContext context){
  return CupertinoAlertDialog(
    title: Text("Signout?"),
    actions: [
      TextButton(onPressed: ()async{
        await user.signOut();
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }, child: Text("Yes")),
      TextButton(onPressed: ()async{
        Navigator.pop(context);
      }, child: Text("No"))
    ],
  );
         }

          );

        }, icon: Icon(Icons.exit_to_app))
      ],),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add,size: 30,),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

            ],
          ),
        ),
      ),


    );
  }
}
