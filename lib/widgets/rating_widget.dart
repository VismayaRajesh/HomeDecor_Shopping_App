import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/model/Data_Model/wishlistData.dart';

import '../constants/My_app_icon.dart';
import '../model/Data_Model/productData.dart';

class RatingWidget extends StatelessWidget {
  final ProductModel? product;
  final String? rating;
  const RatingWidget({super.key, this.product, this.rating});

  @override
  Widget build(BuildContext context) {
    String displayRating = rating ?? product?.rating ?? 'No rating';
    return Container(
      height: 20,
      width: 46,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          SizedBox(width: 1),
          Icon(MyAppIcon.star,
            color: Colors.yellow,
            size: 18,
          ),
          Text(displayRating, style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
