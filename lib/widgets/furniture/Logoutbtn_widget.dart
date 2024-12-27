import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutbtnWidget extends StatelessWidget {
  const LogoutbtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
    }, child: Text("Logout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 15),),
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(153, 133, 88, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14)
    ),);
  }
}
