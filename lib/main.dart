import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:piatoopronto/src/core/providers/Ads_provider.dart';
import 'package:piatoopronto/src/core/providers/chips_provider.dart';
import 'package:piatoopronto/src/core/providers/counter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/Localiziation/Translation.dart';
import 'src/core/controllers/auth_services.dart';
import 'src/core/providers/message_provider.dart';
import 'src/routes/routes.dart';
import 'src/ui/screens/intro/onboarding_screen.dart';
import 'src/ui/screens/main/Navbar.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized before calling Firebase.initializeApp()
  await Firebase.initializeApp(); // Wait for Firebase to be initialized

  await Get.putAsync(() async => await SharedPreferences.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();
  final sharedPreferences = Get.find<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => MessageProvider())),
        ChangeNotifierProvider(create: ((context) => RewardedAdManager())),
        ChangeNotifierProvider(create: ((context) => ChipModel())),
        ChangeNotifierProvider(create: ((context) => CourseProvider())),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: MyTranslations(),
          locale:
              Locale(sharedPreferences.getString('languageCode') ?? 'it', 'IT'),
          fallbackLocale: Locale('en', 'US'),
          theme: ThemeData(
              fontFamily: 'Inter',
              appBarTheme:const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
              )),
          defaultTransition: Transition.native,
          getPages: Routes.pages,
          home: FutureBuilder(
              future: _authService.isUserSignedIn(),
              builder: (context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // or any loading widget
                } else {
                  if (snapshot.data == true) {
                    return Navbar();
                  } else {
                    return OnboardingScreen();
                  }
                }
              })),
    );
  }
}
