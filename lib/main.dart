import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/view/screen/categories_screen.dart';
import 'package:homedecor_shopping_app/view/screen/landing2_screen.dart';
import 'package:homedecor_shopping_app/view/screen/landing_screen.dart';
import 'package:homedecor_shopping_app/view/screen/notification_screen.dart';
import 'package:homedecor_shopping_app/view/screen/profile_screen.dart';
import 'package:homedecor_shopping_app/view/screen/wishlist_screen.dart';
import 'package:homedecor_shopping_app/view/view_model/furniture_bloc/furniturebloc_bloc.dart';
import 'package:homedecor_shopping_app/widgets/furniture/productList_widget.dart';
import 'package:homedecor_shopping_app/view/screen/homepage_screen.dart';
import 'package:homedecor_shopping_app/view/screen/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<FurnitureblocBloc>(
        create: (BuildContext context) =>
        FurnitureblocBloc()
          ..add(LoadCategoriesEvent()),
      ),
    ],
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Landing2Screen(),
    );
  }
}

