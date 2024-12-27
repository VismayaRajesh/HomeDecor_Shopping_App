import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String heading;
  final String subheading;
  final Widget? customnew;
  final Widget? customtime;
  final Widget? custombutton;

  const NotificationWidget({super.key, required this.heading, required this.subheading, this.customnew, this.customtime, this.custombutton});

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 150,
        width: 335,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0,2),
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
                height: 180,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  color: Color.fromRGBO(153, 133, 88,1),
                )
            ),
            Positioned(
              top: 16,
              left: 26,
              child: Text(
                heading,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6, left: 26.0, top: 46),
              child: Text(
                subheading,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
                maxLines: 4, // Limits to 4 lines
                overflow: TextOverflow.ellipsis, // Ensures extra text is truncated
              ),
            ),
            if(customtime!=null)
              Positioned(
                bottom: 2,
                right: 12,
                child: customtime!,
              ),

            if (customnew != null)
              Positioned(
                top: 16,
                right: 1,
                child: customnew!,
              ),

            if(custombutton!= null)
            Positioned(
              bottom: 22,
              left: 81,
              child: custombutton!
            )
            

          ],
        )
    );
  }
}
// Text("5 days ago, 11:28am", style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600),)

// Container(
// width: 180,
// height: 50,
// decoration: BoxDecoration(
// color: CupertinoColors.white,
// borderRadius: BorderRadius.circular(12),
// boxShadow: [
// BoxShadow(
// color: Colors.grey.shade400,
// blurRadius: 8,
// offset: const Offset(0,2),
// )
// ]
// ),
// child: Center(child: Text("SHOP NOW", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),)),
// ),