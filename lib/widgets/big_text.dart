import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({
    super.key, 
    this.color = const Color(0xFF332d2d), 
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Urbanist',
        color: color,
        fontSize: size == 0 ? screenHeight / 42.2 : size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}