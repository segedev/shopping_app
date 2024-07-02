import 'package:flutter/material.dart';
import 'package:shopping_app/pages/order_successful_page.dart';
import 'package:shopping_app/widgets/checkout_item.dart';

import '../models/cart_item.dart';
import '../styles/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  final Map<String, CartItem> checkoutItems;
  final Function removeItem;
  final Function addItem;
  final Function clearCheckout;

  const CheckoutPage({
    super.key,
    required this.checkoutItems,
    required this.removeItem,
    required this.addItem,
    required this.clearCheckout,
  });

  double get mytotal {
    return checkoutItems.values.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get subtotal {
    return mytotal + 10;
  }

  @override
  Widget build(BuildContext context) {
    final items = checkoutItems.values.toList();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      color: AppColors.background,
      // width: double.infinity,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Checkout😊',
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            // const SizedBox(height: 10),
            Expanded(
                child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      // color: AppColors.grey,
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(36),
                      //     topRight: Radius.circular(36))
                      ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: double.infinity,
                          child: ListView.builder(
                            itemBuilder: (ctx, i) => CheckoutItem(
                              cartItem: items[i],
                              removeItem: removeItem,
                              addItem: addItem,
                            ),
                            itemCount: checkoutItems.length,
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                        color: Colors.transparent,
                      ),
                      //const SizedBox(height: 80,),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total'),
                                  Text(
                                    '\$${mytotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Shipping Fee'),
                                  Text(
                                    '\$${10.00}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                color: AppColors.background,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Subtotal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    '\$${subtotal.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17),
                                  )
                                ],
                              ),
                              const SizedBox(height: 35),
                              SizedBox(
                                width: double.infinity,
                                height: screenHeight * 0.06,
                                child: MaterialButton(
                                  onPressed: () {
                                    // Handle checkout action
                                    clearCheckout();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const OrderSuccessfulPage()));
                                  },
                                  color: AppColors.background,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Confirm Order',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ]),
    ));

    // Column(
    //   children: [
    //     Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (ctx, i) => CheckoutItem(
    //           product: checkoutItems[i],
    //           removeItem: removeItem
    //         ),
    //         itemCount: checkoutItems.length,
    //       ),
    //     ),
    //     ElevatedButton(
    //       onPressed: () {
    //         Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (ctx) => const OrderSuccessfulPage()
    //           ),
    //         );
    //       },
    //       child: const Text('Place Order'),
    //     )
    //   ],
    // );
  }
}
