import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Customize the background colora
      backgroundColor: bgcolor,
      actions: [],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Piatto',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0, // Customize the title text size
              fontWeight: FontWeight.bold, // Customize the title text weight
            ),
          ),
          Text(
            'Pronto',
            style: TextStyle(
              color: textcolor,
              fontSize: 20.0, // Customize the title text size
              fontWeight: FontWeight.bold, // Customize the title text weight
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
