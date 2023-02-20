import 'package:flutter/material.dart';

class CustemTextFiled extends StatelessWidget {
  CustemTextFiled({
    Key? key,
    required this.hintText,
    this.onChange,
  }) : super(key: key);
  final String hintText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return "Required";
      },
      onChanged: onChange,
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
