import 'package:flutter/material.dart';
import 'package:piatoopronto/src/constants/colors.dart';

class docsaved extends StatelessWidget {
  const docsaved({
    required this.ontap,
    required this.title,
    required this.icon,
    super.key,
  });
  final IconData icon;
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: ontap,
          icon: Icon(icon),
          color: bgcolor,
        ),
        Text(
          title,
          style:const TextStyle(fontWeight: FontWeight.bold, color: bgcolor),
        )
      ],
    );
  }
}
