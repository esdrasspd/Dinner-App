import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

   final String? hintText;
  final String labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController nameController;

  const CustomField({
    super.key, 
    this.hintText, 
    required this.labelText, 
    this.helperText, 
    this.icon, 
    this.suffixIcon, 
    this.keyboardType, 
    required this.nameController
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Este campo es requerido';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),

      ),
    );
  }
}