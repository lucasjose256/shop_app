import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/cart.dart';

class CardCartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CardCartItem(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 40),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).deleteItem(productId);
      },
      child: Card(
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
              subtitle: Text('Total: \$${price * quantity}'),
              trailing: Text('$quantity X'),
              leading: CircleAvatar(
                child: Text(title),
              )),
        ),
      ),
    );
  }
}
