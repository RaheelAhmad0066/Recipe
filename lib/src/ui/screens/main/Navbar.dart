import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import 'package:piatoopronto/src/ui/screens/main/Profile_screen.dart';
import 'package:piatoopronto/src/ui/screens/main/dashboard_screen.dart';

import 'package:piatoopronto/src/ui/utils/colors_util.dart';

import 'home_page.dart';

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final navC = Get.put(NavbarController());

    // List pages
    List<Widget> _pages = [
      DashboardScreen(),
      HomePage(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => _pages.elementAt(navC.index.value)),
      bottomNavigationBar: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return BottomAppBar(
            elevation: 0,
            height: constraints.maxHeight * 0.12,
            clipBehavior: Clip.none,
            child: BottomNavigationBar(
              selectedItemColor: bgcolor,
              selectedFontSize: 10,
              currentIndex: navC.index.value,
              onTap: (index) {
                navC.setIndex(index);
                setState(() {});
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: SvgPicture.asset(
                    AssetIcons.home,
                    color: navC.index.value == 0
                        ? bgcolor
                        : AppColors.secondaryText,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: constraints.maxWidth * 0.05,
                    backgroundColor: bgcolor,
                    child: Image.asset(
                      'assets/images/onboarding.png',
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: SvgPicture.asset(
                    AssetIcons.profile,
                    color: navC.index.value == 2
                        ? bgcolor
                        : AppColors.secondaryText,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NavbarController extends GetxController {
  var index = 0.obs;

  void setIndex(int page) => index.value = page;
}

class AssetIcons {
  static const String home = 'assets/icons/home.svg';
  static const String profile = 'assets/icons/profile.svg';
}
