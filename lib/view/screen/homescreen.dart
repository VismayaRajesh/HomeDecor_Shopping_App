import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/view/screen/cart_screen.dart';
import 'package:homedecor_shopping_app/view/screen/details_screen.dart';
import 'package:homedecor_shopping_app/view/screen/menu_screen.dart';

import '../../constants/My_app_icon.dart';
import '../../widgets/customContainer_widget.dart';
import '../../widgets/furniture/productList_widget.dart';
import '../../widgets/subheading_widget.dart';

// home_screen.dart
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
              const CircleAvatar(
                child: Text("A"),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Hello',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Anjali",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
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
                    return CartScreen();
                  }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, top: 3.0, right: 5.0),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black, size: 28),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                    return MenuScreen();
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
              const SizedBox(height: 20),
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
              const SizedBox(height: 22),
              const SubheadingWidget(name: "Categories          "),
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
              const SubheadingWidget(name: "New Arrivals      "),
              InkWell(child: ProductListWidget(count: 2),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return DetailPage();
                }));
              },),
              const SubheadingWidget(name: "Popular              "),
              ProductListWidget(count: 2),
              const SubheadingWidget(name: "Recently Added", ),
              ProductListWidget(count: 2),
              const SubheadingWidget(name: "Top Selling        ", ),
              ProductListWidget(count: 2),
              SizedBox(height: 6,)
            ],
          ),
        )
    );
  }
}

