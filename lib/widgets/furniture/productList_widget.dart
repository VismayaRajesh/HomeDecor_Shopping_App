import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/widgets/furniture/product_widget.dart';

import '../../view/view_model/homepdct_bloc/homepdtbloc_bloc.dart';
import '../../view/view_model/homepdct_bloc/homepdtbloc_state.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 8.0, left: 8),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ProductWidget(product: state.products[index]),
                );
              },
            ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text("No Products Available"));
        }
      },
    );
  }
}
