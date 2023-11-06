import 'dart:async';
import 'package:demo_proj/models/backend_message.dart';
import 'package:demo_proj/models/response.dart';
import 'package:demo_proj/services/message_service.dart';

class MainPageModel {
  final BackendMessageService _messageService = BackendMessageService();

  Future<Response> sendMessage(String message) async {
    // 将View里传来的参数转换成model
    BackendMessage backendMessage = BackendMessage(message: message);
    // 获取数据
    Response response = await _messageService.sendMessageToBackend(backendMessage);
    // Return the response
    return response;
  }
}
