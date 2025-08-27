import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/widgets/forget_pass_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../register/presentation/view/widgets/build_label_text.dart';
import '../../../../core/widgets/core/custom_button.dart';
import '../../../../core/widgets/core/text_field_widget.dart';
import '../../../../core/widgets/core/custom_text__widget.dart';

class ForgetPasswordWithPhone extends StatefulWidget {
  const ForgetPasswordWithPhone({super.key});

  @override
  State<ForgetPasswordWithPhone> createState() =>
      _ForgetPasswordWithPhoneState();
}

class _ForgetPasswordWithPhoneState extends State<ForgetPasswordWithPhone> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPassWidget(
                textBar: "Forgot Password",
                image: ImagePathes.image4,
                text:
                    "Please enter your phone number to receive a verification code"),
            SizedBox(
              height: 3.h,
            ),
            //Phone Number
            BuildLabelText(
              sizePaddding: 26,
              text: "Phone Number",
            ),

            TextFieldWidget(
              mailPassText: 'Phone Number',
              icon: Icons.phone,
              controller: _phoneController,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Send Code",
              onPressed: () {
                context.push(AppRouter.verifyCodeWithPhone);
              },
            ),

            SizedBox(height: 3.h),
            TextButton(
              onPressed: () {
                context.push(AppRouter.forgetPasswordWithMail);
              },
              child: CustomTextWidget(
                text: 'Try Another Way',
                color: PrimaryColor,
                fontSize: 16.7.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
