import 'package:flutter/material.dart';

class HeightSpace extends StatelessWidget {
  double height;
  HeightSpace({
    Key? key,
    this.height = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
