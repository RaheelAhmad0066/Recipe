import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          height: 54,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                primary: disable ? bgcolor.withOpacity(0.7) : color,
              ),
              onPressed: () {
                if (!disable) {
                  onPressed();
                }
              },
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/onboarding.png',
                      width: 40,
                    ),
                    Text(txtButton,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                ),
              ).animate().scaleXY(
                  begin: 0,
                  end: 1,
                  delay: Duration() + 300.ms,
                  duration: Duration(),
                  curve: Curves.easeInOutCubic)),
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
          height: 54,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              onPressed: onPressed,
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    Text(txtButton,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ],
                ),
              ).animate().scaleXY(
                  begin: 0,
                  end: 1,
                  delay: Duration() + 300.ms,
                  duration: Duration(),
                  curve: Curves.easeInOutCubic)),
        );
      },
    );
  }
}
