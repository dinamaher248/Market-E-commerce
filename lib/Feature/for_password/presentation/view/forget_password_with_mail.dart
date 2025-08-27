import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/reset_pass_state/resete_pass_state.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/send_resete_password_cubit.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/cubit/user_cubit/user_state.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/widgets/forget_pass_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../register/presentation/view/widgets/build_label_text.dart';
import '../../../../core/widgets/core/custom_button.dart';
import '../../../../core/widgets/core/text_field_widget.dart';

class ForgetPasswordWithMail extends StatefulWidget {
  const ForgetPasswordWithMail({super.key});

  @override
  State<ForgetPasswordWithMail> createState() => _ForgetPasswordWithMailState();
}

class _ForgetPasswordWithMailState extends State<ForgetPasswordWithMail> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendResetePasswordCubit>();
    return BlocConsumer<SendResetePasswordCubit, UserState>(
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
              children: [
                ForgetPassWidget(
                    textBar: "Forgot Password",
                    image: ImagePathes.image5,
                    text:
                        "Please enter your email address to receive a verification code"),
                SizedBox(
                  height: 5.h,
                ),
                //Email
                BuildLabelText(
                  sizePaddding: 33,
                  text: "Email",
                ),
                TextFieldWidget(
                  mailPassText: 'You@gmail.com',
                  icon: Icons.mail_outline,
                  controller: cubit.signUpEmail,
                  errorText: null,
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
                        button: "Send Code",
                        onPressed: () async {
                          await cubit.SendResetePassword();
                          if (!mounted) return;
                          context.push(AppRouter.verifyCodeWithMail);
                        },
                      ),

                SizedBox(height: 3.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
