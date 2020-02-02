import 'package:flutter/material.dart';
import 'package:my_shop_app/widgets/app_drawer.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';

import './cart_screen.dart';

enum filterOptions { Favorites, All }

class ProductsOverViewScreen extends StatefulWidget {
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverViewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: filterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: filterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch, // forward to child of the badge
              value: cart.itemsCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
