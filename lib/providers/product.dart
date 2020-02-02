import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final double price;
  final String description;
  final imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.price,
      this.isFavorite});
}
