import 'package:equatable/equatable.dart';

abstract class WishState extends Equatable {
  @override
  List<Object> get props => [];
}

class WishInitial extends WishState {
  final Set<String> wishItems;

  WishInitial({this.wishItems = const {}});

  @override
  List<Object> get props => [wishItems];
}