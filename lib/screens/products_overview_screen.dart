import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../modules/product.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';

enum FliterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  List<Product> productsList = [];

  bool showFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Shop App'),
          actions: [
            PopupMenuButton(
                onSelected: ((FliterOptions option) {
                  setState(() {
                    if (option == FliterOptions.Favorites) {
                      showFavorites = true;
                    } else {
                      showFavorites = false;
                    }
                  });
                }),
                itemBuilder: (_) => const [
                      PopupMenuItem(
                        child: Text('Show Favorites'),
                        value: FliterOptions.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('Show All'),
                        value: FliterOptions.All,
                      )
                    ]),
            Consumer<Cart>(
              builder: (context, value, child) => Badge(
                value: value.itemCount.toString(),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
        body: ProductGrid(showFavs: showFavorites));
  }
}
