import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/My_app_icon.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          Text("4.3", style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
