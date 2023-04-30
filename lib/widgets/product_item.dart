import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/cart.dart';
import 'package:shop_app/modules/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap:
            () => //pass the product id for the route, and the Product Overview uses to create the page
                Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                    arguments: product.id),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              product.title,
              style: TextStyle(
                fontFamily: 'ChiviMono',
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart_rounded, size: 20),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
            ),
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20,
              ),
              onPressed: () {
                product.toogleFavorite();
              },
            ),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
