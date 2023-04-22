import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../modules/product.dart';
import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  List<Product> productsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop App'),
        ),
        body: ProductGrid());
  }
}
