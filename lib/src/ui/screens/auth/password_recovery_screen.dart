import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:piatoopronto/src/ui/widgets/form_widget.dart';

import '../../../constants/colors.dart';
import '../../../core/controllers/password_controller.dart';

import '../../utils/helper_util.dart';
import '../../widgets/component_widget.dart';
import '../../widgets/helper_widget.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final passwordC = Get.put(PasswordController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  titleGreeting(
                    title: 'Recupero della password'.tr,
                    subtitle: 'for'.tr,
                  ),
                  textfieldIcon(
                    controller: passwordC.username,
                    hintText: 'weq'.tr,
                    icon: SvgPicture.asset(AssetIcons.message),
                    isRequired: 'Email is required !',
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Button(
                      disable: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed('/auth/password/change');
                        }
                      },
                      txtButton: 'Recupera Password'.tr,
                      color: bgcolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
