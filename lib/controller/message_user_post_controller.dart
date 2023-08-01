import 'dart:convert';
import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:doctor_side_flutter/model/doctor_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../util/constants/api_configuration.dart';
import '../util/constants/storage.dart';

class GetUserMessageProvider extends ChangeNotifier {
  List<UserMessageModel>? userMessageList;
   final ScrollController scrollController = ScrollController();
 TextEditingController msgController = TextEditingController();
  Future<void> getMessage(String userId) async {
    dynamic key = await readToken();
    Map<String, dynamic> payload = {
      "to": userId,
    };
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
     String url = Apiconfiguration.baseurl + Apiconfiguration.getmsg;
    // String url ='http://'
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: headers
      );
      log('response.body ========${response.body}');
      if(response.statusCode == 200){
        log('Get metheod successfull');
        //Map<String,dynamic> data =jsonDecode(response.body) as Map<String,dynamic>;
         // = DoctorMessageModel.fromJson(data);
         userMessageList=userMessageModelFromJson(response.body);
      }
    } catch (e) {
      log('get msg failed with an exception $e');
    }
  }
  
  Future<void> sendMsg(String doctorId) async {
    dynamic key = await readToken();
    Map<String, dynamic> payload = {
      "to": doctorId,
      "message": msgController.text
    };
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json'
    };
    log('msg====${msgController.text}');
    String url = Apiconfiguration.baseurl + Apiconfiguration.sendMsg;
    // String url = 'http://10.4.3.105:8080/api/message/addMessage';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: headers
      );
      if(response.statusCode == 200){
        log('send msg sucessful with============= ${response.body}');
      }else{
        log('failed with an error ${response.statusCode}');
      }
    } catch (e) {
      log(' send message Failed with an exception $e');
    }
  }
   void messageClear(){
    msgController.clear();
    _message ='';
    notifyListeners();
  }
    late IO.Socket socket;
String serverUrl =Apiconfiguration.baseurl;
  void initSocketConnection(String doctorId) {
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('msg-recieve', (data) {
      // Handle received message here
      log('Received message: $data');
      UserMessageModel model =UserMessageModel(fromSelf: false, message: data, time: DateTime.now());
      userMessageList!.add(model);
      notifyListeners();
    });

    // Emit 'add-user' event to the server with the user's ID
    socket.emit('add-user', doctorId);
    notifyListeners();
  }

  void sendMessage(String userId, String message) {
    if (message.isNotEmpty) {
      // Emit 'send-msg' event to the server with message data
      socket.emit('send-msg', {
        'to': userId,
        'message': message,
      });
    }
  }
   void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
      );
    }
    notifyListeners();
  }
  String _message = '';

  String get message => _message;

  void setMessage(String message) {
    _message = message;
    notifyListeners(); // Notify listeners about the change
  }

  bool get isMessageEmpty => _message.isEmpty;
  @override
  void dispose() {
    socket.dispose();
   scrollController.dispose();
    super.dispose();
  }
}
