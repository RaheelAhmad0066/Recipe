import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../core/controllers/other_controller.dart';
import '../utils/helper_util.dart';
import 'button_widget.dart';

Widget richTextLink(
    {required String title,
    required String linkText,
    required GestureTapCallback onTap}) {
  return RichText(
    text: TextSpan(
      text: title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
        color: AppColors.mainText,
      ),
      children: <TextSpan>[
        TextSpan(
          text: ' $linkText',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: AppColors.primary,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap();
            },
        )
      ],
    ),
  );
}

Widget itemContain({required String label, required bool isOk}) {
  return Row(
    children: [
      isOk
          ? SvgPicture.asset(AssetIcons.checkGreen)
          : SvgPicture.asset(AssetIcons.checkGrey),
      SizedBox(width: 8),
      Text(
        label,
        style: TextStyle(
            color: isOk ? AppColors.mainText : AppColors.secondaryText),
      ),
    ],
  );
}

Widget listItem({required String label}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(AssetIcons.checkGreen),
      SizedBox(width: 8),
      Text(
        label,
        style: TextTypography.mP2,
      ),
    ],
  );
}

Widget titleGreeting({required String title, required String subtitle}) {
  return Column(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 34, color: bgcolor),
      ),
      SizedBox(height: 32),
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          subtitle,
          style: TextStyle(fontSize: 19, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 22),
    ],
  );
}

Future dialog(
    {required String title,
    required String subtitle,
    required Widget icon,
    required String txtButton,
    required GestureTapCallback onPressed}) {
  return Get.defaultDialog(
    title: '',
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    content: Column(
      children: [
        icon,
        Container(
          padding: EdgeInsets.only(top: 32, bottom: 8),
          child: Text(
            title,
            style: TextTypography.mH1,
          ),
        ),
        Text(
          subtitle,
          style: TextTypography.mP2,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 24),
          child: Button(
            onPressed: () {
              onPressed();
            },
            txtButton: txtButton,
            color: AppColors.primary,
          ),
        ),
      ],
    ),
  );
}

Widget buildFilter(List choice) {
  final controller = Get.put(OtherController());
  return Obx(
    () => Wrap(
      children: List<Widget>.generate(
        choice.length,
        (int index) {
          return Container(
            margin: EdgeInsets.only(right: 12, top: 16),
            child: ChoiceChip(
              pressElevation: 0,
              backgroundColor: AppColors.form,
              selectedColor: AppColors.primary,
              labelStyle: controller.choice.value == index
                  ? TextStyle(color: Colors.white, fontWeight: FontWeight.w700)
                  : TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
              labelPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              label: Text(choice[index]),
              selected: controller.choice.value == index,
              onSelected: (bool selected) {
                controller.setChoice(index);
              },
            ),
          );
        },
      ).toList(),
    ),
  );
}

Widget divider() {
  return Container(color: AppColors.form, height: 8);
}

Widget uploadIcon({required String title, required String subtitle}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SvgPicture.asset(AssetIcons.image),
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.titleText,
          ),
        ),
      ),
      Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: AppColors.secondaryText,
        ),
      )
    ],
  );
}
