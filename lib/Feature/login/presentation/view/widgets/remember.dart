import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';

class buildRememberMeRow extends StatefulWidget {
  const buildRememberMeRow({super.key});

  @override
  State<buildRememberMeRow> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<buildRememberMeRow> {
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Checkbox(
              value: rememberMe,
              checkColor: Colors.white,
              activeColor: PrimaryColor,
              onChanged: (bool? value) {
                setState(() {
                  rememberMe = value;
                });
              }),
        ),
        CustomTextWidget(
          text: 'Remember me',
          color: Colors.black,
          fontSize: 14.4.sp,
          fontWeight: FontWeight.w400,
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: TextButton(
            onPressed: () {},
            child: TextButton(
              onPressed: () {
                context.push(AppRouter.forgetPasswordWithPhone);
              },
              child: CustomTextWidget(
                text: 'Forgot password?',
                isThemeColor: false,
                color:  PrimaryColor,
                fontSize: 14.4.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
