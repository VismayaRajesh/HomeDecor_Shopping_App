import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/view/screen/categories_screen.dart';

class SubheadingWidget extends StatelessWidget {
  final String? userName;
  final String? emuserName;
  final String name;
  const SubheadingWidget({super.key, required this.name, this.userName, this.emuserName});

  @override
  Widget build(BuildContext context) {
    return  Align(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Text(
              "$name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 160,
            ),
            InkWell(
              child: Text(
                "view all",
                style: TextStyle(fontSize: 16),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return CategoriesScreen(userName: userName);
                }));
              },
            )
          ],
        ),
      ),
      alignment: Alignment.topLeft,
    );
  }
}
