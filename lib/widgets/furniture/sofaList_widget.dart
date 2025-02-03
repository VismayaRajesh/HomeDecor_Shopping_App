import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/widgets/furniture/sofa_widget.dart';

class SofalistWidget extends StatelessWidget {
  const SofalistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0, left: 8),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          // Replace the recursive call with SofaWidget
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SofaWidget(), // Use SofaWidget here
          );
        },
      ),
    );
  }
}
