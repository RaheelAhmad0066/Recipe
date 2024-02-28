import '../../utils/helper_util.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'widgets/onboarding_body_widget.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late AppOpenAd appOpenAd;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(child: OnBoardingBodyWidget()),
      ),
    );
  }
}
