import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/reset_pass_state/resete_pass_state.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../cubit/user_cubit/user_state.dart';
import '../../../../core/widgets/core/custom_button.dart';
import '../../../../core/widgets/core/custom_text__widget.dart';
import '../../../../core/widgets/core/text_field_widget.dart';
import '../view_models/reset_pass_cubit.dart';

class ConfirmationNewPass extends StatefulWidget {
  const ConfirmationNewPass({super.key});

  @override
  State<ConfirmationNewPass> createState() => _ConfirmationNewPassState();
}

class _ConfirmationNewPassState extends State<ConfirmationNewPass> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPassCubit>();
    return BlocConsumer<ResetPassCubit, UserState>(
      listener: (context, State) {
        if (State is resetPassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text(State.message)),
            ),
          );
        } else if (State is restPassFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(State.errMessage),
            ),
          );
        }
      },
      builder: (context, State) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, left: 3.h),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: BorderColor,
                              width: 2,
                            ),
                          ),
                          child: Center(
                              child: IconButton(
                            icon: Icon(
                              Icons.arrow_left_outlined,
                              size: 5.h,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Center(
                    child: Image.asset(
                      ImagePathes.image9,
                      width: 200.w,
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomTextWidget(
                  isThemeColor: false,
                  color: Theme.of(context).brightness == Brightness.light
                      ? TextColor
                      : const Color.fromARGB(255, 169, 190, 239),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  text: "Congratulations",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: CustomTextWidget(
                    text: "Please Enter Your new Password",
                    textAlign: TextAlign.center,
                    color: const Color(0xff51526C),
                    fontSize: 15.7.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                TextFieldWidget(
                  mailPassText: 'You@gmail.com',
                  icon: Icons.mail_outline,
                  controller: cubit.signUpEmail,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFieldWidget(
                  mailPassText: 'Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.signUpPassword,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFieldWidget(
                  mailPassText: 'Confirm Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.confirmPassword,
                ),
                SizedBox(
                  height: 3.h,
                ),
                State is resetPassLoading
                    ? const CircularProgressIndicator(
                        color: PrimaryColor,
                      )
                    : CustomButton(
                        textcolor: Colors.white,
                        groundColor: PrimaryColor,
                        button: "Done",
                        onPressed: () async {
                          await cubit.resetePassword();
                          if (!mounted) return;
                          context.push(AppRouter.congratulationResetPass);
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
