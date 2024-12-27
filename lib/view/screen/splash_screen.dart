import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF773A3A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 95,
                width: 95,
                child: Image(image: AssetImage("assets/images/logo.png"))),
            SizedBox(height: 5,),
            Text("FURNIE", style: TextStyle(color: Colors.white, fontSize: 25),)
          ],
        ),

      ),
    );
  }
}
