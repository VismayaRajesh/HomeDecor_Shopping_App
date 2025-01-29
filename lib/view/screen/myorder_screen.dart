import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/view/screen/menu_screen.dart';
import 'package:homedecor_shopping_app/widgets/deliverystatus_widget.dart';

import '../../widgets/backbutton.dart';
import '../../widgets/furniture/ordercard_widget.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(child: BackbuttonWidget(),
        onTap: (){
          Navigator.pop(context);
        },),
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    width: 240,
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                        Border.all(color: Color.fromRGBO(153, 133, 88, 1))),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search in orders",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                      width: 80,
                      height: 45,
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: Color.fromRGBO(153, 133, 88, 1))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.filter_list,
                            size: 24,
                            weight: 600,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          )
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Container(
              height: 10,
              width: 400,
              color: Colors.grey.shade200,
            ),

            const SizedBox(height: 8),

            DeliverystatusWidget(
              status: 'On Process',
              color: Colors.green,
              icon: MyAppIcon.box,
              containercolor: Colors.green,
              time: 'Arriving by sat, 2 dec',
              titlespce: 33,
              paddingg: 133,
            ),

            const SizedBox(height: 10),

            OrderCard(
              date: "Arriving by Sat, 2 Dec",
              productImage: MyAppConstants.Productimage, // Replace with your asset
              storeName: "My Art Design",
              productName: "Eames Single Chair",
              productColor: "White",
              orderId: "#12345678910",
              orderStatus: "Shipped",
              replacementAvailable: true,
            ),

            const SizedBox(height: 2),

            Container(
              height: 10,
              width: 400,
              color: Colors.grey.shade200,
            ),

            const SizedBox(height: 6),

            DeliverystatusWidget(
              status: 'Delivered',
              color: Colors.green,
              icon: Icons.delivery_dining_outlined,
              containercolor: Color.fromRGBO(153, 133, 88, 1),
              time: 'On Wed, 27 sep',
              titlespce: 18,
              paddingg: 166,
            ),

            const SizedBox(height: 6),

            OrderCard(
              date: "On Wed, 27 Sep",
              productImage: MyAppConstants.Productimage,
              storeName: "Boho Home",
              productName: "Brown Armless Couch",
              productColor: "Brown",
              orderId: "#12345678911",
              orderStatus: "Delivered",
              returnWindow: "Exchange/Return window closed on 11 Oct",
              showRating: true,
            ),
            const SizedBox(height: 2),

            Container(
              height: 10,
              width: 400,
              color: Colors.grey.shade200,
            ),

            const SizedBox(height: 6),

            DeliverystatusWidget(
              status: 'Cancelled',
              color: Colors.green,
              icon: MyAppIcon.close,
              containercolor: Color.fromRGBO(153, 133, 88, 1),
              time: 'On Fri, 11 aug as per your request',
              titlespce: 125,
              paddingg: 54,
            ),

            const SizedBox(height: 6),

            OrderCard(
              date: "On Fri, 11 Aug as per your request",
              productImage: MyAppConstants.blackwhite,
              storeName: "Boho Home",
              productName: "Eames Single Chair",
              productColor: "White",
              orderId: "#12345678912",
              orderStatus: "Cancelled",
            ),
          ],
        ),
      ),
    );
  }

}
