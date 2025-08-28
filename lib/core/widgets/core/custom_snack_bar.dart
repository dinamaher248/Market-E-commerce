import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

void customSnackBar(context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      duration: const Duration(
        milliseconds: 3000,
      ),
      elevation: 5,
      clipBehavior: Clip.none,
      dismissDirection: DismissDirection.endToStart,
      content: Center(
          child: CustomTextWidget(
        text: text,
        color: Colors.white,
        textAlign: TextAlign.center,
        fontSize: 16.sp,
        
      )),
    ),
  );
}