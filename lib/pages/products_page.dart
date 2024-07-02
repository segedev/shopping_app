import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/product_item.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;
  final Function addItem;
  final Function removeItem;
  final Map<String, CartItem> checkoutItems;

  const ProductsPage(
      {super.key, required this.products, required this.addItem, required this.removeItem, required this.checkoutItems,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (cts, i) => ProductItem(
          product: products[i],
          addItem: addItem,
          removeItem: removeItem,
          quantity: checkoutItems[products[i].id]?.quantity ?? 0,
        ),
    );
  }
}
