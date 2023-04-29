import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  //This is the scrren wich is responsable for showing to the user all the info for each product
  static const routeName = '/product-detail';

  const ProductDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadesProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    //listen is false for the widget
    // don't be it rebuild after some changes in the list
    return Scaffold(
      appBar: AppBar(title: Text(loadesProduct.title)),
    );
  }
}
