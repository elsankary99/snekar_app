import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.shoe});
  final Shoe shoe;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Image.asset(
          widget.shoe.imagePath,
        ),
        title: Text(widget.shoe.name),
        subtitle: Text('\$ ${widget.shoe.price}'),
        trailing: IconButton(
          onPressed: removeFromCart,
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
