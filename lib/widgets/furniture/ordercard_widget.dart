import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
      final String date;
      final String productImage;
      final String storeName;
      final String productName;
      final String productColor;
      final String orderId;
      final String orderStatus;
      final String? returnWindow;
      final bool replacementAvailable;
      final bool showRating;
  const OrderCard({super.key, required this.date, required this.productImage, required this.storeName, required this.productName, required this.productColor, required this.orderId, required this.orderStatus, this.returnWindow, this.replacementAvailable = false, this.showRating = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 14,right: 14,top: 12,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2), // White border
                  borderRadius: BorderRadius.circular(10), // Match ClipRRect border radius
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: CachedNetworkImageProvider(productImage),
                    width: 125,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(storeName,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                      ],
                    ),
                    Text(
                      productName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("$productColor",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black)),
                    Text("Order ID $orderId",
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black)),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        OrderButton("Cancel"),
                        const SizedBox(width: 8),
                        OrderButton("Replace"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (orderStatus != "Delivered" && orderStatus != "Cancelled")
                Text("Status: $orderStatus",
                    style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
            ],
          ),

          if (replacementAvailable) ...[
            Row(
              children: [
                Icon(Icons.find_replace_outlined,color: Colors.black,),
                SizedBox(width: 3,),
                const Text("Replacement is available",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                SizedBox(width:48,),
                TextButton(
                  onPressed: () {},
                  child: const Text("Know More",
                      style: TextStyle(fontSize: 14, color: Color.fromRGBO(144, 57, 19, 1))),
                ),
              ],
            ),
          ],

          if (returnWindow != null) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.local_shipping_outlined),
                SizedBox(width: 4,),
                Text(returnWindow!,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ],

          if (showRating) ...[
            const SizedBox(height: 6),

            Row(
              children: [
                const Text("Rate this product",
                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                const SizedBox(width: 8),
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(Icons.star_border,
                        color: Color.fromRGBO(144, 57, 19, 1), size: 20);
                  }),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget OrderButton(String text) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        side: BorderSide(color: Colors.black),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.black, fontSize: 14)),
    );
  }
  }
