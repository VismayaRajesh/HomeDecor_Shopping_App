import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/model/Data_Model/productData.dart';
import 'package:homedecor_shopping_app/widgets/cached_image.dart';
import 'package:homedecor_shopping_app/widgets/rating_widget.dart';

import '../../view/view_model/wishicon_bloc/wishiconbloc_bloc.dart';
import '../../view/view_model/wishicon_bloc/wishiconbloc_event.dart';
import '../../view/view_model/wishicon_bloc/wishiconbloc_state.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  const ProductWidget({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.48,
      height: size.height * 0.38,
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
                  child: CachedImage(imgurl: product.imageUrl),
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
                  child: BlocBuilder<WishBloc, WishState>(
                    builder: (context, state) {
                      final isWishlisted = state is WishInitial && state.wishItems.contains(product.id);
                      return InkWell(
                        onTap: () {
                          context.read<WishBloc>().add(ToggleWishEvent(product.id));

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isWishlisted ? "Removed from Wishlist" : "Added to Wishlist",style: TextStyle(fontWeight: FontWeight.w500)),
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isWishlisted ? Colors.red : Colors.grey.shade300,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),

              Positioned(
                bottom: 15,
                left: 15,
                child: RatingWidget(product: product,)
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
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                   Text(
                    product.brand,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                  Row(
                    children: [
                       Text(
                        "Price \$${product.price}",
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
