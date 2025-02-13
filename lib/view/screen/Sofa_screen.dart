import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/widgets/backbutton.dart';
import 'package:homedecor_shopping_app/widgets/furniture/sofaList_widget.dart';

import '../../constants/My_app_icon.dart';

class SofaScreen extends StatelessWidget {
  final String? userName;
  final String? emuserName;
  const SofaScreen({super.key, this.userName, this.emuserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(child: BackbuttonWidget(),
        onTap: (){
          Navigator.pop(context,userName);
        },),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sofas",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "50 Products",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(MyAppIcon.searchh, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyAppIcon.outlinedfav, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(MyAppIcon.cart, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(child: SofalistWidget()),
    );
  }
}
