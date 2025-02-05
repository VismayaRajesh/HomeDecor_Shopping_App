import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/model/Data_Model/sofalistData.dart';
import 'package:homedecor_shopping_app/widgets/cached_image.dart';
import 'package:homedecor_shopping_app/widgets/rating_widget.dart';

class SofaWidget extends StatelessWidget {
  final SofaModel sofa;

  const SofaWidget({super.key, required this.sofa});

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
                  child: CachedImage(imgurl: sofa.imageUrl), // Dynamic image
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
                  child: Icon(Icons.favorite_border, color: Colors.grey.shade300, size: 20),
                ),
              ),
              Positioned(bottom: 15, left: 15, child: RatingWidget(rating: sofa.rating)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sofa.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
                const SizedBox(height: 2),
                Text(
                  sofa.brand,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      "Price \$ ${sofa.price.toStringAsFixed(2)}",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(width: 30),
                    Container(
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(21, 19, 68, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
