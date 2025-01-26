import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/categories_bloc/furniturebloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/landing_bloc/landingbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/splash_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        // Provide the Furniturebloc
        BlocProvider<FurnitureblocBloc>(
          create: (BuildContext context) => FurnitureblocBloc()..add(LoadCategoriesEvent()),
        ),
        // Provide the Landingbloc
        BlocProvider<LandingblocBloc>(
          create: (BuildContext context) => LandingblocBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}

