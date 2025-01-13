import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/My_app_icon.dart';

class MenuWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final double sizename;
  final Color colors;

  const MenuWidget({super.key, required this.name, required this.icon, required this.sizename, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 336,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
        border: Border.all(color: Colors.white),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              icon,
              color: Colors.black,
              size: 24,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: sizename),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13 ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Icon(
              MyAppIcon.backop,
              color: colors,
              size: 19,
            ),
          ),
        ],
      ),
    );
  }
}
