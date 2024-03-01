import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get/get.dart';
import 'package:piatoopronto/src/ui/widgets/coustom_app_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:iconsax/iconsax.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import '../../../constants/constants.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../auth/login_screen.dart';

String assetPDFPath = "";

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
    getFileFromAsset("assets/files/privacypolicy.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
    discl("assets/files/disclaimer.pdf").then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(assetPDFPath);
      });
    });
    about("assets/images/About.pdf").then((f) {
      setState(() {
        abouta = f.path;
        print(assetPDFPath);
      });
    });
    _loadBannerAd();
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypd.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<File> about(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/my.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  Future<File> discl(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
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

  String abouta = "";

  String urlPDFPath = "";

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
                    user!.displayName.toString(),
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
                    Get.to(privacy(asset: assetPDFPath));
                  }),
                  buildProfileTile(
                      'Disclaimer per PiattoPronto'.tr, Iconsax.danger, () {
                    Get.to(privacy(asset: urlPDFPath));
                  }),
                  buildProfileTile('PiattoPronto'.tr, Iconsax.info_circle, () {
                    Get.to(privacy(asset: abouta));
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

  void shoDiclimar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: PDFView(
            fitEachPage: true,
            filePath: assetPDFPath, // Provide the path to your PDF file
            // or you can use asset by providing assetPath
            // assetPath: 'assets/sample.pdf',
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: true,
            pageFling: true,
            onRender: (_pages) {
              print('Rendered $_pages pages!');
            },
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('Error while loading page $page: $error');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              // You can use the controller for various actions like controlling the PDF
              // Eg. pdfViewController.setPage(0);
            },
            onPageChanged: (page, total) {
              print('page change: $page/$total');
            },
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

class privacy extends StatelessWidget {
  const privacy({super.key, required this.asset});
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: PDFView(
        fitEachPage: true,
        filePath: asset,
        enableSwipe: true,
        swipeHorizontal: false,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          print('Rendered $_pages pages!');
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('Error while loading page $page: $error');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          // You can use the controller for various actions like controlling the PDF
          // Eg. pdfViewController.setPage(0);
        },
        onPageChanged: (page, total) {
          print('page change: $page/$total');
        },
      ),
    );
  }
}
