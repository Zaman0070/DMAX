import 'dart:convert';

import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/features/chat/data/apis.dart';
import 'package:dmax_app/model/message_model.dart';
import 'package:dmax_app/model/tone_option.dart';
import 'package:flutter/services.dart';
import '../../../../commons/common_imports/apis_commons.dart';

final geminiApiProvider = ChangeNotifierProvider((ref) => GeminiController());

class GeminiController extends ChangeNotifier {
  final GeminiApiServices _api = GeminiApiServices();

  bool isLoading = false;
  List<MessageModel> chatHistory = [];

  Future<void> sendTextMessage(String question, int count, ToneOption tone,
      List<String> conversationHistory, List<String> userInfo) async {
    _setLoading(true);
    final response = await _api.sendCustomPromptToGemini(
      userInfo: userInfo,
      conversationHistory: conversationHistory,
      question: question,
      toneLabel: tone.label,
      toneDefinition: tone.definition,
      toneExample: tone.example,
      count: count
    );
    chatHistory = response;
    notifyListeners();
    _setLoading(false);
  }

  Future<void> sendTextWithImage(
      String question,
      int count,
      ToneOption tone,
      List<String> conversationHistory,
      List<String> userInfo,
      String base64Image) async {
    _setLoading(true);
    final response = await _api.sendCustomPromptToGemini(
      userInfo: userInfo,
      question: question,
      base64Image: base64Image,
      count: count,
      toneLabel: tone.label,
      toneDefinition: tone.definition,
      toneExample: tone.example,
      conversationHistory: conversationHistory,
    );
    chatHistory = response;
    notifyListeners();
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearChat() {
    chatHistory.clear();
    notifyListeners();
  }

  Future<String> loadAssetAsBase64(String assetPath) async {
    final ByteData bytes = await rootBundle.load(assetPath);
    final Uint8List list = bytes.buffer.asUint8List();
    return base64Encode(list);
  }
}
