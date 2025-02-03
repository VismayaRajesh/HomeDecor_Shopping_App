import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homedecor_shopping_app/model/Data_Model/wishlistData.dart';

import '../../../constants/my_app_constants.dart';

part 'wishlistpdctbloc_event.dart';
part 'wishlistpdctbloc_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<LoadPdct>(_onLoadProducts);}

  void _onLoadProducts(LoadPdct event, Emitter<WishlistState> emit) {
    try {
      List<WishlistModel> wishlist = [
        WishlistModel(
            name: "Brown Armless Sofa",
            imageUrl: MyAppConstants.Productimage,
            price: 156.0,
            rating: '4.5',
            brand : 'My site'
        ),
        WishlistModel(
            name: "Eames single chair",
            imageUrl: MyAppConstants.detailschair,
            price: 95.0,
            rating: '4.8',
            brand: 'My artt'
        ),
        WishlistModel(
            name: "Lawson table & chai",
            imageUrl: MyAppConstants.imgw1,
            price: 99.0,
            rating: '4.5',
            brand : 'My artt'
        ),
        WishlistModel(
            name: "Wood lounge sofa",
            imageUrl: MyAppConstants.imgw2,
            price: 140.00,
            rating: '4.6',
            brand : 'My site'
        ),
        WishlistModel(
            name: "Copper stand  lamp",
            imageUrl: MyAppConstants.imgw6,
            price: 85.00,
            rating: '4.2',
            brand : 'Ikeaa'
        ),
        WishlistModel(
            name: "Boucle arm chair",
            imageUrl: MyAppConstants.imgw3,
            price: 175.00,
            rating: '4.5',
            brand : 'Urban'
        ),
        WishlistModel(
            name: "Wood lounge chair",
            imageUrl: MyAppConstants.imgw4,
            price: 110.00,
            rating: '4.3',
            brand : 'Urban'
        ),
        WishlistModel(
            name: "Ash ceramic lamp",
            imageUrl: MyAppConstants.imgw5,
            price: 90.00,
            rating: '4.3',
            brand : 'My art'
        ),
      ];

      emit(WishlistLoad(wishlist: wishlist));
    } catch (e) {
      emit(WishlistError(message: "Failed to load products"));
    }
  }
}
