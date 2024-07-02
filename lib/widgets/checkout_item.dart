import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../widgets/big_text.dart';
class CheckoutItem extends StatelessWidget {
  final CartItem cartItem;
  final Function removeItem;
  final Function addItem;
  
  const CheckoutItem({
    super.key,  
    required this.removeItem, 
    required this.addItem, 
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // return ListTile(
    //   title: Text(cartItem.title),
    //   subtitle: Text('Quantity: ${cartItem.quantity}'),
    //   // subtitle: Text('\$${cartItem.totalPrice.toStringAsFixed(2)}'),
    //   trailing: IconButton(
    //     onPressed: () {
    //       removeItem(cartItem);
    //     }, 
    //     icon: const Icon(Icons.remove),
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
        width: screenWidth / 4.65,
        height: screenWidth / 4.65,
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
              width: screenWidth / 5.5,
              height: screenWidth / 5.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenHeight / 42.2),
                color: Colors.white38,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(cartItem.img)),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BigText(
                        text: cartItem.title,
                        size: 15,
                      ),
                      SizedBox(
                        height: screenHeight / 234.4,
                      ),
                      SizedBox(
                        height: screenHeight / 294.4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${cartItem.totalPrice.toStringAsFixed(2)}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    removeItem(cartItem);
                                  },
                                  icon: const Icon(Icons.remove_circle)),
                              const SizedBox(width: 5),
                              Text('${cartItem.quantity}'),
                              const SizedBox(width: 5),
                              IconButton(
                                  onPressed: () {
                                    addItem(cartItem);
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