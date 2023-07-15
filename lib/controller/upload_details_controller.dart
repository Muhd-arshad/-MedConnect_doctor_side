import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doctor_side_flutter/controller/department_get_controller.dart';
import 'package:http/http.dart' as http;
import 'package:doctor_side_flutter/services/upload_deatils_patch_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadDetailsProvider extends ChangeNotifier {
  TextEditingController idnumberController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController yearofexpController = TextEditingController();
  File? idphoto;
  File? certificateImage;
  String? idPhotoPath;
  String? certificatephoto;
  final formGlobalKey1 = GlobalKey<FormState>();

  Future<void> getIdPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final photoTemp = File(image.path);
      idphoto = photoTemp;
      log(idphoto.toString());
       idPhotoPath = await uploadImage(idphoto!.path);
      log(idPhotoPath.toString());
    }
    notifyListeners();
  }

  Future<void> getCertificatePhoto() async {
    final cimage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (cimage == null) {
      return;
    } else {
      final photoTemp = File(cimage.path);
      certificateImage = photoTemp;
      log(certificateImage.toString());
     certificatephoto =await uploadImage(certificateImage!.path);
     log(certificatephoto.toString());
     
    }
    notifyListeners();
  }

  Future<bool> doctorUploadDetails(BuildContext context) async {
    if (formGlobalKey1.currentState!.validate()) {
      bool status = await uploadDetails(
          int.parse(idnumberController.text),
          qualificationController.text,
          Provider.of<DepartmentProvider>(context,listen: false).dropdownValue!,
         int.parse(feeController.text) ,
          int.parse(feeController.text),
          idPhotoPath!,
          certificatephoto!,
          context);
      if (status == true) {
        log(status.toString());
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void clearField() {
    idphoto = null;
    certificateImage = null;
    idnumberController.clear();
    qualificationController.clear();
    departmentController.clear();
    feeController.clear();
    yearofexpController.clear();
  }

  Future<dynamic> uploadImage(String imagePath) async {
    try {
      String cloudName = 'dupsc4cu4';
      String apiKey = '331149413215856';
      String uploadPreset = 'tw873smx'; // Replace with your upload preset name
      String url = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';
      File imageFile = File(imagePath);
      String absolutePath = imageFile.path;

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['api_key'] = apiKey;
      request.fields['upload_preset'] = uploadPreset;
      request.files
          .add(await http.MultipartFile.fromPath('file', absolutePath));

      var response = await request.send();
      if (response.statusCode == 200) {
        log('Image uploaded successfully.');
        String responseBody = await response.stream.bytesToString();
        var json = jsonDecode(responseBody);
        String imageUrl = json['secure_url'];
        // Process the response as needed
        log('Image uploaded successfully. URL: $imageUrl');
        return imageUrl;
      } else {
        String responseBody = await response.stream.bytesToString();
        log('Image upload failed. Error: ${response.statusCode}');
        log('Error response body: $responseBody');
      }
    } catch (e) {
      log('Error uploading image: $e');
    }
  }
}
