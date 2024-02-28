import 'package:piatoopronto/Expo/exports.dart';

class CourseProvider with ChangeNotifier {
  String _selectedCourse = '';
  String _selectedFruit = '';
  int _count = 0;

  int get count => _count;
  String get selectedFruit => _selectedFruit;
  String get selectedCourse => _selectedCourse;

  void setSelectedCourse(String course) {
    _selectedCourse = course;
    notifyListeners();
  }

  void setSelectedFruit(String fruit) {
    _selectedFruit = fruit;
    notifyListeners();
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
