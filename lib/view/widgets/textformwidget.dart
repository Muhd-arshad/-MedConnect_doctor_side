import 'package:flutter/material.dart';

import '../../util/constants/color.dart';


class TextformFeildWidget extends StatelessWidget {
  const TextformFeildWidget({
    super.key,
    required this.controller,  this.labelText, this.padding=EdgeInsets.zero,
  });

  final TextEditingController controller;
  final String? labelText;
  final EdgeInsets padding;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        validator: (value) {
          if(value == null || value.isEmpty){
            return '$labelText is cannot be empty';
          }
          return null;
        },
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
    
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(color: cBlack),
         border: 
         OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        
         )
        ),
        
      ),
    );
  }
}
