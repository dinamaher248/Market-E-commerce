import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text__widget.dart';

class TitleOfPoducts extends StatelessWidget {
   TitleOfPoducts({
    super.key,
   required this.title,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 55.w),
      child: CustomTextWidget(
        text: title,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
