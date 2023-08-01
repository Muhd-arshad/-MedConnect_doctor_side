import 'package:doctor_side_flutter/view/loginPage/loginpage.dart';
import 'package:flutter/material.dart';

import '../../util/constants/color.dart';
import 'customtextwidget.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          iconSize: 30,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const TextWidget(
                    text: 'Do you want to logout!',
                    fontWeight: FontWeight.bold,
                    size: 18,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const TextWidget(
                        text: 'YES',
                        colorText: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const TextWidget(
                        text: 'NO',
                        colorText: Colors.green,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.logout),
        ),
      ],
      centerTitle: true,
      backgroundColor: bgcolor,
      title: TextWidget(
        text: title,
        size: 30,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    );
  }
}
