import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/categories_bloc/furniturebloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_event.dart';
import 'package:homedecor_shopping_app/view/view_model/homepdct_bloc/homepdtbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/homepdct_bloc/homepdtbloc_event.dart';
import 'package:homedecor_shopping_app/view/view_model/landing_bloc/landingbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/splash_screen.dart';
import 'package:homedecor_shopping_app/view/view_model/sofapdct_bloc/sofapdctbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/wishicon_bloc/wishiconbloc_bloc.dart';
import 'package:homedecor_shopping_app/view/view_model/wishlistpdct_bloc/wishlistpdctbloc_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  String userName = "Guest";
  runApp(
    MultiBlocProvider(
      providers: [
        // Provide the Furniturebloc
        BlocProvider<FurnitureblocBloc>(
          create: (BuildContext context) => FurnitureblocBloc()..add(LoadCategoriesEvent(userName: userName)),
        ),
        BlocProvider<LandingblocBloc>(
          create: (BuildContext context) => LandingblocBloc(),
        ),
        BlocProvider(
         create: (BuildContext context) => ProductBloc()..add(LoadProducts()),),
        BlocProvider(
          create: (BuildContext context) => WishlistBloc()..add(LoadPdct()),),
        BlocProvider(
          create: (BuildContext context) => SofaBloc()..add(Loadsofapdt()),),
        BlocProvider(
          create: (BuildContext context) => DintableBloc()..add(Loaddinpdt()),),
        BlocProvider(
          create: (BuildContext context) => WishBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

