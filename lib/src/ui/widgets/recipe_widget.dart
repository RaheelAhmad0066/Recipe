import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/colors.dart';
import 'recipeshare.dart';

class RecipeWidget extends StatelessWidget {
  var dataa;
  final String defaultimage;
  RecipeWidget({required this.dataa, required this.defaultimage});

  void deleteDocument(DocumentSnapshot snapshot) async {
    String id = snapshot.id;
    try {
      await FirebaseFirestore.instance.collection('diets').doc(id).delete();
      print('Document deleted successfully');
    } catch (error) {
      print('Error deleting document: $error');
    }
  }

  String generateTitle(String content) {
    // Example: Extracting the first few words from the content as the title
    List<String> words = content.split(' ');

    String title = words.join(' ').substring(60, 400);
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                isDismissible: true,
                context: context,
                builder: (context) => LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.linear,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(12),
                            topStart: Radius.circular(12),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  width: 80,
                                  child: Divider(
                                    thickness: 4,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tipo di Dieta:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      dataa['type'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'portata:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      dataa['coursetype'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Numero di porzioni:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      dataa['people'].toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  dataa['recipe'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    docsaved(
                                      icon: Iconsax.copy,
                                      title: 'Copy',
                                      ontap: () {
                                        Clipboard.setData(
                                          ClipboardData(text: dataa['recipe']),
                                        );
                                        Fluttertoast.showToast(msg: 'Copy');
                                      },
                                    ),
                                    docsaved(
                                      icon: Iconsax.share,
                                      title: 'Share',
                                      ontap: () {
                                        Share.share(dataa['recipe']);
                                        Fluttertoast.showToast(msg: 'Copy');
                                      },
                                    ),
                                    docsaved(
                                      icon: Icons.delete_outline,
                                      title: 'Delete',
                                      ontap: () {
                                        deleteDocument(dataa);
                                        Fluttertoast.showToast(msg: 'Delete');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: bgcolor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: bgcolor,
                    child: Image.asset(
                      defaultimage,
                      width: 110,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.01,
                  ),
                  Text(
                    dataa['type'],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 19),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: Text(
                      dataa['recipe'],
                      style: const TextStyle(
                          color: Color(0xff6ff1d0),
                          fontWeight: FontWeight.normal,
                          fontSize: 13),
                      maxLines:
                          2, // Set the maximum number of lines you want to display
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.01,
                  ),
                  Text(
                    dataa['coursetype'],
                    style: const TextStyle(
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
