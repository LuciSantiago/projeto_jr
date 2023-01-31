import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputForm extends StatelessWidget {
  final double width;
  String label;
  bool isBorder;
  double height;
  final double fontSize;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool senha;
  InputForm({
    Key? key,
    required this.width,
    required this.label,
    this.isBorder = true,
    this.height = 50,
    this.fontSize = 20,
    this.controller,
    this.senha = false,
    this.inputFormatters,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.88,
      height: height,
      child: TextFormField(
        keyboardType: inputType,
        obscureText: senha,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          focusedBorder: isBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Color(0xff266386),
                    width: 2.0,
                  ),
                )
              : const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff266386),
                    width: 2.0,
                  ),
                ),
          label: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
                color: Colors.black87),
          ),
          border: isBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )
              : const UnderlineInputBorder(), //InputBorder.none,
        ),
      ),
    );
  }
}
