import 'package:flutter/material.dart';

class PrimaryWidget extends StatelessWidget {
  final Widget widget;
  const PrimaryWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 189, 209, 243),
          Color(0xffD5F2E8),
        ], end: Alignment.centerRight, begin: Alignment.topRight),
      ),
      child: widget,
    );
  }
}
