import 'dart:developer';

import 'package:doctor_side_flutter/controller/department_get_controller.dart';
import 'package:doctor_side_flutter/controller/upload_details_controller.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/homePage/home_screen.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/buttonwidget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:doctor_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenUploadDetails extends StatelessWidget {
  const ScreenUploadDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Upload Details'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Consumer<UploadDetailsProvider>(
            builder: (context, doctorUploadDetails, child) {
          return Form(
            key: doctorUploadDetails.formGlobalKey1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  height20,
                  TextformFeildWidget(
                      controller: doctorUploadDetails.idnumberController,
                      labelText: 'Id Number'),
                  height10,
                  TextformFeildWidget(
                      controller: doctorUploadDetails.qualificationController,
                      labelText: 'Qualification'),
                  height10,
                  // TextformFeildWidget(
                  //     controller: doctorUploadDetails.departmentController,
                  //     labelText: 'Department'),
                  Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(),
                    ),
                    child: DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      isExpanded: true,
                      value: Provider.of<DepartmentProvider>(context)
                          .dropdownValue,
                      // icon: const Icon(Icons.arrow_downward),
                      elevation: 0,
                      style: const TextStyle(color: Colors.black),
                      items: Provider.of<DepartmentProvider>(context,
                              listen: false)
                          .list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: TextWidget(
                            text: value,
                            size: 18,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        Provider.of<DepartmentProvider>(context, listen: false)
                            .changevalue(value!);
                      },
                    ),
                  ),

                  height10,
                  TextformFeildWidget(
                      controller: doctorUploadDetails.feeController,
                      labelText: 'Fees'),
                  height10,
                  TextformFeildWidget(
                    controller: doctorUploadDetails.yearofexpController,
                    labelText: 'Experiance',
                  ),
                  height10,
                  height20,
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          doctorUploadDetails.isImagePicker(true);
                          doctorUploadDetails.getIdPhoto();
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload '),
                      ),
                      width10,
                      const TextWidget(
                        text: 'Upload id card photo',
                        size: 18,
                      )
                    ],
                  ),
                  height10,
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          doctorUploadDetails.getCertificatePhoto();
                        },
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload '),
                      ),
                      width10,
                      const TextWidget(
                        text: 'upload certificateImage',
                        size: 18,
                      )
                    ],
                  ),
                  height20,
                  ButtonWidget(
                      text: 'Upload',
                      onPressed: () async {
                      

                        bool status = await doctorUploadDetails
                            .doctorUploadDetails(context);
                        log(status.toString());
                        // readToken();
                        if (status == true) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenHome(),
                            ),
                          );
                          doctorUploadDetails.clearField();
                        }
                      },
                      height: 50,
                      width: 150),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
