import 'dart:convert';

import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/features/splash/data/apis.dart';
import 'package:dmax_app/model/chat_histort_model.dart';
import 'package:dmax_app/model/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../commons/common_imports/apis_commons.dart';

final sharePrefProvider =
    ChangeNotifierProvider((ref) => SharePrefController());

class SharePrefController extends ChangeNotifier {
  final SharedPrefAPis _api = SharedPrefAPis();

  List<String> userInfo = [];
  List<MessageModel> chatHistoryList = [];
  List<ChatHistortModel> chatHistoryModelList = [];
  String profileInfo = "profile_info";
  bool isLoading = true;

  // set String list
  Future<void> setProfileInfo({required List<String> info}) async {
    userInfo = info;
    await _api.saveToneList(profileInfo, userInfo);
    notifyListeners();
  }

  // remove String list
  Future<void> removeProfileInfo() async {
    userInfo = [];
    await _api.removeStringList(profileInfo);
    notifyListeners();
  }

  // get String list
  Future<List<String>> getProfileInfo() async {
    userInfo = await _api.getStringList(profileInfo);
    isLoading = false;
    notifyListeners();
    return userInfo;
  }

  Future<void> addMessage(MessageModel message) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList('chatHistory') ?? [];
    existingList.add(jsonEncode(message.toJson()));
    await prefs.setStringList('chatHistory', existingList);
    chatHistoryList.add(message);
    notifyListeners();
  }

  Future<void> loadChatHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('chatHistory') ?? [];
    chatHistoryList = stringList
        .map((json) => MessageModel.fromJson(jsonDecode(json)))
        .toList();
    notifyListeners();
  }

  // clear chat history
  Future<void> clearChat() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chatHistory');
    chatHistoryList.clear();
    notifyListeners();
  }

  // save chat history list
  Future<void> saveChatHistoryList(ChatHistortModel message) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> existingList = prefs.getStringList('chatHistoryList') ?? [];
    existingList.add(jsonEncode(message.toJson()));
    await prefs.setStringList('chatHistoryList', existingList);
    chatHistoryModelList.add(message);
    notifyListeners();
  }

  // load chat history list
  Future<void> loadChatHistoryList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList('chatHistoryList') ?? [];
    chatHistoryModelList = stringList
        .map((json) => ChatHistortModel.fromJson(jsonDecode(json)))
        .toList();
    notifyListeners();
  }
}






// final sharePrefProvider =
//     ChangeNotifierProvider((ref) => SharePrefController());

// class SharePrefController extends ChangeNotifier {
//   final SharedPrefAPis _api = SharedPrefAPis();
//   final GeminiApiServices _geminiApi = GeminiApiServices();

//   List<String> selectedTones = [];
//   List<MessageModel> chatHistoryList = [];
//   String profileInfo = "profile_info";
//   bool isLoading = true;

//   /// Load selected tone list
//   Future<List<String>> getProfileInfo() async {
//     selectedTones = await _api.getStringList(profileInfo);
//     isLoading = false;
//     notifyListeners();
//     return selectedTones;
//   }

//   /// Save selected tone list
//   Future<void> setProfileInfo({required List<String> info}) async {
//     selectedTones = info;
//     await _api.saveToneList(profileInfo, selectedTones);
//     notifyListeners();
//   }

//   /// Remove tone profile
//   Future<void> removeProfileInfo() async {
//     selectedTones = [];
//     await _api.removeStringList(profileInfo);
//     notifyListeners();
//   }

//   /// Add a message to shared prefs
//   Future<void> addMessage(MessageModel message) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> existingList = prefs.getStringList('chatHistory') ?? [];
//     existingList.add(jsonEncode(message.toJson()));
//     await prefs.setStringList('chatHistory', existingList);
//     chatHistoryList.add(message);
//     notifyListeners();
//   }

//   /// Load chat history from shared prefs
//   Future<void> loadChatHistory() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> stringList = prefs.getStringList('chatHistory') ?? [];
//     chatHistoryList =
//         stringList.map((json) => MessageModel.fromJson(jsonDecode(json))).toList();
//     notifyListeners();
//   }

//   /// Send a question and get a response using Gemini API
//   Future<void> sendQuestion(String question) async {
//     final userMessage = MessageModel(message: question, type: "client");
//     await addMessage(userMessage);

//     final botReplies = await _geminiApi.sendTextOrImageToGemini(
//       question: question,
//       selectedTones: selectedTones,
//       count: 1,
//     );

//     for (var reply in botReplies) {
//       await addMessage(reply);
//     }
//   }

//   /// Clear all messages
//   Future<void> clearChat() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('chatHistory');
//     chatHistoryList.clear();
//     notifyListeners();
//   }
// }
