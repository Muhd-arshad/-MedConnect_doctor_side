import 'package:doctor_side_flutter/model/chatable_user.dart';
import 'package:doctor_side_flutter/util/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/message_user_post_controller.dart';
import '../../util/constants/color.dart';
import '../../util/constants/padding.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({
    super.key,
    required this.chattableUser,
  });
  final ChattableUser chattableUser;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => Provider.of<GetUserMessageProvider>(context,listen: false).scrollToBottom()); 
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: bgcolor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(chattableUser.profilePhoto),
          ),
        ),
        title: TextWidget(
          text: '${chattableUser.firstName} ${chattableUser.lastName}',
          size: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: PrimaryWidget(
        widget: Consumer<GetUserMessageProvider>(
          builder: (context, getUserMessageProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  height10,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: ListView.separated(
                      controller: getUserMessageProvider.scrollController,
                      itemBuilder: (context, index) {
                        
                        return Padding(
                          padding: horizontal10,
                          child: Align(
                            alignment: getUserMessageProvider
                                        .userMessageList![index].fromSelf ==
                                    true
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (getUserMessageProvider
                                            .userMessageList![index].fromSelf ==
                                        true
                                    ? Colors.grey.shade200
                                    : cwhite),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  getUserMessageProvider
                                      .userMessageList![index].message,
                                  style: const TextStyle(fontSize: 15),
                                  textAlign: getUserMessageProvider
                                              .userMessageList![index]
                                              .fromSelf ==
                                          true
                                      ? TextAlign.end
                                      : TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => height10,
                      itemCount: getUserMessageProvider.userMessageList!.length,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(20),
                          color: cwhite,
                          elevation: 4,
                          shadowColor: cBlack,
                          child: TextField(
                             onChanged: (value) {
                              getUserMessageProvider.setMessage(value);
                            },
                            controller: getUserMessageProvider.msgController,
                            decoration: InputDecoration(
                              hintText: 'Type Messages',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: cwhite,
                              filled: true,
                              suffixIcon: getUserMessageProvider.isMessageEmpty ? null :
                              IconButton(
                                onPressed: () async {
                                getUserMessageProvider
                                      .sendMessage(
                                          chattableUser.id,
                                          getUserMessageProvider
                                              .msgController.text);
                                  await getUserMessageProvider
                                      .sendMsg(chattableUser.id);
                                  await getUserMessageProvider
                                      .getMessage(chattableUser.id);
                                  getUserMessageProvider.messageClear();
                                },
                                icon: const Icon(Icons.send),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
