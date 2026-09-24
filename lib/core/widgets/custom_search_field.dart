import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const CustomSearchField({
    super.key,
    this.hintText  ,
    this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          prefixIcon:
              prefixIcon 
              ),
        ),
      );
    
  }
}