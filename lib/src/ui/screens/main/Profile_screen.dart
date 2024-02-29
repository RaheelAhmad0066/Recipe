import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:iconsax/iconsax.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import '../../../constants/constants.dart';
import '../../utils/colors_util.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('Banner Ad loaded');
        },
        onAdFailedToLoad: (ad, error) {
          print('Banner Ad failed to load: $error');
        },
      ),
    );

    _bannerAd.load();
  }

  bool isLoading = false;
// delete account

  void deleteAccount() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Delete Firestore data associated with the user
        await FirebaseFirestore.instance
            .collection('diets')
            .doc(user.uid)
            .delete();

        await user.delete();
        print('Firebase Authentication user account deleted successfully.');
        print('Firestore data deleted successfully.');

        // Show success message
        Get.snackbar('Account', 'User account deleted successfully.');
        print('User account deleted successfully.');

        // Navigate to LoginScreen
        Get.offAll(LoginScreen());
      } catch (e) {
        // Show error message if deletion fails
        Get.snackbar('Error', e.toString());
      }
    } else {
      print('No user signed in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'prof'.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double h1 = constraints.maxHeight;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: h1 * 0.08,
                      backgroundColor: bgcolor,
                      child: user == null
                          ? Image.asset(user!.photoURL.toString())
                          : Image.asset('assets/images/onboarding.png'),
                    ),
                  ),
                  SizedBox(height: h1 * 0.02),
                  Text(
                    user != null ? user!.displayName.toString() : '',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    user!.email.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.grey, fontSize: 18),
                  ),
                  SizedBox(height: h1 * 0.01),
                  buildProfileTile(
                      'Politica sulla riservatezza'.tr, Iconsax.security, () {
                    showPrivacyPolicySheet(context);
                  }),
                  buildProfileTile(
                      'Disclaimer per PiattoPronto'.tr, Iconsax.danger, () {
                    shoDiclimar(context);
                  }),
                  buildProfileTile('PiattoPronto'.tr, Iconsax.info_circle, () {
                    showAboutAppSheet(context);
                  }),
                  buildProfileTile('Condividi l\'app'.tr, Iconsax.share, () {
                    shareApp();
                  }),
                  buildProfileTile(
                      'Eliminare l\'account'.tr, Iconsax.user_remove,
                      color: Colors.red, () {
                    showDeleteDialog(context);
                  }),
                  buildProfileTile('Disconnetti'.tr, Iconsax.logout,
                      color: Colors.red, () {
                    showLogoutDialog(context);
                  }),
                  const SizedBox(height: 10),
                  SizedBox(height: 60, child: AdWidget(ad: _bannerAd)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildProfileTile(String title, IconData icon, VoidCallback onTap,
      {Color color = bgcolor}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.white,
      elevation: 3,
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: color,
        ),
        onTap: onTap,
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Disconnettersi'),
          content: const Text('Sei sicuro di voler uscire?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annulla'),
            ),
            TextButton(
              onPressed: () {
                final auth = FirebaseAuth.instance;
                auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: ((context) => LoginScreen())),
                    (route) => false));
                Get.snackbar(
                  'Account',
                  'Logout',
                );
                Navigator.pop(context);
              },
              child: const Text(
                'Disconnettersi',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Eliminare l\'account'),
          content: const Text('Vuoi un account Elimina'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Annulla'),
            ),
            TextButton(
              onPressed: () {
                deleteAccount();
                Get.off(LoginScreen());
                Navigator.pop(context);
              },
              child: const Text(
                'Eliminare',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void showPrivacyPolicySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Dichiarazione sulla protezione dei dati',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              for (String paragraph in dataProtectionText.split('\n\n\n\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    paragraph,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void shoDiclimar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Disclaimer per PiattoPronto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              for (String paragraph in Disclaimer.split('\n\n\n\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    paragraph,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void showAboutAppSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(19.0),
          child: ListView(
            children: <Widget>[
              const Text(
                'Disclaimer per PiattoPronto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              for (String paragrap in Appdata.split('\n\n'))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    paragrap,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void shareApp() {
    Share.share(
        'Si prega di installare l\'app Piatto pronto'); // You can customize the share message
  }
}
