import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/widgets/forget_pass_widget.dart';
import 'package:marketi_ecommers/widgets/otp_timer_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/colors.dart';
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/pin_code_widget.dart';
import '../widgets/text_field_widget.dart';

class VerifyCodeWithPhone extends StatefulWidget {
  VerifyCodeWithPhone({super.key});

  @override
  State<VerifyCodeWithPhone> createState() =>
      _VerifyCodeWithPhoneState();
}

class _VerifyCodeWithPhoneState extends State<VerifyCodeWithPhone> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPassWidget(
                textBar: "Verification Code",
                image: ImagePathes.image6,
                text:
                    "Please enter the 4 digit code sent to: +20 1501142409 "),
            SizedBox(
              height: 5.h,
            ),
            PinCodeWidget(),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Verify Code",
              onPressed: () {
                context.push(AppRouter.confirmationNewPass);

              },
            ),

            SizedBox(height: 3.h),
            OtpTimer(),
          ],
        ),
      ),
    );
  }
}
