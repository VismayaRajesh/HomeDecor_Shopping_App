import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/loginscreen.dart';

import '../../constants/my_app_constants.dart';
import '../../widgets/Getstarted_widget.dart';
import '../view_model/landing_bloc/landingbloc_bloc.dart';
import 'bottomnav_screen.dart';
import 'homescreen.dart';

class Landing2Screen extends StatelessWidget {
  const Landing2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingblocBloc, LandingblocState>(
      listener: (context, state) {
        if (state is Login) {
          print("Navigating to login");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Minimal Furniture's",
                    style: TextStyle(
                      color: Color.fromRGBO(21, 19, 68, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 13),
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
                  SizedBox(height: 25),
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
                        Positioned(
                          bottom: 420,
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: GetstartedWidget(
                              name: 'Continue',
                              onPressed: () {
                                print("Dispatching NavigateToHome event");
                                BlocProvider.of<LandingblocBloc>(context)
                                    .add(NavigateToLogin());
                              },
                            ),
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
      ),
    );
  }
}
