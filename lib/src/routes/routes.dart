import 'package:get/get.dart';

import '../ui/screens/auth/change_password_screen.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/password_recovery_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/intro/onboarding_screen.dart';
import '../ui/screens/main/privacypolicay_page.dart';

class Routes {
  static final pages = [
    GetPage(
      name: '/intro/onboarding',
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: '/auth/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/auth/password/recovery',
      page: () => PasswordRecoveryScreen(),
    ),
    GetPage(
      name: '/auth/password/change',
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => Privacypolicy(),
    ),
  ];
}
