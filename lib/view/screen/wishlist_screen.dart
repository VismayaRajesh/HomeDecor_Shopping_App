import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  // Add this import
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';

import '../../widgets/backbutton.dart';
import '../../widgets/furniture/wishlistProduct_widget.dart';
import '../view_model/wishlistpdct_bloc/wishlistpdctbloc_bloc.dart';
import 'menu_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        leading: InkWell(
            child: BackbuttonWidget(),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(
          "Wishlist",
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              MyAppIcon.cart,
              color: Colors.black,
              size: 25,
            ),
          )
        ],
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>( // Wrap the body with BlocBuilder
        builder: (context, state) {
          if (state is WishlistLoad) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: Align(
                      child: Text(
                        "${state.wishlist.length} products", // Dynamically set the count
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                  WishlistproductWidget(wishlist: state.wishlist) // Pass wishlist data to the widget
                ],
              ),
            );
          } else if (state is WishlistError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
