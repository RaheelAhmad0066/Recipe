import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../core/controllers/login_controller.dart';

import '../../utils/helper_util.dart';
import '../../widgets/helper_widget.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginC = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  titleGreeting(
                    title: 'we'.tr,
                    subtitle: 'de'.tr,
                  ),
                  textfieldIcon(
                    controller: loginC.username,
                    hintText: 'E-mail'.tr,
                    icon: SvgPicture.asset(AssetIcons.message),
                    isRequired: 'Email or phone number is required !',
                  ),
                  Obx(
                    () => textfieldPassword(
                      controller: loginC.password,
                      obsecure: loginC.showPassword.value,
                      hintText: 'p'.tr,
                      isRequired: 'f'.tr,
                      icon: SvgPicture.asset(AssetIcons.lock),
                      onTap: () => loginC.visiblePassword(),
                    ),
                  ),
                  InkWell(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Password dimenticata?'.tr,
                        style: TextStyle(color: bgcolor, fontSize: 18),
                      ),
                    ),
                    onTap: () => Get.toNamed('/auth/password/recovery'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 24),
                    child: Obx(
                      () => loginC.isLoading.value
                          ? CircularProgressIndicator()
                          : Button(
                              disable: false,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  loginC.signInWithEmailAndPassword(
                                      context,
                                      loginC.username.text,
                                      loginC.password.text);
                                }
                              },
                              txtButton: 'log'.tr,
                              color: bgcolor,
                            ),
                    ),
                  ),
                  Text('con'.tr, style: TextTypography.sP2),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => loginC.isloading.value
                        ? CircularProgressIndicator()
                        : ButtonIcon(
                            onPressed: () {
                              loginC.signInWithGoogle(context);
                            },
                            txtButton: ' Google'.tr,
                            color: AppColors.secondary,
                            icon: Icon(
                              FontAwesome.google,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  richTextLink(
                    title: 'Non hai un Account?'.tr,
                    linkText: 'Iscriviti'.tr,
                    onTap: () {
                      Get.toNamed('/auth/register');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
