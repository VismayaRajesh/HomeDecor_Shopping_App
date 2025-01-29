import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/widgets/furniture/notification_widget.dart';

import '../../widgets/backbutton.dart';
import 'menu_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        leading: InkWell(child: BackbuttonWidget(),
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
              return MenuScreen();
            }) );
          },),
        centerTitle: true,
        title: Text("Notification", style: TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.w500),),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12,),
              Container(
                width: 165,
                height: 38,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 4,
                      offset: const Offset(0,4),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Color.fromRGBO(153, 133, 88, 0.4),
                  border: Border.all(
                    color: Color.fromRGBO(153, 133, 88,1), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                child: Center(child: Text("All", style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700, color: Color.fromRGBO(21, 19, 68, 1)),)),
              ),
              Container(
                width: 165,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                    color: Colors.white,
                    border: Border.all(
                    color: Color.fromRGBO(153, 133, 88,1), // Border color// Border width
                  ),
                ),
                child: Center(child: Text("Order Updates", style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600, color: Colors.grey),)),
              ),
            ],
          ),
          SizedBox(height: 26,),
          NotificationWidget(heading: 'Order Confirmed', subheading: 'Your order 12345678910 has been confirmed and is expected to be delivered around 10/12/2023. Our team will start processing your order soon and keep on updating you with the progress.', 
            customnew: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            decoration: BoxDecoration(
              color: Color.fromRGBO(153, 133, 88,1),
            ),
            child: Text(
              'NEW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),),
          SizedBox(height: 14,),

          NotificationWidget(heading: 'Get 10% off on armchairs and coffee tables', subheading: 'Make your living room come alive with our             special offer.',
          custombutton: Container(
            width: 180,
            height: 43,
            decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 8,
                    offset: const Offset(0,2),
                  )
                ]
            ),
            child: Center(child: Text("SHOP NOW", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),)),
          ), customtime: Text("5 days ago, 11:28am", style: TextStyle(color: Colors.grey.shade600, fontSize: 11, fontWeight: FontWeight.w600),),),

          SizedBox(height: 14,),

          NotificationWidget(heading: 'New lower price', subheading: 'Our popular products are reduced prices just for you. Get 10% instant discount* on American Express Cards.',
            custombutton: Container(
              width: 180,
              height: 43,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 8,
                      offset: const Offset(0,2),
                    )
                  ]
              ),
              child: Center(child: Text("SHOP NOW", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),)),
            ), customtime: Text("5 days ago, 11:28am", style: TextStyle(color: Colors.grey.shade600, fontSize: 11, fontWeight: FontWeight.w600),),)
        ],
      ),
    );
  }
}