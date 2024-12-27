import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/widgets/Getstarted_widget.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 296.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Color.fromRGBO(153, 133, 88, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 115.0,top: 18),
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: Text(
                  "Furnie",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 55),
                child: Text(
                  "One app for all smart home elements.",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 38),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: CachedNetworkImage(
                      imageUrl: MyAppConstants.land1,
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(), // Adjust spacing between image and text
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0,left: 10),
            child: Center(
              child: GetstartedWidget(name: 'Get Started',),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First indicator (active)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8), // Spacing between indicators
                // Second indicator (inactive)
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey, // Inactive color
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
