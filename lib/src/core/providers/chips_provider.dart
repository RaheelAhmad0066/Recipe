import 'package:piatoopronto/Expo/exports.dart';

class ChipModel extends ChangeNotifier {
  List<String> chips = [];

  void addChip(String chip) {
    if (!chips.contains(chip)) {
      chips.add(chip);
      notifyListeners();
    }
  }

  void removeChip(String chip) {
    chips.remove(chip);
    notifyListeners();
  }
}
