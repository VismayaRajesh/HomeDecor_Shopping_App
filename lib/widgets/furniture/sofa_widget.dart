import 'package:flutter/material.dart';
import 'package:homedecor_shopping_app/constants/My_app_icon.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';
import 'package:homedecor_shopping_app/model/Data_Model/productData.dart';
import 'package:homedecor_shopping_app/widgets/cached_image.dart';
import 'package:homedecor_shopping_app/widgets/rating_widget.dart';

class SofaWidget extends StatelessWidget {
  const SofaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.48, // Exact width
      height: size.height * 0.38, // Exact height
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedImage(imgurl:MyAppConstants.imgw6),
                ),
              ),
              Positioned(
                  top: 14,
                  right: 13,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: Icon(MyAppIcon.favorite,
                      color: Colors.grey.shade300,
                      size: 20,
                    ),
                  )
              ),

              Positioned(
                  bottom: 15,
                  left: 15,
                  child: RatingWidget()
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'brown sofa',
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'my art',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            "Price \$ 140.00",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 30,),
                          Container(
                            height: 27,
                            width: 27,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(21, 19, 68, 1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2,)
                    ],
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
