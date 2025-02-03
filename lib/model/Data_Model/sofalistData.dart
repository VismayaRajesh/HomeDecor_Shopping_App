import 'package:equatable/equatable.dart';

class SofaModel extends Equatable {
  final String name;
  final String imageUrl;
  final double price;
  final String rating;
  final String brand;

  const SofaModel( {
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.brand
  });

  @override
  List<Object?> get props => [name, imageUrl, price, rating, brand];
}