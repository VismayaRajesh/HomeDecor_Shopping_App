import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String imageUrl, title, description, brand;
  final double price, oldPrice, savings,count;

  CartItem(
      {required this.imageUrl, required this.brand,
        required this.title,
        required this.description,
        required this.price,
        required this.oldPrice,
        required this.savings, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(left: 12,right: 12,top: 12),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 110,
                          height: 115,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(144, 57, 19, 1),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      )
                    ]),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(brand,
                                  style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400)),
                              SizedBox(width: 10,),
                              Container(
                                height:30,
                                width: 76,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(153, 133, 88, 1),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 4,),
                                    Text("Qty: $count",style: TextStyle( color: Colors.white, fontWeight: FontWeight.w400)),
                                    Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 22,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(title,
                              style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(description,
                              style: TextStyle(fontSize: 12, color: Colors.black)),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("\$${price}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(144, 57, 19, 1))),
                              SizedBox(width: 4),
                              Text("\$${oldPrice}",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough)),
                              SizedBox(width: 8),
                              Text("\$${savings} saved",
                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(144, 57, 19, 1),)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey.shade300,),
                Padding(
                  padding: const EdgeInsets.only(left: 23.0),
                  child: Row(
                    children: [
                      Text("Remove",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                      SizedBox(width: 62,),
                      Text("Move to favourites",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                SizedBox(height: 9,)
              ],
            ),
            Positioned(
              bottom: 1,
              left: 122,
              child: Container(
                width: 1,
                height: 40,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}