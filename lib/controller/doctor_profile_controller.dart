import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:doctor_side_flutter/model/doctor_profile_model.dart';
import 'package:doctor_side_flutter/services/edit_profile_photo_patch_service.dart';
import 'package:doctor_side_flutter/util/constants/api_configuration.dart';
import 'package:doctor_side_flutter/util/constants/storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../services/edit_profile_details_patch_service.dart';

class DoctorProfileProvider extends ChangeNotifier {
  DoctorProfileModel? doctorProfileModel;
  bool isEditing = false;
  File? profilePhoto;
  String? profilepath;
  GlobalKey<FormState> formKey2 = GlobalKey();
  String? imageurl;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController experiancecontroller = TextEditingController();
  bool isloading = false;
  Future<dynamic> getProfile() async {
    String key = await readToken();
    String url = Apiconfiguration.baseurl + Apiconfiguration.profile;
    final header = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    try {
      http.Response response = await http.get(Uri.parse(url), headers: header);
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;

        doctorProfileModel = DoctorProfileModel.fromJson(data);
        return doctorProfileModel;
      } else {
        log('failed with ${response.statusCode}');
      }
    } catch (e) {
      log('Failde with exception$e');
    }
  }

  void controller() {
    namecontroller.text =
        doctorProfileModel!.doctorDetails.firstName.toString();
    emailcontroller.text = doctorProfileModel!.doctorDetails.email.toString();
    numbercontroller.text =
        doctorProfileModel!.doctorDetails.phoneNumber.toString();
    experiancecontroller.text =
        doctorProfileModel!.doctorDetails.experience.toString();
    notifyListeners();
  }

  void islodingChange() {
    isEditing = true;
    notifyListeners();
  }

  void loadingChange() {
    isEditing = false;
    notifyListeners();
  }

  Future<void> profilePhot() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final phototemp = File(image.path);
      profilePhoto = phototemp;
      profilepath = await profileCloudinery(profilePhoto!.path);
      doctorProfileModel!.doctorDetails.profilePhoto = profilepath.toString();
      log(profilepath.toString());
      notifyListeners();
    }
    notifyListeners();
  }

  Future<dynamic> updateProfile() async {
    isloading = true;
    notifyListeners();
    bool status = await editProfile(namecontroller.text, emailcontroller.text,
        int.parse(experiancecontroller.text), int.parse(numbercontroller.text));
    log(profilePhoto.toString());
    log(doctorProfileModel!.doctorDetails.id.toString());

    doctorProfileModel!.doctorDetails.profilePhoto = profilepath.toString();
    doctorProfileModel!.doctorDetails.firstName = namecontroller.text;
    doctorProfileModel!.doctorDetails.email = emailcontroller.text;
    doctorProfileModel!.doctorDetails.experience =
        int.parse(experiancecontroller.text);
    notifyListeners();
    if (status == true) {
      isloading = false;
      notifyListeners();
      return true;
    } else {
      isloading = false;
      notifyListeners();
      return false;
    }
  }

  Future<dynamic> profileCloudinery(String imagePath) async {
    final cloudinary = Cloudinary.signedConfig(
      apiKey: '331149413215856',
      apiSecret: 'DuAkn5qC3Rr2zBWv1ZVjDGHDVA8',
      cloudName: 'dupsc4cu4',
    );

    CloudinaryResponse response = await cloudinary.upload(
      file: imagePath,
      fileBytes: File(imagePath).readAsBytesSync(),
      resourceType: CloudinaryResourceType.image,
    );

    if (response.statusCode == 200) {
      log('cloudinery image added');
      imageurl = response.secureUrl.toString();
      notifyListeners();
      return imageurl;
    }
  }

  Future<void> profileEdit() async {
    log('enterd');
    editProfilePhoto(profilepath!);
  }
}
