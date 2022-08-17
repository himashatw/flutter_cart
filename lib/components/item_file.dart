import 'package:flutter/material.dart';
import 'package:lab_three/data.dart';
import 'package:lab_three/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemFile extends StatelessWidget {
  final Item item;

  const ItemFile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool canAddToCart = !Provider.of<CartProvider>(context).isItemAdded(item);

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              item.image,
            ),
          ),
          Text(
            item.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '${item.price}',
            style: Theme.of(context).textTheme.caption,
          ),
          IconButton(
            disabledColor: Colors.grey,
            icon: const Icon(Icons.shopping_cart),
            onPressed: canAddToCart
                ? () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addItem(item);
                  }
                : null,
          )
        ],
      ),
    );
  }
}
