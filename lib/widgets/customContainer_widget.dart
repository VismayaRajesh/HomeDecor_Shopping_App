import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  final Icon icon;
  final String name;
  const CustomContainerWidget({super.key, required this.icon, required this.name});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      width: 79,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
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
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: icon,
          ),
          SizedBox(width: 5,),
          Text("$name", style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }
}
