import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/widgets/forget_pass_widget.dart';
import 'package:marketi_ecommers/Feature/verify/presentation/view/widgets/otp_timer_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../../cubit/user_cubit/user_state.dart';
import '../view_models/activated_reset_password_cubit.dart';
import '../../../for_password/presentation/view_models/reset_pass_state/resete_pass_state.dart';
import '../../../../core/widgets/core/custom_button.dart';
import 'widgets/pin_code_widget.dart';
import '../../../register/presentation/view_models/signUP_cubit/signUP_state.dart';

class VerifyCodeWithMail extends StatefulWidget {
  const VerifyCodeWithMail({super.key});

  @override
  State<VerifyCodeWithMail> createState() => _VerifyCodeWithMailState();
}

class _VerifyCodeWithMailState extends State<VerifyCodeWithMail> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ActivatedResetPasswordCubit>();
    return BlocConsumer<ActivatedResetPasswordCubit, UserState>(
      listener: (context, State) {
        if (State is resetPassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.green,
              content:
                  Center(child: Text(State.message)),
            ),
          );
        } else if (State is SignUpFailure) {
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
              children: [
                ForgetPassWidget(
                    textBar: "Verification Code",
                    image: ImagePathes.image7,
                    text:
                        "Please enter the 8 digit code sent to: You@gmail.com "),
                SizedBox(
                  height: 5.h,
                ),
                PinCodeWidget(codeController: cubit.codeConfirm),
                SizedBox(
                  height: 3.h,
                ),
               State is resetPassLoading
                  ? const CircularProgressIndicator()
                  :  CustomButton(
                  textcolor: Colors.white,
                  groundColor: PrimaryColor,
                  button: "Verify Code",
                  onPressed: () async{
                        await cubit.activatedResetePassword();
                    context.push(AppRouter.confirmationNewPass);
                  },
                ),
                SizedBox(height: 3.h),
                const OtpTimer(),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
