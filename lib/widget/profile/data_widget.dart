import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.hintText,
    required this.dataText,
  });

  final String hintText;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    String fontFamily = "greycliffcf";
    double hintTextSize = 16;
    double labelTextSize = 18;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$hintText: ",
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: labelTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dataText,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: hintTextSize,
          ),
        ),
      ],
    );
  }
}