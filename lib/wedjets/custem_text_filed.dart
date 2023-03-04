import 'package:flutter/material.dart';

class CustemTextFiled extends StatelessWidget {
  CustemTextFiled({
    Key? key,
    required this.hintText,
    this.onChange,
    this.obscure = false,
  }) : super(key: key);
  final String hintText;
  Function(String)? onChange;
  final bool? obscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return "Required";
      },
      style: TextStyle(color: Colors.lightBlue),
      onChanged: onChange,
      obscureText: obscure!,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          hintStyle: const TextStyle(
            color: Colors.white,
          )),
    );
  }
}
