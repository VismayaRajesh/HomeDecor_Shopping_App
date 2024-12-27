import 'package:flutter/cupertino.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';

class BackbuttonWidget extends StatelessWidget {
  const BackbuttonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 18.0,top: 18.0,bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(153, 133, 88, 1)
        ),
        child: Icon(MyAppIcon.back,color: CupertinoColors.white,size: 12,),
      ),
    );
  }
}
