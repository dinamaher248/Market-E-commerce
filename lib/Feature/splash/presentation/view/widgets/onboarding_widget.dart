import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/colors.dart';
import 'dots_indicator.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.indexOfDOt,
  });
  String text1;
  String text2;
  String image;
  int indexOfDOt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 5.h,
        ),
        DotsIndicator(
          currentIndex: indexOfDOt,
          totalDots: 3,
        ),
        SizedBox(
          height: 3.h,
        ),
        CustomTextWidget(
          text: text1,
          textAlign: TextAlign.center,
          color: TextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: CustomTextWidget(
            text: text2,
            textAlign: TextAlign.center,
            color: TextColor,
            maxLines: 5,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
