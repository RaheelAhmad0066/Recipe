import 'package:flutter/material.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import '../utils/helper_util.dart';

class Button extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final bool disable;
  final double width;

  Button({
    required this.onPressed,
    required this.txtButton,
    required this.color,
    this.disable = false,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: width,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              primary: disable ? bgcolor.withOpacity(0.7) : color,
            ),
            onPressed: () {
              if (!disable) {
                onPressed();
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/images/onboarding.png',
                  width: 60,
                ),
                SizedBox(width: 8), // Adjust spacing here
                Text(
                  txtButton,
                  maxLines: 1,
                  style: TextStyle(
                    color: disable ? Colors.white : Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final String txtButton;
  final Color color;
  final GestureTapCallback onPressed;
  final Widget icon;
  final double width;

  ButtonIcon({
    required this.onPressed,
    required this.txtButton,
    required this.color,
    required this.icon,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: width,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            onPressed: onPressed,
            child: Padding(
              padding:const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(child: icon),
                const  SizedBox(width: 8), // Adjust spacing here
                  Text(
                    txtButton,
                    maxLines: 1,
                    style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
