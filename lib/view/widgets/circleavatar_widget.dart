import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String image;
  final double size;
  const CircleAvatarWidget({
    super.key, required this.image, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: size,
      backgroundImage: AssetImage(
          image),
    );
  }
}