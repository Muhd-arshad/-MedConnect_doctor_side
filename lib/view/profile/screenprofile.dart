import 'dart:developer';
import 'package:doctor_side_flutter/controller/doctor_profile_controller.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/homePage/home_screen.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/buttonwidget.dart';
import '../widgets/textformwidget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // final profileProvider =context.read<DoctorProfileProvider>();
    return Consumer<DoctorProfileProvider>(
        builder: (context, profileProvider, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppbarWidget(
              title: profileProvider.isEditing == false
                  ? 'Profile'
                  : 'Profile Editing'),
        ),
        body: PrimaryWidget(
          widget: Padding(
            padding: horizontal10,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profileProvider.isEditing ==true ?
                  profileProvider.doctorProfileModel!.doctorDetails.profilePhoto == null
                      ? const Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg'),
                            radius: 80,
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(profileProvider.doctorProfileModel!.doctorDetails.profilePhoto!),
                            // backgroundImage: FileImage(
                            //     File(profileProvider.profilePhoto!.path)),

                            radius: 80,
                          ),
                        ):
                         profileProvider.doctorProfileModel!.doctorDetails.profilePhoto == null
                      ? const Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg'),
                            radius: 80,
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(profileProvider.doctorProfileModel!.doctorDetails.profilePhoto!),
                               

                            radius: 80,
                          ),
                        ),

                  profileProvider.isEditing == false ? height10 : height20,
                  profileProvider.isEditing == false
                      ? height10
                      : ButtonWidget(
                          text: 'Edit Profile',
                          onPressed: () {
                            profileProvider.profilePhot();
                          },
                          height: 40,
                          width: 150),
                  profileProvider.isEditing == true
                      ? const SizedBox()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              text: 'About',
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                log('edit button clicked');
                                profileProvider.islodingChange();
                              },
                              child: const TextWidget(
                                text: 'Edit',
                                fontWeight: FontWeight.bold,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                  height20,
                  TextformFeildWidget(
                      controller: profileProvider.namecontroller,
                      labelText: 'Name',
                      readOnly:
                          profileProvider.isEditing == false ? true : false),
                  height20,
                  TextformFeildWidget(
                      controller: profileProvider.emailcontroller,
                      labelText: 'Email',
                      readOnly:
                          profileProvider.isEditing == false ? true : false),
                  height20,
                  TextformFeildWidget(
                      controller: profileProvider.numbercontroller,
                      labelText: 'PhoneNumber',
                      readOnly:
                          profileProvider.isEditing == false ? true : false),
                  height20,
                  TextformFeildWidget(
                      controller: profileProvider.experiancecontroller,
                      labelText: 'Experiance',
                      readOnly:
                          profileProvider.isEditing == false ? true : false),
                  profileProvider.isEditing == false ? height10 : height20,
                  profileProvider.isEditing == false
                      ? height10
                      : ButtonWidget(
                          text: 'Submit',
                          onPressed: () async {

                          bool status =  await profileProvider.updateProfile();
                          log(status.toString());
                          if(status == true){
                            profileProvider.loadingChange();
                            profileProvider.profileEdit();
                            // ignore: use_build_context_synchronously
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>const ScreenHome(),));
                          }
                            
                          },
                          height: 40,
                          width: 150)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
