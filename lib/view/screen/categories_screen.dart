import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';


import '../../constants/My_app_icon.dart';
import '../../widgets/backbutton.dart';
import '../../widgets/furniture/categories_widget.dart';
import '../view_model/categories_bloc/furniturebloc_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        leading: BackbuttonWidget(),
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              MyAppIcon.searchh,
              color: Colors.black,
              size: 27,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FurnitureblocBloc, FurnitureblocState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is CategoriesLoaded){
            final categories = state.categories;
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, left: 14, right: 14),
              itemCount: categories.length, // Set the number of items you want in the list
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  // Space between items
                  child: CategoriesWidget(
                    image: CachedNetworkImage(imageUrl: category.imageUrl),
                    title: Text(
                      category.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ), dynamicSpace: category.space,
                  ),
                );
              },
            );
          }
          else if (state is CategoriesError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
