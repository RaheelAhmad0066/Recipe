import 'package:get/get.dart';
import 'package:piatoopronto/src/ui/screens/main/Profile_screen.dart';

import 'package:piatoopronto/src/ui/screens/main/privacypolicay_page.dart';

import '../../../constants/colors.dart';
import '../../../core/controllers/register_controller.dart';

import '../../utils/helper_util.dart';

import '../../widgets/helper_widget.dart';
import '../main/privacypolicy.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final registerC = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Obx(
        () => Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    titleGreeting(
                      title: 'wel'.tr,
                      subtitle: 'Inserisci i tuoi dati'.tr,
                    ),
                    textfieldIcon(
                      controller: registerC.username,
                      hintText: 'E-mail'.tr,
                      icon: SvgPicture.asset(AssetIcons.message),
                      isRequired: 'Email or phone number is required !',
                    ),
                    textfieldPassword(
                      controller: registerC.password,
                      obsecure: registerC.showPassword.value,
                      hintText: 'p'.tr,
                      icon: SvgPicture.asset(AssetIcons.lock),
                      onTap: () => registerC.visiblePassword(),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'your'.tr,
                        style: TextTypography.mP2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          itemContain(
                              label: 'you'.tr,
                              isOk: registerC.eightChars.value),
                          SizedBox(height: 15),
                          itemContain(
                              label: 'yur'.tr, isOk: registerC.hasNumber.value),
                          SizedBox(height: 15),
                          itemContain(
                              label: 'yr'.tr,
                              isOk: registerC.hasSpecialCharacters.value),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: textcolor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Leggi e accetta la nostra'),
                            InkWell(
                              onTap: () {
                                Get.to(privacy(
                                  asset: assetPDFPath,
                                ));
                              },
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(
                      () => registerC.isLoading.value
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.only(top: 50, bottom: 24),
                              child: Button(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (isChecked) {
                                      // Assuming isChecked is a boolean variable representing checkbox state
                                      registerC.signUpWithEmailAndPassword(
                                        context,
                                        registerC.username.text,
                                        registerC.password.text,
                                      );
                                    }
                                  }
                                },
                                txtButton: 'sign'.tr,
                                color: bgcolor,
                                disable:
                                    !isChecked || registerC.btnDisable.value,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
