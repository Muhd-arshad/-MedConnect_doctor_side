import 'dart:convert';

List<UserMessageModel> userMessageModelFromJson(String str) => List<UserMessageModel>.from(json.decode(str).map((x) => UserMessageModel.fromJson(x)));

String userMessageModelToJson(List<UserMessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserMessageModel {
    final bool fromSelf;
    final String message;
    final DateTime time;

    UserMessageModel({
        required this.fromSelf,
        required this.message,
        required this.time,
    });

    factory UserMessageModel.fromJson(Map<String, dynamic> json) => UserMessageModel(
        fromSelf: json["fromSelf"],
        message: json["message"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "fromSelf": fromSelf,
        "message": message,
        "time": time.toIso8601String(),
    };
}