import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/model/Data_Model/wishlistData.dart'; // Update the import

import '../../constants/My_app_icon.dart';
import '../../constants/my_app_constants.dart';
import '../cached_image.dart';
import '../rating_widget.dart';

class WishlistproductWidget extends StatelessWidget {
  final List<WishlistModel> wishlist; // Add the wishlist data as a parameter

  const WishlistproductWidget({super.key, required this.wishlist});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0, left: 8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemCount: wishlist.length, // Use the dynamic length
            itemBuilder: (BuildContext context, int index) {
              final item = wishlist[index]; // Get the item at the current index
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: size.width * 0.48,
                  height: size.height * 0.38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 9.0, bottom: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedImage(
                                imgurl: item.imageUrl, // Use dynamic image URL
                              ),
                            ),
                          ),
                          Positioned(
                            top: 14,
                            right: 13,
                            child: Container(
                              height: 23,
                              width: 23,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(153, 133, 88, 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Icon(
                                MyAppIcon.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: RatingWidget(rating : item.rating), // Pass dynamic rating
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.brand, // Use dynamic brand name
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                      color: Colors.grey
                                  ),
                                ),
                                SizedBox(width: 50),
                                Text("\$${item.price}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color.fromRGBO(144, 57, 19, 1))),
                              ],
                            ),
                            Text(
                              item.name, // Use dynamic product name
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: constraints.maxWidth,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(153, 133, 88, 1),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 22),
                            Text("Move to cart", style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.w500, fontSize: 15)),
                            SizedBox(width: 8),
                            Icon(MyAppIcon.cart, color: CupertinoColors.white, size: 20)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
