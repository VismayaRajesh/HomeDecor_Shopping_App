import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/view/screen/address_screen.dart';
import 'package:homedecor_shopping_app/view/screen/bottomnav_screen.dart';
import 'package:homedecor_shopping_app/view/screen/wishlist_screen.dart';
import 'package:homedecor_shopping_app/widgets/backbutton.dart';

import '../../widgets/furniture/cartitem_widget.dart';
import '../../widgets/furniture/footer_widget.dart';
import '../../widgets/stepper_widget.dart';

class CartScreen extends StatelessWidget {
  final String? userName;
  const CartScreen({super.key, this.userName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(child: BackbuttonWidget(),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return BottomnavScreen(userName: userName);
            }));
          },),
        centerTitle: true,
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return WishlistScreen();
            }));
          }, icon: Icon(MyAppIcon.outlinedfav))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepperWidget(currentStep: 0),
                  SizedBox(height: 15),
                  Container(
                    height: 65,
                    width: 500,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Checkboxx(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text("2 Items selected (\$239.00)",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Icon(MyAppIcon.share),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Icon(Icons.delete_outline),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  CartItem(
                    imageUrl: MyAppConstants.Productimage,
                    title: "Eames single chair",
                    description:
                        "My art design | 29' x 52' wide tufted eames chair - Green",
                    price: 95,
                    oldPrice: 110,
                    savings: 15, brand: 'My art design', count: 1,
                  ),
                  CartItem(
                    imageUrl: MyAppConstants.Productimage,
                    title: "Wood lounge sofa",
                    description:
                        "Urban decor | 4' x 6' Feet, 2 seater | folding sofa - Blue",
                    price: 140,
                    oldPrice: 165,
                    savings: 25, brand: 'My art design', count: 2,
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 40,
                    width: 400,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Coupons",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 12,right: 12,top: 4,bottom: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 0), // Adds slight vertical shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 2,),
                    Icon(Icons.discount_outlined,color: Color.fromRGBO(153, 133, 88, 1),),
                    Padding(
                      padding: const EdgeInsets.only(right: 90.0),
                      child: Text("Apply Coupon",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                    TextButton(onPressed: () {}, child: Text("Select",style: TextStyle(color: Color.fromRGBO(144, 57, 19, 1),fontWeight: FontWeight.w500,fontSize: 16 ),))
                  ],
                ),
              ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 400,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Price Details",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
                          SizedBox(width: 4,),
                          Text("(2 Items)",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.only(left: 12,right: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Total MRP",style: TextStyle(fontSize: 15),), Text("\$235.00",style: TextStyle(fontSize: 15),)],
                          ),
                          SizedBox(height: 4,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Order Savings",style: TextStyle(fontSize: 15),),
                              Text("\$40.00", style: TextStyle(color: Colors.blue,fontSize: 15))
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("\$197.00",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromRGBO(144, 57, 19, 1))),
                                  Text("View Details",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color.fromRGBO(144, 57, 19, 1)))
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                                    return AddressScreen(userName: userName);
                                  }));
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Color.fromRGBO(153, 133, 88, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14), // Adjust the corner radius as needed
                                  ),
                                  minimumSize: Size(155, 50),),
                                child: Center(child: Row(
                                  children: [
                                    Text("Checkout",style: TextStyle(color: Colors.white,fontSize: 16),),
                                    SizedBox(width: 6,),
                                    Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,)
                                  ],
                                )),
                              )
                            ],
                          ),
                        ],
                      ),),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: 400,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Return/Refund policy",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                      "In case of return, we ensure quick refunds. Full amount will be refunded excluding Shipping Fee.",
                      style: TextStyle(color: Colors.black)),
                  SizedBox(height: 6),
                  Text(
                      "Read Policy",
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                  SizedBox(height: 2),
                ],
              ),
            ),
            FooterWidget(),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  Widget Checkboxx() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromRGBO(144, 57, 19, 1),
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}
