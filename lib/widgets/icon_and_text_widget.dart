import 'package:flutter/material.dart';

import 'small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({
    super.key, 
    required this.icon, 
    required this.text, 
    required this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: screenHeight / 35.17,
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}