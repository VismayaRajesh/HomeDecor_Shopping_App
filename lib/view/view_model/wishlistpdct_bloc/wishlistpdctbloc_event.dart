part of 'wishlistpdctbloc_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadPdct extends WishlistEvent {}