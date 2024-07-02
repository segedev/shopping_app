import 'package:flutter/material.dart';
import 'package:shopping_app/pages/main_page.dart';

import '../config/app_strings.dart';
import '../styles/app_colors.dart';

class OrderSuccessfulPage extends StatelessWidget {
  const OrderSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   title: const Text('Order Successful'),
      //   backgroundColor: AppColors.background,
      // ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 150),
            const Text(
              'Thanks!',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900
              ),
            ),
            const SizedBox(height: 170),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.background,
                        size: 100,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        AppStrings.confirmed,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        )
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        AppStrings.confirmedMessage1,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: AppColors.grey
                        )
                      ),
                      const Text(
                        AppStrings.confirmedMessage2,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: AppColors.grey,
                        )
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                      width: double.infinity,
                      height: screenHeight * 0.06,
                      child: MaterialButton(
                        onPressed: () {
                          // Handle sign-in action
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPage()));
                        },
                        color: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Continue Shopping',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    ]
                  ),
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}
