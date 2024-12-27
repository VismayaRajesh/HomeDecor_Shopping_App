import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';

class CategoriesWidget extends StatelessWidget {
  final Widget image;
  final Widget title;
  final double dynamicSpace;
  const CategoriesWidget({super.key, required this.image, required this.title, required this.dynamicSpace});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 100,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 6,
              offset: const Offset(0,0),
            )
          ]
      ),
      child: Row(
        children: [
          SizedBox(width: 6,),
          Container(
            width: 75,
            height: 75,
            child: image,
          ),
          SizedBox(width: 18,),
          title,
          SizedBox(width: dynamicSpace,),
          Icon(MyAppIcon.backop,color: Color.fromRGBO(144, 57, 19, 1),size: 20,)
        ],
      ),
    );
  }
}

// SizedBox(width: 6,),
// Image(image: NetworkImage(MyAppConstants.sofas)),
// SizedBox(width: 20,),
// Text("Sofas", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),),
// SizedBox(width: 122,),
// Icon(MyAppIcon.backop,color: Color.fromRGBO(144, 57, 19, 1),size: 20,)