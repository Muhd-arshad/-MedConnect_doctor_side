String apiadress = '10.4.3.105';
class Apiconfiguration{

  static String baseurl ='https://dr-care.onrender.com/';
  //endUrl
  static String signupurl ='api/doctor/otp';
  static String otpurl ='api/doctor/otpVerify';
  static String loginurl ='api/doctor/login';
  static String uploadDetails ='api/doctor/addDoctorDetails';
  static String dptdetails ='api/viewDepartments';
  static String dashBoard ='api/doctor/getDashboardDetails';
  static String schudule ='api/doctor/addScheduleTime';
  static String getapoint ='api/doctor/getBookedAppointments';
  static String profile ='api/doctor/doctorDetails';
  static String updateProfileDetails='api/doctor/updateProfileDetails';
  static String profilePhoto='api/doctor/updateProfile';
  static String chatableUser ='api/doctor/getChattableUsers';
  static String sendMsg ='api/message/addMessageFromDoctor';
  static String getmsg ='api/message/getMessagesForDoctor';
  static String visited = 'api/doctor/patientVisited';
  static String cancel='api/doctor/cancelAppointment';
 // static String getbookedApoinments ='api/doctor/getBookedAppointments';

}