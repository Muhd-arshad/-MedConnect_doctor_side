// To parse this JSON data, do
//
//     final bookedApointmentModel = bookedApointmentModelFromJson(jsonString);

import 'dart:convert';

BookedApointmentModel bookedApointmentModelFromJson(String str) => BookedApointmentModel.fromJson(json.decode(str));

String bookedApointmentModelToJson(BookedApointmentModel data) => json.encode(data.toJson());

class BookedApointmentModel {
    final List<Appointment> appointments;

    BookedApointmentModel({
        required this.appointments,
    });

    factory BookedApointmentModel.fromJson(Map<String, dynamic> json) => BookedApointmentModel(
        appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    };
}

class Appointment {
    final String id;
    final UserId userId;
    final String doctorId;
    final String appointmentId;
    final bool cancelled;
    final DateTime date;
    final String time;
    final int amountPaid;
    final DateTime createdAt;
    final int v;

    Appointment({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.appointmentId,
        required this.cancelled,
        required this.date,
        required this.time,
        required this.amountPaid,
        required this.createdAt,
        required this.v,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        doctorId: json["doctorId"],
        appointmentId: json["appointmentId"],
        cancelled: json["cancelled"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        amountPaid: json["amountPaid"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "doctorId": doctorId,
        "appointmentId": appointmentId,
        "cancelled": cancelled,
        "date": date.toIso8601String(),
        "time": time,
        "amountPaid": amountPaid,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class UserId {
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

    UserId({
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

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
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
