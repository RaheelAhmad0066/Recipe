import '../../../Expo/exports.dart';
import '../services/api_service.dart';

class MessageProvider with ChangeNotifier {
  final String _user = "user";
  final String _bot = "bot";

  ApiClass apiClass = ApiClass();

  List<Message> _messages = [];
  List<Message> get messages => _messages; //getter to access _messages

  //clear messages
  void clearMessages(BuildContext context) {
    _messages = [];
    notifyListeners();
  }

  //adding messages to list
  addMessages(
      String role, String content, bool isImage, ScrollController controller) {
    messages.add(Message(role: role, content: content, isImage: isImage));
  }

  //updating messages to list
  updateMessages(
      String role, String content, bool isImage, ScrollController controller) {
    messages.last = Message(role: role, content: content, isImage: isImage);
  }

  //sending prompt
  // Clear user messages
  void clearUserMessages() {
    _messages.removeWhere((message) => message.role == _user);
    notifyListeners();
  }

  //sending prompt
  Future<void> sendPrompt(
      String prompt, ScrollController controller, BuildContext context) async {
    try {
      // Clear previous user messages before adding a new one
      clearUserMessages();
      addMessages(_user, prompt, false, controller);
      notifyListeners();
      String result = await apiClass.mainApi(prompt, controller);
      if (result == "Something went wrong") {
        return;
      } else if (result == "yes") {
        final String responseImage =
            await apiClass.imageGenerationApi(prompt, controller);
        addMessages(_bot, responseImage, true, controller);
      } else {
        addMessages(_bot, "....", false, controller);
        notifyListeners();
        final String responseText =
            await apiClass.chatGptApi(prompt, controller);

        int lastBotMessageIndex =
            _messages.lastIndexWhere((message) => message.role == _bot);
        if (lastBotMessageIndex != -1) {
          updateMessages(_bot, responseText, false, controller);
        } else {
          addMessages(_bot, responseText, false, controller);
        }
      }
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }
}

class Promptmessage extends ChangeNotifier {
  int messagesSent = 0;
  late DateTime lastMessageTime;

  void sendMessage() {
    if (canSendMessage()) {
      messagesSent++;
      lastMessageTime = DateTime.now();
      notifyListeners(); // Notify listeners of state change
    }
  }

  bool canSendMessage() {
    if (messagesSent >= 3) {
      if (lastMessageTime == null ||
          DateTime.now().difference(lastMessageTime).inDays >= 21) {
        messagesSent = 0;
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
