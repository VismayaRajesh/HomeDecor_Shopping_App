import 'package:equatable/equatable.dart';

abstract class WishiconEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleWishEvent extends WishiconEvent {
  final String productId;

  ToggleWishEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
