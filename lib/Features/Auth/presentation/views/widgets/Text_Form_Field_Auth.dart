

import 'package:flutter/material.dart';


class TextFormFieldAuth extends StatelessWidget {
  const TextFormFieldAuth({

    super.key,
    required this.controller,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.border = const OutlineInputBorder(),
    this.maxLines = 1,
    this.validator,
    this.textInputType,
  });

  final TextEditingController controller;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final InputBorder? border;
  final int? maxLines;
    final TextInputType? textInputType ;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
          labelText: labelText,

          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          border: border,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.black45
              )
          ) ,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.black,
              )
          )
        //    errorStyle: Styles.textStyle16,
      ),
      //     style: Styles.textStyle18,
      obscureText: obscureText,

    );
  }
}