import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/view/screen/cart_screen.dart';
import 'package:homedecor_shopping_app/view/screen/details_screen.dart';
import 'package:homedecor_shopping_app/view/screen/menu_screen.dart';
import 'package:homedecor_shopping_app/widgets/furniture/topsellingList_widget.dart';

import '../../constants/My_app_icon.dart';
import '../../widgets/customContainer_widget.dart';
import '../../widgets/furniture/popularlist_widget.dart';
import '../../widgets/furniture/productList_widget.dart';
import '../../widgets/furniture/rcntlyaddedList_widget.dart';
import '../../widgets/subheading_widget.dart';


class Homescreen extends StatelessWidget {
  final String userName;
  final String emuserName;
   Homescreen({super.key, required this.userName, required this.emuserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 65,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Row(
            children: [
              CircleAvatar(
                child: Text(userName[0].toUpperCase(),style: TextStyle(fontSize: 18),),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, top: 3.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return CartScreen(userName: userName);
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, top: 3.0, right: 5.0),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return MenuScreen(userName: userName);
                  }));
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 18.0, right: 200.0),
                child: const Text(
                  "Let's find the best furniture for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 4,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          border: Border.all(color: Colors.white),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 12),
                            prefixIcon: Icon(MyAppIcon.searchh,
                                color: Colors.grey.shade600),
                            hintText: "Search for furnitures...",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                            suffixIcon:
                            Icon(MyAppIcon.mic, color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      height: 46,
                      width: 70,
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
                      child: IconButton(
                        icon: Icon(MyAppIcon.camera),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SubheadingWidget(name: "Categories          ",userName: userName),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    CustomContainerWidget(
                      icon: Icon(MyAppIcon.bed, color: Colors.grey),
                      name: 'Bed',
                    ),
                    const SizedBox(width: 7),
                    CustomContainerWidget(
                      icon: Icon(MyAppIcon.chair, color: Colors.grey),
                      name: 'Chair',
                    ),
                    const SizedBox(width: 7),
                    CustomContainerWidget(
                      icon: Icon(MyAppIcon.sofas, color: Colors.grey),
                      name: 'Sofas',
                    ),
                    const SizedBox(width: 7),
                    CustomContainerWidget(
                      icon: Icon(MyAppIcon.table, color: Colors.grey),
                      name: 'Table',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SubheadingWidget(name: "New Arrivals      ",userName: userName),
              InkWell(child: ProductListWidget(),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return DetailPage();
                }));
              },),
              SubheadingWidget(name: "Popular              ",userName: userName),
              PopularlistWidget(),
              SubheadingWidget(name: "Recently Added",userName: userName ),
              RecentlyaddedList(),
              SubheadingWidget(name: "Top Selling        ",userName: userName ),
              TopsellinglistWidget(),
              SizedBox(height: 6,)
            ],
          ),
        )
    );
  }
}

