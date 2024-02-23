import 'package:get/get.dart';

import '../../../constants/colors.dart';

import '../../utils/helper_util.dart';

import '../../widgets/helper_widget.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late AppOpenAd appOpenAd;
  bool isLoading = true;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 20),
                child: CircleAvatar(
                  radius: 120,
                  backgroundColor: bgcolor,
                  child: Image.asset(
                    AssetImages.onboardingImg,
                    width: SizeConfig().deviceWidth(context),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 190,
                decoration: BoxDecoration(color: bgcolor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Piatto',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      Text(
                        'Piatto',
                        style: TextStyle(fontSize: 28, color: textcolor),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  'Piatto pronto ti aiuta a creare la tua ricetta in modo semplice e veloce'
                      .tr,
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                child: Button(
                  disable: false,
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  txtButton: 'Inizia a Cucinare'.tr,
                  color: bgcolor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
