import 'dart:convert';

Doctormodel doctormodelFromJson(String str) => Doctormodel.fromJson(json.decode(str));

String doctormodelToJson(Doctormodel data) => json.encode(data.toJson());

class Doctormodel {
    final String? firstName;
    final String? lastName;
    final int? phoneNumber;
    final String? email;
    final String? password;
    final String? confirmPassword;

    Doctormodel({
         this.firstName,
         this.lastName,
         this.phoneNumber,
         this.email,
         this.password,
         this.confirmPassword,
    });

    factory Doctormodel.fromJson(Map<String, dynamic> json) => Doctormodel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
    };
}