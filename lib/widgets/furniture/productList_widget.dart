import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'product_widget.dart';

class ProductListWidget extends StatelessWidget {
  final int count;
  const ProductListWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 8.0,top: 5.0,bottom: 8.0,left: 8),
        child: LayoutBuilder( // Ensure size constraints are respected
          builder: (context, constraints) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),  // Disable grid scrolling
              shrinkWrap: true,  // Fit content within the parent scroll
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: count,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ProductWidget(),
                );
              },
            );
          },
        ),
      );
  }
}
