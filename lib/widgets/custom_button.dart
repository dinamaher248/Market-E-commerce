import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'text__widget.dart';

class CustomButton extends StatelessWidget {
  final String button;
  final VoidCallback onPressed;
  Color textcolor;
  Color groundColor;
  CustomButton({
    super.key,
    required this.button,
    required this.onPressed,
    required this.textcolor,
    required this.groundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 90.w,
        height: 7.h,
        decoration: BoxDecoration(
          color: groundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: TextWidget(
            text: '$button',
            color: textcolor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
