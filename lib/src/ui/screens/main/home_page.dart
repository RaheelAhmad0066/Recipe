import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:piatoopronto/src/constants/colors.dart';
import 'package:piatoopronto/src/ui/widgets/button_widget.dart';
import 'package:piatoopronto/src/ui/widgets/coustom_app_widget.dart';
import '../../../constants/constants.dart';
import '../../../core/providers/Ads_provider.dart';
import '../../../core/providers/chips_provider.dart';
import '../../../core/providers/counter.dart';
import '../../../core/providers/message_provider.dart';
import '../../../../Expo/exports.dart';
import 'recipe_genrate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController =
      TextEditingController(); //for TextField
  final ScrollController _scrollController =
      ScrollController(); //for ListView.builder
  List<String> chips = [];
  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  String ingredientsString = '';
  late DateTime
      lastMessageTime; // Variable to store the timestamp of the last message sent
  int messagesSent = 0; // Variable to count the number of messages sent
  void sendPrompt() {
    // if (canSendMessage()) {
    // messagesSent++;
    // lastMessageTime = DateTime.now();
    savePreferences();
    ingredientsString = chips.join(", ");
    String prompt =
        "Crea una ricetta per seguire questo\n\n Tipo di Dieta: $selectedFruit\n Tipo di portata: $course\n Numero di porzioni: $sliderValue\n Ingredienti in grammo: $ingredientsString\n\n e plz indicano una calorie per la ricetta in lingua italiana";
    context.read<MessageProvider>().sendPrompt(
          prompt,
          _scrollController,
          context,
        );

    _textEditingController.clear(); // Clear text field
    setState(() {
      chips.clear(); // Clear chips
    });

    FocusScope.of(context).unfocus();
  }

  // bool canSendMessage() {
  //   // Check if the user has reached the message limit
  //   if (messagesSent >= 4) {
  //     // Check if enough time has passed since the last message (few weeks)
  //     if (lastMessageTime == null ||
  //         DateTime.now().difference(lastMessageTime).inDays >= 21) {
  //       // Reset the messagesSent count
  //       messagesSent = 0;
  //       return true; // Allow the user to send a message
  //     } else {
  //       return false; // User still needs to wait
  //     }
  //   } else {
  //     return true; // User has not reached the message limit
  //   }
  // }

  void showPopup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Limite di messaggio raggiunto"),
            content: Text(
              "Hai raggiunto il limite del messaggio. Si prega di attendere alcune settimane prima di inviare più messaggi.",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  //method to access toggle recording
  late SharedPreferences _prefs;
  String? _savedContent;
  late RewardedAdManager rewardedAdManager;
  @override
  void initState() {
    super.initState();
    loadPreferences();
    _initSharedPreferences();
    rewardedAdManager = Provider.of<RewardedAdManager>(context, listen: false);
    rewardedAdManager.loadRewardAd(rewarded_ads);
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedContent = _prefs.getString('saved_content') ?? '';
    });
  }

  Future<void> _saveContent(String content) async {
    setState(() {
      _savedContent = content;
    });
    await _prefs.setString('saved_content', content);
  }

  Future<void> loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedFruit = prefs.getString('selectedFruit') ?? '';
      course = prefs.getString('course') ?? '';
      messagesSent = prefs.getInt('messagesSent') ?? 0;
      lastMessageTime =
          DateTime.parse(prefs.getString('lastMessageTime') ?? '');
    });
  }

  Future<void> savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFruit', selectedFruit);
    await prefs.setString('course', course);
    await prefs.setInt('messagesSent', messagesSent);
    await prefs.setString('lastMessageTime', lastMessageTime.toIso8601String());
  }

  String selectedFruit = '';
  String course = '';
  int sliderValue = 0;
  Message message = Message(role: 'role', isImage: true, content: 'content');
  var data;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height:
                        constraints.maxHeight * 0.2), // Adjust height as needed
                Center(
                  child: Image.asset(
                    'assets/images/rec1.png',
                    width: constraints.maxWidth * 0.6, // Adjust width as needed
                  ),
                ),
                Text(
                  'Crea\n la tua ricetta',
                  style: TextStyle(fontSize: 27, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    height: constraints.maxHeight *
                        0.05), // Adjust height as needed
                Button(
                  onPressed: () {
                    sheet(context, h);
                  },
                  txtButton: 'Componi Ricetta',
                  color: bgcolor,
                  width: constraints.maxWidth * 0.8, // Adjust width as needed
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> sheet(BuildContext context, double h) {
    return showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: ((context) => Container(
              height: h,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(16),
                      topStart: Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: h * 0.04,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.black),
                                  controller: _textEditingController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "dw".tr,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: bgcolor, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: bgcolor, width: 2)),
                                    suffixIcon: IconButton(
                                      onPressed: () => _addChip(context),
                                      icon: const Icon(
                                        Icons.add,
                                        color: bgcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Consumer<ChipModel>(
                        builder: (context, chipModel, _) {
                          chips = chipModel.chips;
                          return Wrap(
                            spacing: 8.0,
                            children: chipModel.chips
                                .map((chip) => _buildChip(chip, chipModel))
                                .toList(),
                          );
                        },
                      ),
                      SizedBox(
                        height: h * 0.04,
                      ),
                      Text(
                        'Tipo di Dieta',
                        style: TextStyle(
                            color: bgcolor,
                            fontSize: 23,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Consumer<CourseProvider>(
                          builder: (context, values, child) {
                        selectedFruit = values.selectedFruit;
                        return Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: h * 0.01, // Adjust the spacing as needed
                          runSpacing:
                              h * 0.02, // Adjust the run spacing as needed
                          children: List.generate(
                            ditetype.length,
                            (index) {
                              return ChoiceChip(
                                padding: EdgeInsets.all(12),
                                checkmarkColor: Colors.white,
                                label: Text(ditetype[index]),
                                selected:
                                    values.selectedFruit == ditetype[index],
                                labelStyle:
                                    values.selectedFruit == ditetype[index]
                                        ? TextStyle(color: Colors.white)
                                        : TextStyle(color: Colors.black),
                                selectedColor: bgcolor,
                                onSelected: (bool selected) {
                                  values.setSelectedFruit(
                                    selected ? ditetype[index] : '',
                                  );
                                },
                              );
                            },
                          ),
                        );
                      }),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      const Text(
                        'Tipo di Portata',
                        style: TextStyle(
                            color: bgcolor,
                            fontSize: 23,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Consumer<CourseProvider>(
                        builder: (context, value, child) {
                          course = value.selectedCourse;
                          return Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: h * 0.01, // Adjust the spacing as needed
                            runSpacing:
                                h * 0.02, // Adjust the run spacing as needed
                            children: List.generate(categories.length, (index) {
                              return ChoiceChip(
                                checkmarkColor: Colors.white,
                                label: Text(
                                  categories[index],
                                ),
                                padding: EdgeInsets.all(12),
                                selected:
                                    value.selectedCourse == categories[index],
                                labelStyle:
                                    value.selectedCourse == categories[index]
                                        ? TextStyle(color: Colors.white)
                                        : TextStyle(color: Colors.black),
                                selectedColor: bgcolor,
                                onSelected: (bool selected) {
                                  value.setSelectedCourse(
                                    selected ? categories[index] : '',
                                  );
                                },
                              );
                            }),
                          );
                        },
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Porzioni',
                          style: TextStyle(
                              color: bgcolor,
                              fontSize: 23,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Consumer<CourseProvider>(
                            builder: (context, value, child) {
                          sliderValue = value.count;
                          return SizedBox(
                            width: 160,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the radius as needed
                                    ),
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => bgcolor)),
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          value.decrement();
                                        },
                                        icon: Icon(
                                          Iconsax.minus,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      value.count.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          value.increment();
                                        },
                                        icon: Icon(
                                          Iconsax.add,
                                          color: Colors.white,
                                        )),
                                  ],
                                )),
                          );
                        }),
                      ),
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Button(
                          onPressed: () {
                            sendPrompt();
                            savePreferences();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => recipegenratescreen(
                                          data: ingredientsString,
                                          counter: sliderValue,
                                          diettype: selectedFruit,
                                          coursetype: course,
                                        ))));
                          },
                          txtButton: 'Continua',
                          color: bgcolor)
                    ],
                  ),
                ),
              ),
            )));
  }

  Widget _buildChip(String label, ChipModel chipModel) {
    return Chip(
      label: Text(label, style: TextStyle(color: Colors.white)),
      backgroundColor: bgcolor,
      deleteIconColor: Colors.white,
      onDeleted: () => chipModel.removeChip(label),
    );
  }

  void _addChip(BuildContext context) {
    String text = _textEditingController.text.trim();
    if (text.isNotEmpty) {
      Provider.of<ChipModel>(context, listen: false).addChip(text);
      _textEditingController.clear();
    }
  }
}
