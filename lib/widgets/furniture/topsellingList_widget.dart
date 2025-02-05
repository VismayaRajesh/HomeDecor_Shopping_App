import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/widgets/furniture/popularpdt_widget.dart';

class TopsellinglistWidget extends StatelessWidget {
  const TopsellinglistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "imageUrl": MyAppConstants.imgtoslg1,
        "productName": "Queen size wooden bed",
        "brand": "Boho home",
        "price":185.0,
        "rating": "4.8",
      },
      {
        "imageUrl": MyAppConstants.imgtoslg2,
        "productName": "King size upholstered bed",
        "brand": "Urban decor",
        "price": 176.0,
        "rating": "4.7",
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0, left: 8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: PopularpdtWidget(
              imageUrl: product["imageUrl"],
              productName: product["productName"],
              brand: product["brand"],
              price: product["price"],
              rating: product["rating"],
            ),
          );
        },
      ),
    );
  }
}
