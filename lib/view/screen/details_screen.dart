import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';

import '../../widgets/backbutton.dart';
import '../../widgets/furniture/footer_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(child: BackbuttonWidget(),
        onTap: (){
          Navigator.pop(context);
        },),
        title: Text(
          "Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(MyAppIcon.share, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(MyAppIcon.bag, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            CachedNetworkImage(
              imageUrl: MyAppConstants.detailschair,
              fit: BoxFit.cover,
              height: 400,
              width: double.infinity,
            ),
            // Favorite Icon
            Positioned(
              top: 21,
              right: 18,
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  MyAppIcon.favorite,
                  color: Colors.grey.shade300,
                  size: 20,
                ),
              ),
            ),
            // Color Options
            Positioned(
              top: 16,
              left: 18,
              child: Container(
                height: 130,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(backgroundColor: Color(0xFFDEDCCD), radius: 10),
                    SizedBox(height: 10),
                    CircleAvatar(backgroundColor: Color(0xFFA4B4FF), radius: 10),
                    SizedBox(height: 10),
                    CircleAvatar(backgroundColor: Color(0xFFD8ADF4), radius: 10),
                    SizedBox(height: 10),
                    CircleAvatar(backgroundColor: Color(0xFFF3C0AD), radius: 10),
                  ],
                ),
              ),
            ),
            // Scrollable Content
            Column(
              children: [
                SizedBox(height: 380), // Spacer below the image
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Product Title and Rating
                      Row(
                        children: [
                          Text(
                            'Eames Single Chair',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 28,),
                          Container(
                            height: 52,
                            width: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Color.fromRGBO(153, 133, 88, 1),
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(153, 133, 88, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(Icons.remove, color: Colors.white, size: 21,),
                                ),
                                SizedBox(width: 7,),
                                Text('1', style: TextStyle(fontSize: 19)),
                                SizedBox(width: 7,),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(153, 133, 88, 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(Icons.add,color: Colors.white, size: 21,),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'My art design',
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(MyAppIcon.star, color: Colors.yellow.shade600, size: 21),
                          SizedBox(width: 2),
                          Text(
                            '4.8 (250 Reviews)',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Description Section
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Designed the Eames chair with luxurious curves in an organic yet structured design that holds the sitting body and provides a feeling of relaxation while offering excellent back support.',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                      Text(
                        'Read more...',
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '\$95.00',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(144, 57, 19, 1)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      // Add to Cart and Buy Now Buttons
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(153, 133, 88, 0.7),
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 110),
                            ),
                            child: Row(
                              children: [
                                Text('Add to Cart',style: TextStyle(color: Colors.white, fontSize: 14),),
                                SizedBox(width: 8,),
                                Icon(MyAppIcon.cart,color: Colors.white,)
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(153, 133, 88, 1),
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 110),
                            ),
                            child: Row(
                              children: [
                                Text('Buy Now',style: TextStyle(color: Colors.white)),
                                SizedBox(width: 8,),
                                Icon(MyAppIcon.bag,color: Colors.white,)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      // Highlights Section
                      Text(
                        'Top Highlights',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 14),
                      Row(
                        children: [
                          Text(
                            'Brand\n\nColor\n\nMaterial\n\nDimensions\n\nSize\n\nNet Quantity',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 80,),
                          Text(
                            'My Art Design\n\nWhite\n\nMango Wood\n\n600 x 720 x 824 (cm)\n\nStandard\n\n1.00 count',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(144, 57, 19, 1),
                                shape: BoxShape.circle
                              ),
                            ),
                          ),
                          SizedBox(width: 11,),
                          Text("This Upholstered Eames chair brings\ntrendsetting good looks to your living room\nwith its gently curved corners and sleek yet\nsturdy wooden legs.",
                          style: TextStyle(fontWeight: FontWeight.w400),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 23.0),
                            child: Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(144, 57, 19, 1),
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          SizedBox(width: 11,),
                          Text("Living Room, Dining Room, Home office\nBedroom",
                            style: TextStyle(fontWeight: FontWeight.w400),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 180.0),
                            child: Container(
                              height: 11,
                              width: 11,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(144, 57, 19, 1),
                                  shape: BoxShape.circle
                              ),
                            ),
                          ),
                          SizedBox(width: 11,),
                          Text("Care Instructions - Avoid a cleaning\nproduct that contains ammonia or bleach.\nFor cleaning alwaysmmchoose a mild\ncleaning agent without sanding qualities.\nAvoid direct sunlight & humid environment.\nRemember that the care instructions can\nvery based on the type of wood, finish and\nconstruction of the furniture. Always\nconsult the manufacturer’s\nrecommendations if available.",
                            style: TextStyle(fontWeight: FontWeight.w400),)
                        ],
                      ),
                      SizedBox(height: 12,),
                    ],
                  ),
                ),
                FooterWidget(),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
