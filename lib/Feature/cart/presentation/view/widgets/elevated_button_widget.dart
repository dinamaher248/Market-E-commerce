
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';

class ElevatedButtonWidget extends StatelessWidget {
  ElevatedButtonWidget({
    super.key,
    required this.textButton,
    required this.onPressed,
  });
  String textButton;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(90.w, 5.5.h),
        backgroundColor: PrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: CustomTextWidget(
        text: textButton,
        fontSize: 16.sp,
        color: Colors.white,
      ),
    );
  }
}
