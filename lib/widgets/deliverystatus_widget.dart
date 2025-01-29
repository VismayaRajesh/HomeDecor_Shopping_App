import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/My_app_icon.dart';

class DeliverystatusWidget extends StatelessWidget {
  final String status;
  final Color color;
  final IconData icon;
  final Color containercolor;
  final String time;
  final double titlespce;
  final double paddingg;
  const DeliverystatusWidget({super.key, required this.status, required this.color, required this.icon, required this.containercolor, required this.time, required this.titlespce,required this.paddingg});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: containercolor,
            shape: BoxShape.circle
        ),
        child: Icon(icon,color: Colors.white,),
      ),
      title: Padding(
        padding: EdgeInsets.only(right: paddingg),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: titlespce),
              child: Text(status,style: TextStyle(color: color,fontSize: 18,fontWeight: FontWeight.w600),),
            ),
            Text(time,style: TextStyle(color: Colors.black,fontSize: 13))
          ],
        ),
      ),
    );
  }
}
