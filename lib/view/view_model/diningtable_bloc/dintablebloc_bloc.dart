import 'package:bloc/bloc.dart';
import 'package:homedecor_shopping_app/model/Data_Model/dintableData.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_event.dart';
import 'package:homedecor_shopping_app/view/view_model/diningtable_bloc/dintablebloc_state.dart';

import '../../../constants/my_app_constants.dart';

class DintableBloc extends Bloc<DintableEvent, DintableState> {
  DintableBloc() : super(DintableInitial()) {
    on<Loaddinpdt>(_Loadsofapdt);
  }
  void _Loadsofapdt(Loaddinpdt event, Emitter<DintableState> emit) {
    try {
      List<DintableModel> dinList = [
        DintableModel(
            name: "Rustic Wooden Dining",
            imageUrl: MyAppConstants.imgd1,
            price: 250.00,
            rating: '4.7',
            brand: 'Classic Homes'),
        DintableModel(
            name: "Elegant Glass-Top Dining",
            imageUrl: MyAppConstants.imgd2,
            price: 320.00,
            rating: '4.8',
            brand: 'Modern Elegance'),
        DintableModel(
            name: "Scandinavian Oak Dining",
            imageUrl: MyAppConstants.imgd3,
            price: 280.00,
            rating: '4.6',
            brand: 'Nordic Styles'),
        DintableModel(
            name: "Minimalist Round Dining",
            imageUrl: MyAppConstants.imgd4,
            price: 200.00,
            rating: '4.5',
            brand: 'Urban Living'),
        DintableModel(
            name: "Vintage Farmhouse Dining",
            imageUrl: MyAppConstants.imgd5,
            price: 275.00,
            rating: '4.4',
            brand: 'Rustic Charm'),
        DintableModel(
            name: "Black & Red Dining set",
            imageUrl: MyAppConstants.imgd6,
            price: 350.00,
            rating: '4.9',
            brand: 'Avant-Garde'),
        DintableModel(
            name: "Luxury Marble Dining",
            imageUrl: MyAppConstants.imgd7,
            price: 500.00,
            rating: '5.0',
            brand: 'Prestige Interiors'),
        DintableModel(
            name: "Compact Wooden Dining",
            imageUrl: MyAppConstants.imgd8,
            price: 190.00,
            rating: '4.3',
            brand: 'Space Savers'),
      ];

      emit(dinpdctLoaded(din: dinList));
    } catch (e) {
      emit(dinError(message: "Failed to load products"));
    }
  }
}
