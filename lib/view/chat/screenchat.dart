import 'package:doctor_side_flutter/controller/chatable_user_get_controller.dart';
import 'package:doctor_side_flutter/controller/doctor_profile_controller.dart';
import 'package:doctor_side_flutter/controller/message_user_post_controller.dart';
import 'package:doctor_side_flutter/util/constants/color.dart';
import 'package:doctor_side_flutter/util/constants/padding.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:doctor_side_flutter/view/chat/screen_message.dart';
import 'package:doctor_side_flutter/view/widgets/appbar_widget.dart';
import 'package:doctor_side_flutter/view/widgets/customtextwidget.dart';
import 'package:doctor_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Chats'),
      ),
      body: PrimaryWidget(
        widget: Provider.of<ChatableUserGetProvider>(context)
                .userChatModel!
                .chattableUsers
                .isEmpty
            ? const Center(
                child: Text('No Messages yet'),
              )
            : Consumer<ChatableUserGetProvider>(
                builder: (context, chatableuserProvider, child) {
                return ListView.separated(
                    padding: horizontal10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: cwhite,
                        ),
                        child: ListTile(
                          onTap: () async {
                           
                            await Provider.of<GetUserMessageProvider>(context,listen: false)
                                .getMessage(chatableuserProvider
                                    .userChatModel!.chattableUsers[index].id);
                                       // ignore: use_build_context_synchronously
                                  Provider.of<GetUserMessageProvider>(context,listen: false).initSocketConnection(Provider.of<DoctorProfileProvider>(context,listen: false).doctorProfileModel!.doctorDetails.id!);
                                    
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScreenMessage(
                                      chattableUser: chatableuserProvider
                                          .userChatModel!
                                          .chattableUsers[index]),
                                ));
                                
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(chatableuserProvider
                                .userChatModel!
                                .chattableUsers[index]
                                .profilePhoto),
                          ),
                          title: TextWidget(
                            text:
                                '${chatableuserProvider.userChatModel!.chattableUsers[index].firstName} ${chatableuserProvider.userChatModel!.chattableUsers[index].lastName}',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => height20,
                    itemCount: chatableuserProvider
                        .userChatModel!.chattableUsers.length);
              }),
      ),
    );
  }
}
