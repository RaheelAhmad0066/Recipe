import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Expo/exports.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguage = 'it_IT'.obs;

  Future<void> setLanguage(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('languageCode', languageCode);
    selectedLanguage.value = languageCode;
    Get.updateLocale(Locale(languageCode));
  }
}
