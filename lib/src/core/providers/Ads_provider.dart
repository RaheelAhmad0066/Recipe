import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../constants/constants.dart';

class RewardedAdManager extends ChangeNotifier {
  RewardedAd? _rewardedAd;

  RewardedAd? get rewardedAd => _rewardedAd;

  void loadRewardAd(String rewardedAds) {
    RewardedAd.load(
      adUnitId: rewardedAds,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('Reward ad loaded');
          _rewardedAd = ad;
          notifyListeners();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Failed to load ad: $error');
        },
      ),
    );
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      return;
    }

    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {},
      onAdDismissedFullScreenContent: (ad) {
        loadRewardAd(rewarded_ads);
      },
      onAdFailedToShowFullScreenContent: (ad, error) {},
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
      onUserEarnedReward: (ad, rewardItem) {
        print('User earned reward');
      },
    );
  }
}
