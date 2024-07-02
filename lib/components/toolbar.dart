import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primary2,
        automaticallyImplyLeading: false,
        elevation: 0.3,
        title: Text(
          title, 
          style: AppText.header1,
        ),
        centerTitle: false,
        actions: actions,
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
}