import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../constants/colors.dart';
import '../../utils/helper_util.dart';
import '../../widgets/coustom_app_widget.dart';
import '../../widgets/helper_widget.dart';

import '../../../Localiziation/language_controler.dart';
import '../../../constants/constants.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedCategory = 'All';

  Future<List<DocumentSnapshot>> fetchDataFromFirebase() async {
    String? userId = await getCurrentUserId();

    if (userId != null) {
      CollectionReference diets =
          FirebaseFirestore.instance.collection('diets');

      if (selectedCategory == 'All') {
        QuerySnapshot querySnapshot =
            await diets.where('userId', isEqualTo: userId).get();
        return querySnapshot.docs;
      } else {
        QuerySnapshot querySnapshot = await diets
            .where('userId', isEqualTo: userId)
            .where('type', isEqualTo: selectedCategory)
            .get();
        return querySnapshot.docs;
      }
    } else {
      // Handle the case when the user is not logged in
      return [];
    }
  }

  Future<String?> getCurrentUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }

  @override
  void initState() {
    super.initState();

    _createintersestadd();
  }

  InterstitialAd? intersialad;

  void _createintersestadd() {
    InterstitialAd.load(
      adUnitId: interstial_ads,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            intersialad = ad;
          });
        },
        onAdFailedToLoad: (LoadAdError error) {
          setState(() {
            intersialad = null;
          });
        },
      ),
    );
  }

  void showinterstedadd() {
    if (intersialad != null) {
      intersialad!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createintersestadd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createintersestadd();
        },
      );

      intersialad!.show();
    } else {}
  }

  final searchcontroler = TextEditingController();
  final Map<String, String> defaultImages = {
    'poke bowl': 'assets/images/rec2.png',
    'contorno': 'assets/images/rec3.png',
    'insalatona': 'assets/images/rec5.png',
    'dessert': 'assets/images/rec6.png',
    'panino': 'assets/images/rec7.png',
    'primo': 'assets/images/rec8.png',
    'secondo': 'assets/images/rec9.png'
    // Add more images as needed
  };

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.bgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (v) {
                          setState(() {
                            selectedCategory = v;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Cerca ricetta',
                          isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: bgcolor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: bgcolor),
                          ),
                        ),
                      ),
                      buildFilter(
                        ['Tutte', 'Onnivoro', 'Vegetariano', 'Vegano'],
                        selectedCategory,
                        (newValue) {
                          setState(() {
                            selectedCategory = newValue;
                            showinterstedadd();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.02,
                ),
                FutureBuilder(
                  future: fetchDataFromFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SpinKitThreeBounce(
                        color: bgcolor,
                        size: 20,
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<DocumentSnapshot> data =
                          snapshot.data as List<DocumentSnapshot>;
                      if (data.isEmpty) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Image.asset(
                              'assets/images/rec1.png',
                              width: 200,
                            ),
                            Text(
                              'I dati non sono stati trovati!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 215,
                          mainAxisSpacing: 10,
                          childAspectRatio: 2,
                        ),
                        itemCount: data.length,
                        itemBuilder: (BuildContext ctx, index) {
                          String courseType = data[index]['coursetype'];
                          String imageUrl =
                              defaultImages[courseType.toLowerCase()] ??
                                  'assets/images/onboarding.png';
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: RecipeWidget(
                                dataa: data[index], defaultimage: imageUrl),
                          );
                        },
                      );
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget buildFilter(List<String> choices, String selectedChoice,
    Function(String) onSelectionChanged) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List<Widget>.generate(
        choices.length,
        (int index) {
          return Container(
            margin: EdgeInsets.only(right: 12, top: 16),
            child: ChoiceChip(
              pressElevation: 0,
              checkmarkColor: Colors.white,
              backgroundColor: AppColors.form,
              selectedColor: bgcolor,
              side: BorderSide(color: bgcolor),
              labelStyle: selectedChoice == choices[index]
                  ? TextStyle(color: Colors.white, fontWeight: FontWeight.w700)
                  : TextStyle(
                      color: AppColors.secondaryText,
                      fontWeight: FontWeight.w500,
                    ),
              labelPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              label: Text(choices[index]),
              selected: selectedChoice == choices[index],
              onSelected: (bool selected) {
                onSelectionChanged(choices[index]);
              },
            ),
          );
        },
      ).toList(),
    ),
  );
}

Widget _buildLanguagePopupMenuButton() {
  final LanguageController languageController = Get.put(LanguageController());
  return PopupMenuButton<String>(
    onSelected: (value) {
      languageController.setLanguage(value);
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'en_US',
        child: Text('English'),
      ),
      PopupMenuItem<String>(
        value: 'it_IT',
        child: Text('Italian'),
      ),
      // Add more languages as needed
    ],
  );
}
