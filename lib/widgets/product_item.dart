import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  // bool isFavorite; put as a heart to the card
  const ProductItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetailScreen.routeName, arguments: id),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'ChiviMono',
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart_rounded, size: 20),
              onPressed: () {},
            ),
            leading: IconButton(
              icon: Icon(
                Icons.favorite,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
