import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view/widgets/enter_register_data_section.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view_models/signUP_cubit/signUP_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../cubit/user_cubit/user_state.dart';
import '../../../../../core/widgets/core/custom_snack_bar.dart';
import 'Social_login.dart';
import '../../../../../core/widgets/core/custom_button.dart';
import '../../view_models/signUP_cubit/signUP_state.dart';
import 'return_sec.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, UserState>(
      listener: (context, State) {
        if (State is SignUpSuccess) {
          customSnackBar(
              context, "Success, Please Verifyed Your Email", Colors.green);
          context.push(AppRouter.loginPath);
        } else if (State is SignUpFailure) {
          customSnackBar(context, State.errMessage, Colors.red);
        }
      },
      builder: (context, State) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const RturnSection(),
              SizedBox(
                height: 3.h,
              ),
              EnterRegisterDataSection(cubit: cubit),
              SizedBox(
                height: 2.h,
              ),
              State is SignUpLoading
                  ? const CircularProgressIndicator(
                      color: PrimaryColor,
                    )
                  : CustomButton(
                      textcolor: Colors.white,
                      groundColor: PrimaryColor,
                      button: "Sign Up",
                      onPressed: () async {
                        await cubit.signUp();
                      },
                    ),
              SizedBox(
                height: 1.h,
              ),
              SocialLoginButtons(context),
              SizedBox(height: 3.h),
            ],
          ),
        );
      },
    );
  }
}
