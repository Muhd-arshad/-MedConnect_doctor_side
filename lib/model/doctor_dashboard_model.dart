
import 'dart:convert';

DoctorDashboardModel doctorDashboardModelFromJson(String str) => DoctorDashboardModel.fromJson(json.decode(str));

String doctorDashboardModelToJson(DoctorDashboardModel data) => json.encode(data.toJson());

class DoctorDashboardModel {
     int? visitedPatients;
     int? totalRevenue;
     int? cancelledAppointments;
     int? bookedAppointments;

    DoctorDashboardModel({
         this.visitedPatients,
         this.totalRevenue,
         this.cancelledAppointments,
         this.bookedAppointments,
    });

    factory DoctorDashboardModel.fromJson(Map<String, dynamic> json) => DoctorDashboardModel(
        visitedPatients: json["visitedPatients"],
        totalRevenue: json["totalRevenue"],
        cancelledAppointments: json["cancelledAppointments"],
        bookedAppointments: json["bookedAppointments"],
    );

    Map<String, dynamic> toJson() => {
        "visitedPatients": visitedPatients,
        "totalRevenue": totalRevenue,
        "cancelledAppointments": cancelledAppointments,
        "bookedAppointments": bookedAppointments,
    };
}
