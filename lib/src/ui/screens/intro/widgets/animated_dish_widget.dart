import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:piatoopronto/src/constants/colors.dart';

class AnimatedDishWidget extends StatelessWidget {
  final Duration dishPlayDuration;
  final Duration leavesDelayDuration;
  const AnimatedDishWidget({
    Key? key,
    required this.dishPlayDuration,
    required this.leavesDelayDuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            //margin: const EdgeInsets.only(top: 45),
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: bgcolor,
              child: Image.asset(
                'assets/images/onboarding.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.3,
              ).animate().scaleXY(
                  begin: 0,
                  end: 1,
                  duration: dishPlayDuration,
                  curve: Curves.easeInOutCubic),
            )),
      ],
    );
  }
}
