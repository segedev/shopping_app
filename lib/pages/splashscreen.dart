import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/main_page.dart';

import '../styles/app_colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MainPage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'shop',
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            Text(
              'X',
              style: TextStyle(
                color: AppColors.primary2,
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
