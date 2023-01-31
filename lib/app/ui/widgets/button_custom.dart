import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final double width;
  final double? height;
  final double? fontSize;
  final String label;
  final Color color;
  ButtonCustom({
    Key? key,
    this.onPressed,
    required this.width,
    this.height = 40,
    this.fontSize,
    required this.label,
    this.color = const Color(0xff266386),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.5,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
