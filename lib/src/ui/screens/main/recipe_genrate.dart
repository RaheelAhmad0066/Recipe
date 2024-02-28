import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:piatoopronto/Expo/exports.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import 'package:piatoopronto/src/ui/widgets/button_widget.dart';
import 'package:piatoopronto/src/ui/widgets/coustom_app_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/providers/message_provider.dart';
import '../../utils/copy_message.dart';
import '../../widgets/recipeshare.dart';

class recipegenratescreen extends StatefulWidget {
  const recipegenratescreen({
    super.key,
    required this.data,
    required this.counter,
    required this.diettype,
    required this.coursetype,
  });
  final String data;
  final int counter;
  final String diettype;
  final String coursetype;
  @override
  State<recipegenratescreen> createState() => _recipegenratescreenState();
}

class _recipegenratescreenState extends State<recipegenratescreen> {
  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollController =
      ScrollController(); //for ListView.builder
  Message message = Message(role: 'role', isImage: true, content: 'content');
  var data;
  void messagedata;
  bool isloadedd = false;
  bool isDatasaved = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(child: Consumer<MessageProvider>(
            builder: (context, provider, child) {
              if (provider.messages.isNotEmpty) {
                for (int i = 0; i < provider.messages.length; i++) {
                  message = provider.messages[i];
                }
              }

              if (provider.messages.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/rec1.png',
                        width: 200,
                      ),
                    ),
                    Text(
                      'diyw'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: provider.messages.length,
                  itemBuilder: (context, index) {
                    if (index == provider.messages.length) {
                      // Show loading icon when index is equal to the length of messages
                      return Center(
                        child: isloadedd ? SizedBox.shrink() : SpinKitCircle(),
                      );
                    } else {
                      messagedata = provider;
                      Message data = provider.messages[index];
                      if (data.role == "user") {
                        return Align(
                          alignment: Alignment
                              .topRight, //aligns user message tile to right
                          child: SlideInRight(
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'Benvenuti nell\'app Piattopronto! Immergiti in un mondo di delizie culinarie, esplora le ricette infinite e assapora la gioia di cucinare.',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyMedium!
                                    .copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: bgcolor),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment
                              .topLeft, //aligns assistant message tile to left
                          child: SlideInLeft(
                            duration: const Duration(milliseconds: 300),
                            child: GestureDetector(
                              onLongPress: () => copyText(data.content,
                                  context), //copy message to clip board on long press
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  children: [
                                    data.content == "...."
                                        ? //if the data.content is "...." then it shows animated text until the actual message is updated
                                        //wavy animation
                                        Center(
                                            child: SpinKitCircle(
                                              color: bgcolor,
                                            ),
                                          )
                                        :
                                        //main message
                                        SelectableText(
                                            data.content,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // docsaved(
                                        //   title: 'Saved',
                                        //   icon: Iconsax.copy,
                                        //   ontap: () async {

                                        //   },
                                        // ),
                                        docsaved(
                                          title: 'Copy',
                                          icon: Iconsax.copy,
                                          ontap: () {
                                            Clipboard.setData(ClipboardData(
                                                    text: data.content))
                                                .then((value) =>
                                                    Fluttertoast.showToast(
                                                        msg: 'copy',
                                                        backgroundColor:
                                                            bgcolor,
                                                        gravity: ToastGravity
                                                            .CENTER));
                                          },
                                        ),
                                        docsaved(
                                          title: 'share',
                                          icon: Iconsax.share,
                                          ontap: () {
                                            Share.share(data.content);
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
                      }
                    }
                  },
                );
              }
            },
          )),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Button(
                onPressed: () async {
                  if (isDatasaved) {
                    Fluttertoast.showToast(
                        msg: 'Already saved',
                        gravity: ToastGravity.CENTER,
                        backgroundColor: bgcolor);
                    return; // Exit onPressed function
                  }
                  CollectionReference diets =
                      FirebaseFirestore.instance.collection('diets');
                  String? userId = await getCurrentUserId();

                  if (userId != null) {
                    await diets.add({
                      'userId': userId,
                      'type': widget.diettype,
                      'coursetype': widget.coursetype,
                      'people': widget.counter.toString(),
                      'recipe': message.content,
                      'ingredients': widget.data,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
                    setState(() {
                      isDatasaved = true;
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Authentication Required'),
                          content:
                              Text('Please log in to perform this action.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                                // You may also navigate the user to the login screen here
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  Fluttertoast.showToast(
                      msg: 'Saved',
                      gravity: ToastGravity.CENTER,
                      backgroundColor: bgcolor);
                },
                txtButton: 'Componi Ricetta',
                color: bgcolor),
          )
        ],
      ),
    );
  }

  Future<String?> getCurrentUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
  }
}
