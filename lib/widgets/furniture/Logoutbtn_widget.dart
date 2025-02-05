import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../view/screen/loginscreen.dart';

class LogoutbtnWidget extends StatelessWidget {
  const LogoutbtnWidget({super.key});

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () async {
      await signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }, child: Text("Logout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 15),),
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(153, 133, 88, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14)
    ),);
  }
}
