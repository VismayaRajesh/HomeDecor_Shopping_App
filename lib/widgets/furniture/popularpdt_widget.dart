import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/widgets/cached_image.dart';
import 'package:homedecor_shopping_app/widgets/rating_widget.dart';

class PopularpdtWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String brand;
  final double price;
  final String rating;

  const PopularpdtWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.brand,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.48,
      height: size.height * 0.38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedImage(imgurl: imageUrl),
                ),
              ),
              Positioned(
                top: 14,
                right: 13,
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.grey.shade300,
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: RatingWidget(rating: rating),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  brand,
                  style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      "Price \$ $price",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Container(
                      height: 27,
                      width: 27,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(21, 19, 68, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
