import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/view/screen/myorder_screen.dart';
import 'package:homedecor_shopping_app/view/screen/notification_screen.dart';
import 'package:homedecor_shopping_app/view/screen/profile_screen.dart';
import 'package:homedecor_shopping_app/view/screen/wishlist_screen.dart';

import '../../constants/My_app_icon.dart';
import '../../widgets/furniture/menu_widget.dart';
import 'bottomnav_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.white,
        centerTitle: true,
        title: Text(
          "Menu",
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 17.0, top: 17.0, bottom: 17.0),
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(153, 133, 88, 1)),
              child: InkWell(
                  child: Icon(MyAppIcon.close,
                      color: CupertinoColors.white, size: 18),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return BottomnavScreen();
                    }));
                  }),
            ),
          )
        ],
      ),
      backgroundColor: CupertinoColors.white,
      body: Column(
        children: [
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
                  "AM",
                  style: TextStyle(
                      color: Color.fromRGBO(144, 57, 19, 1),
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
            title: Text(
              "Anjali M",
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
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            child: MenuWidget(
              name: 'My Orders',
              icon: MyAppIcon.box,
              sizename: 200,
              colors: Color.fromRGBO(144, 57, 19, 1),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return MyOrderScreen();
              }));
            },
          ),
          SizedBox(
            height: 14,
          ),
          InkWell(
            child: MenuWidget(
                name: 'My Profile',
                icon: MyAppIcon.profilecircle,
                sizename: 200,
                colors: Color.fromRGBO(144, 57, 19, 1)),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return ProfileScreen();
                  }));
            },
          ),
          SizedBox(
            height: 14,
          ),
          InkWell(
            child: MenuWidget(
                name: 'Wishlist',
                icon: MyAppIcon.outlinedfav,
                sizename: 214,
                colors: Color.fromRGBO(144, 57, 19, 1)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return WishlistScreen();
              }));
            },
          ),
          SizedBox(
            height: 14,
          ),
          InkWell(
              child: MenuWidget(
                  name: 'Notifications',
                  icon: MyAppIcon.notification,
                  sizename: 185,
                  colors: Color.fromRGBO(144, 57, 19, 1)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return NotificationScreen();
                }));
              }),
          SizedBox(
            height: 14,
          ),
          MenuWidget(
              name: 'Rate my app',
              icon: MyAppIcon.outlinedstar,
              sizename: 192,
              colors: Color.fromRGBO(144, 57, 19, 1)),
          SizedBox(
            height: 14,
          ),
          MenuWidget(
              name: 'Customer Service',
              icon: MyAppIcon.headphone,
              sizename: 158,
              colors: Color.fromRGBO(144, 57, 19, 1)),
          SizedBox(
            height: 14,
          ),
          MenuWidget(
              name: 'Settings',
              icon: MyAppIcon.settings,
              sizename: 214,
              colors: Color.fromRGBO(144, 57, 19, 1))
        ],
      ),
    );
  }
}
