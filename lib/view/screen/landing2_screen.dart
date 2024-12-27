import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/widgets/Getstarted_widget.dart';

class Landing2Screen extends StatelessWidget {
  const Landing2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 14),
                // Title Section
                Text(
                  "Minimal Furniture's",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 11),
                // Heading
                Text(
                  "Make Your",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 26,
                  ),
                ),
                Text(
                  "Dream House",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 19, 68, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 6),
                // Image with Stacked Text and Button
                Expanded(
                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.topRight,
                        child: CachedNetworkImage(
                          imageUrl: MyAppConstants.land2,
                          fit: BoxFit.contain,
                        ),
                      ),
                      // Centered Text
                      Positioned(
                        bottom: 400,
                        right: 6,
                        left: 6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Text(
                            "Modern furniture makes you want to stay in.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(21, 19, 68, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      // Continue Button at the Bottom
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: GetstartedWidget(name: 'Continue'),
                        ),
                      ),
                    ],
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
