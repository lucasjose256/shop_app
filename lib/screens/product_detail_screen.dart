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
    final loadedProducts =
        Provider.of<Products>(context, listen: false).findById(productId);
    //listen is false for the widget
    // don't be it rebuild after some changes in the list
    return Scaffold(
      appBar: AppBar(title: Text(loadedProducts.title)),
      body: Column(children: [
        Container(
          height: 300,
          width: double.infinity,
          child: Image.network(
            loadedProducts.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '\$${loadedProducts.price}',
          style: TextStyle(
              color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          width: double.infinity,
          child: Text(
            loadedProducts.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        )
      ]),
    );
  }
}
