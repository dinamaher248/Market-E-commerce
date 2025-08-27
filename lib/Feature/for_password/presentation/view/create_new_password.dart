import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/widgets/forget_pass_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../register/presentation/view/widgets/build_label_text.dart';
import '../../../../core/widgets/core/custom_button.dart';
import '../../../../core/widgets/core/text_field_widget.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() =>
      _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPassWidget(
                textBar: "Create New Password",
                image: ImagePathes.image4,
                text:
                    "New password must be different from last password"),
            SizedBox(
              height: 5.h,
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
              height: 2.h,
            ),

            //Confirm Password
            BuildLabelText(
              sizePaddding: 23,
              text: "Confirm Password",
            ),
            TextFieldWidget(
              mailPassText: 'Confirm Password',
              icon: Icons.lock_outlined,
              controller: _confirmPasswordController,
            ),
            SizedBox(
              height: 3.h,
            ),

            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Save Password",
              onPressed: () {},
            ),

            SizedBox(height: 3.h),
          ] 
        ),
      ),
    );
  }
}
