// To parse this JSON data, do
//
//     final doctorProfileModel = doctorProfileModelFromJson(jsonString);

import 'dart:convert';

DoctorProfileModel doctorProfileModelFromJson(String str) => DoctorProfileModel.fromJson(json.decode(str));

String doctorProfileModelToJson(DoctorProfileModel data) => json.encode(data.toJson());

class DoctorProfileModel {
     DoctorDetails doctorDetails ;

    DoctorProfileModel({
        required this.doctorDetails,
    });

    factory DoctorProfileModel.fromJson(Map<String, dynamic> json) => DoctorProfileModel(
        doctorDetails: DoctorDetails.fromJson(json["doctorDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "doctorDetails": doctorDetails.toJson(),
    };
}

class DoctorDetails {
    final String? id;
     String? firstName;
    final String? lastName;
     int? phoneNumber;
     String? email;
    final String? password;
    final bool? block;
    final bool? verificationStatus;
    final bool? showRequest;
     String? profilePhoto;
    final int? v;
    final String? certificateImage;
    final String? departmentName;
     int? experience;
    final int? fee;
    final String? idCardImage;
    final int? idNumber;
    final String? qualification;

    DoctorDetails({
         this.id,
         this.firstName,
         this.lastName,
         this.phoneNumber,
         this.email,
         this.password,
         this.block,
         this.verificationStatus,
         this.showRequest,
         this.profilePhoto,
         this.v,
         this.certificateImage,
         this.departmentName,
         this.experience,
         this.fee,
         this.idCardImage,
         this.idNumber,
         this.qualification,
    });

    factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        block: json["block"],
        verificationStatus: json["verificationStatus"],
        showRequest: json["showRequest"],
        profilePhoto: json["profilePhoto"],
        v: json["__v"],
        certificateImage: json["certificateImage"],
        departmentName: json["departmentName"],
        experience: json["experience"],
        fee: json["fee"],
        idCardImage: json["idCardImage"],
        idNumber: json["idNumber"],
        qualification: json["qualification"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "block": block,
        "verificationStatus": verificationStatus,
        "showRequest": showRequest,
        "profilePhoto": profilePhoto,
        "__v": v,
        "certificateImage": certificateImage,
        "departmentName": departmentName,
        "experience": experience,
        "fee": fee,
        "idCardImage": idCardImage,
        "idNumber": idNumber,
        "qualification": qualification,
    };
}
