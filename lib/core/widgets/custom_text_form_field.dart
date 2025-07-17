import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  final String? hintText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.00),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        validator: validator ??
            (data) {
              if (data == null || data.isEmpty) {
                return "Please enter $hintText";
              }
              return null;
            },
        onSaved: onSaved,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          filled: true,
          fillColor: Colors.grey.shade100,
          prefixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.grey.shade500)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blue.shade400, width: 1.5),
          ),
        ),
      ),
    );
  }
}
