import 'package:flutter/material.dart';

import '../utils/helper_util.dart';

Widget textfieldIcon({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required TextEditingController controller,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return '$isRequired';
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfieldPassword({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required bool obsecure,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            suffixIcon: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Icon(
                  obsecure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24,
                  color: AppColors.secondaryText,
                ),
              ),
              onTap: () {
                onTap();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return '$isRequired';
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget passwordRegister({
  String hintText = '',
  String isRequired = '',
  required Widget icon,
  required bool obsecure,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 15, color: AppColors.secondaryText),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 15,
              ),
              child: icon,
            ),
            suffixIcon: InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: Icon(
                  obsecure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24,
                  color: AppColors.secondaryText,
                ),
              ),
              onTap: () {
                onTap();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              borderSide: BorderSide(color: AppColors.outline, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
              borderSide: BorderSide(color: AppColors.secondary, width: 1),
            ),
          ),
          validator: (value) {
            if (isRequired != '') {
              if (value!.isEmpty) {
                return '$isRequired';
              }
            }
            return null;
          },
        ),
      ],
    ),
  );
}

Widget textfield({
  String hintText = '',
  String isRequired = '',
  required TextEditingController controller,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      hintStyle: TextStyle(fontSize: 15, color: AppColors.secondaryText),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: AppColors.outline, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: AppColors.secondary, width: 1),
      ),
    ),
    validator: (value) {
      if (isRequired != '') {
        if (value!.isEmpty) {
          return '$isRequired';
        }
      }
      return null;
    },
  );
}
