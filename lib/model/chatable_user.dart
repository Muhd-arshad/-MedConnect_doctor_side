// To parse this JSON data, do
//
//     final userChatModel = userChatModelFromJson(jsonString);

import 'dart:convert';

UserChatModel userChatModelFromJson(String str) => UserChatModel.fromJson(json.decode(str));

String userChatModelToJson(UserChatModel data) => json.encode(data.toJson());

class UserChatModel {
    final List<ChattableUser> chattableUsers;

    UserChatModel({
        required this.chattableUsers,
    });

    factory UserChatModel.fromJson(Map<String, dynamic> json) => UserChatModel(
        chattableUsers: List<ChattableUser>.from(json["chattableUsers"].map((x) => ChattableUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "chattableUsers": List<dynamic>.from(chattableUsers.map((x) => x.toJson())),
    };
}

class ChattableUser {
    final String id;
    final String firstName;
    final String lastName;
    final int wallet;
    final int phoneNumber;
    final String email;
    final String password;
    final bool block;
    final String profilePhoto;
    final DateTime createdAt;
    final int v;

    ChattableUser({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.wallet,
        required this.phoneNumber,
        required this.email,
        required this.password,
        required this.block,
        required this.profilePhoto,
        required this.createdAt,
        required this.v,
    });

    factory ChattableUser.fromJson(Map<String, dynamic> json) => ChattableUser(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        wallet: json["wallet"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        block: json["block"],
        profilePhoto: json["profilePhoto"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "wallet": wallet,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "block": block,
        "profilePhoto": profilePhoto,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
