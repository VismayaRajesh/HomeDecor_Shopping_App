import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/view/screen/landing_screen.dart';

import '../../model/Data_Model/productData.dart';// Import the landing page

class SplashScreen extends StatelessWidget {
  final ProductModel? product;
  const SplashScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    // Navigate to the LandingPage after 3 seconds
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF773A3A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 95,
              width: 95,
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(height: 5),
            const Text(
              "FURNIE",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
