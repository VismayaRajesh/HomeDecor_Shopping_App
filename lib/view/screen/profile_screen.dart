import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';

import '../../widgets/backbutton.dart';
import '../../widgets/furniture/Logoutbtn_widget.dart';
import '../../widgets/furniture/menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final String emuserName;
  const ProfileScreen({super.key, required this.userName, required this.emuserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: AppBar(
          backgroundColor: CupertinoColors.white,
          leading:InkWell(child: BackbuttonWidget(),
            onTap: (){
              Navigator.pop(context);
            },),
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color.fromRGBO(144, 57, 19, 1), width: 1)),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: CupertinoColors.white,
                  child: Text(
                    userName[0].toUpperCase(),
                    style: TextStyle(
                        color: Color.fromRGBO(144, 57, 19, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ),
              title: Text(
                userName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                "Welcome to Furnie",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                MyAppIcon.editt,
                color: Colors.black,
                size: 28,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              height: 138,
              width: 338,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(153, 133, 88, 1),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Unlock Exclusive Benfits",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Furnie member’s club",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Join Now",
                      style: TextStyle(
                          color: Color.fromRGBO(144, 57, 19, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 26)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18), // Add spacing here
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    height: 46,
                    width: 162,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Icon(
                            MyAppIcon.box,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 43.0),
                          child: Text(
                            'My orders',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ),
                        Icon(
                          MyAppIcon.backop,
                          color: Colors.black,
                          size: 19,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  height: 46,
                  width: 162,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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
                          MyAppIcon.truck,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 55.0),
                        child: Text(
                          'Returns',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Icon(
                          MyAppIcon.backop,
                          color: Colors.black,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 255.0),
              child: Text(
                "My Account",
                style: TextStyle(
                    color: Color.fromRGBO(144, 57, 19, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 12.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
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
                      MyAppIcon.outlinedfav,
                      color: Colors.black, size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 245.0),
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'My Reviews', icon: MyAppIcon.reviews, sizename: 188, colors: Colors.black,),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'My Profile', icon: MyAppIcon.profilecircle, sizename: 198, colors: Colors.black,),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'Settings', icon: MyAppIcon.settings, sizename: 210, colors: Colors.black,),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 255.0),
              child: Text(
                "Help Center",
                style: TextStyle(
                    color: Color.fromRGBO(144, 57, 19, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 12.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            MenuWidget(name: 'Customer\nService', icon: MyAppIcon.headphone, sizename: 200, colors: Colors.black,),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'Return Policy', icon: MyAppIcon.returnn, sizename: 176, colors: Colors.black,),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'More', icon: MyAppIcon.more, sizename: 226, colors: Colors.black,),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 172.0),
              child: Text(
                "Feedback & information",
                style: TextStyle(
                    color: Color.fromRGBO(144, 57, 19, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 12.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            MenuWidget(name: 'Policies\n& Licences', icon: MyAppIcon.receipt, sizename: 194, colors: Colors.black,),
            SizedBox(
              height: 15,
            ),
            MenuWidget(name: 'Browse FAQs', icon: MyAppIcon.ques, sizename: 180, colors: Colors.black,),
            SizedBox(
              height: 30,
            ),
            Center(child: LogoutbtnWidget()),
            SizedBox(
              height: 35,
            ),
          ]),
        ));
  }
}
