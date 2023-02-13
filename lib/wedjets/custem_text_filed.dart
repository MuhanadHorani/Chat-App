import 'package:flutter/material.dart';

class CustemTextFiled extends StatelessWidget {
  const CustemTextFiled({
    Key? key,
    required this.hintText,
  }) : super(key: key);
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );
  }
}
