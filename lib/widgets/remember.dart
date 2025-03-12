import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../constant/app_router.dart';
import '../constant/colors.dart';

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
        Text(
          'Remember me',
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14.4.sp,
              fontWeight: FontWeight.w400),
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
              child: Text(
                'Forgot password?',
                style: GoogleFonts.poppins(
                    color: PrimaryColor,
                    fontSize: 14.4.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
