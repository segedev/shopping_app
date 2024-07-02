import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function addItem;
  final Function removeItem;
  final int quantity;

  const ProductItem(
      {super.key,
      required this.product,
      required this.addItem,
      required this.removeItem,
      required this.quantity
    });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // return ListTile(
    //   title: Text(product.title),
    //   subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
    //   trailing: IconButton(
    //     onPressed: () {
    //       addItem(product);
    //     },
    //     icon: const Icon(Icons.add),
    //   ),
    // );

    return Container(
      margin: EdgeInsets.only(
        left: screenHeight / 42.2,
        right: screenHeight / 42.2,
        bottom: screenHeight / 84.4,
      ),
      child: Container(
        // color: AppColors.white,
        width: screenWidth / 3.25,
        height: screenWidth / 3.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(screenHeight / 42.2),
            bottomRight: Radius.circular(screenHeight / 42.2),
            topLeft: Radius.circular(screenHeight / 42.2),
            bottomLeft: Radius.circular(screenHeight / 42.2),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            //image section
            Container(
              width: screenWidth / 3.9,
              height: screenWidth / 3.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight / 42.2),
                color: Colors.white38,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(product.img)),
              ),
            ),
            //text container
            Expanded(
              child: Container(
                height: screenWidth / 3.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(screenHeight / 42.2),
                    bottomRight: Radius.circular(screenHeight / 42.2),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenHeight / 84.4,
                    right: screenHeight / 84.4,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: product.title,
                        size: 15,
                      ),
                      SizedBox(
                        height: screenHeight / 234.4,
                      ),
                      SmallText(text: product.description),
                      SizedBox(
                        height: screenHeight / 294.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${product.price.toStringAsFixed(2)}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    removeItem(product);
                                  },
                                  icon: const Icon(Icons.remove_circle)),
                              const SizedBox(width: 5),
                              Text(quantity.toString()),
                              const SizedBox(width: 5),
                              IconButton(
                                  onPressed: () {
                                    addItem(product);
                                  },
                                  icon: const Icon(Icons.add_circle)),
                            ],
                          )
                          // IconAndTextWidget(
                          //   icon: Icons.circle_sharp,
                          //   text: "Normal",
                          //   iconColor: AppColors.background,
                          // ),
                          // IconAndTextWidget(
                          //   icon: Icons.location_on,
                          //   text: "1.7km",
                          //   iconColor: AppColors.mainColor,
                          // ),
                          // IconAndTextWidget(
                          //   icon: Icons.access_time_rounded,
                          //   text: "32min",
                          //   iconColor: AppColors.background,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
