import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/Sofa_screen.dart';
import 'package:homedecor_shopping_app/view/view_model/categories_bloc/furniturebloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/homepdct_bloc/homepdtbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/homepdct_bloc/homepdtbloc_event.dart';
import 'package:homedecor_shopping_app/view/view_model/landing_bloc/landingbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/splash_screen.dart';
import 'package:homedecor_shopping_app/view/view_model/wishlistpdct_bloc/wishlistpdctbloc_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(
         create: (BuildContext context) => ProductBloc()..add(LoadProducts()),),
        BlocProvider(
          create: (BuildContext context) => WishlistBloc()..add(LoadPdct()),)
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
      home: SplashScreen(),
    );
  }
}

