part of 'wishlistpdctbloc_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

final class WishlistInitial extends WishlistState {}

class WishlistLoad extends WishlistState {
  final List<WishlistModel> wishlist;

  const WishlistLoad({required this.wishlist});

  @override
  List<Object?> get props => [wishlist];
}

class WishlistError extends WishlistState {
  final String message;
  const WishlistError({required this.message});

  @override
  List<Object?> get props => [message];
}
