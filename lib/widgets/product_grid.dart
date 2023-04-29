import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_item.dart';

import '../modules/product.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  const ProductGrid({super.key, required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final productsList = showFavs ? productsData.favorite : productsData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              //this is need for each widget has a provider
              //and be able to chanche some information into his screen
              value: productsList[index],
              child: ProductItem(),
            ));
  }
}
