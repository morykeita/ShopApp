import 'package:flutter/material.dart';
import 'package:my_shop_app/providers/orders.dart';
import 'package:my_shop_app/screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './screens/orders_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
        ),
        home: ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName: (Context) => OrderScreen(),
        },
      ),
    );
  }
}
