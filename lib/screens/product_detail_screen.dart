import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
//  final String title;
//  final double price;
//
//  ProductDetailScreen({this.title,this.price});
  static const String routeName = 'productDetailRoute';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String; //
    final loadedProduct = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId); // don't listen to updates
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
