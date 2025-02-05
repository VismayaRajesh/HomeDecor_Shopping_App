import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedecor_shopping_app/constants/my_app_constants.dart';

import '../../../model/Data_Model/productData.dart';
import 'homepdtbloc_event.dart';
import 'homepdtbloc_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) {
    try {
      List<ProductModel> productList = [
        ProductModel(
          name: "Brown Armless Sofa",
          imageUrl: MyAppConstants.Productimage,
          price: 156.00,
          rating: '4.5',
          brand : 'My site', id: '1'
        ),
        ProductModel(
          name: "Eames single chair",
          imageUrl: MyAppConstants.detailschair,
          price: 95.00,
          rating: '4.8',
          brand: 'My art design', id: '2'
        ),
      ];

      emit(ProductLoaded(products: productList));
    } catch (e) {
      emit(ProductError(message: "Failed to load products"));
    }
  }
}

