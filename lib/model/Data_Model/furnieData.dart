import 'package:flutter/cupertino.dart';

class Category {
  final String title;
  final String imageUrl;
  final double space;
  final Widget? route;
  Category( {
    required this.space,
    required this.title,
    required this.imageUrl,
    this.route,

  });
}