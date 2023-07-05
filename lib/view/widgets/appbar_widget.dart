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
        IconButton(iconSize: 30, onPressed: () {}, icon: const Icon(Icons.logout),),
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
