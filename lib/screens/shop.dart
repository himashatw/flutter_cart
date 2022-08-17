import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:lab_three/data.dart';
import 'package:lab_three/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class Shop extends StatelessWidget {
  static const String routeName = "/shop";

  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Item> items = Provider.of<CartProvider>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Card(
                elevation: 4,
                child: ListTile(
                  leading: Text(
                    "${index + 1}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  title: Text(items.elementAt(index).name),
                  subtitle: Text(items.elementAt(index).price.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .removeItem(items.elementAt(index));
                      },
                      icon: const Icon(Icons.delete)),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              Provider.of<CartProvider>(context).total.toString(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
