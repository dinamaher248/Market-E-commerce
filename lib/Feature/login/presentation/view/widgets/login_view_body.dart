import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view/widgets/enter_data_Sec.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view/widgets/skip_section.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view/widgets/to_register_sec.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view_models/signIn_cubit/signIn_state.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../../../../cubit/user_cubit/user_state.dart';
import '../../../../../core/widgets/core/custom_snack_bar.dart';
import '../../view_models/login_screen_model.dart';
import '../../../../register/presentation/view/widgets/Social_login.dart';
import '../../../../../core/widgets/core/custom_button.dart';
import 'remember.dart';
import '../../view_models/signIn_cubit/signIn_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var loginScreenModel = LoginScreenModel();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SigninCubit>();
    return BlocConsumer<SigninCubit, UserState>(
      listener: (context, State) {
        if (State is SignInSuccess) {
          customSnackBar(
              context, loginScreenModel.successfulluSnackBar, Colors.green);
          context.push(AppRouter.homePath);
        } else if (State is SignInFailure) {
          customSnackBar(context, State.errMessage, Colors.red);
        }
      },
      builder: (context, State) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              const SkipSection(),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: Image.asset(ImagePathes.logo),
              ),
              SizedBox(
                height: 3.h,
              ),
              EnterDataSection(cubit: cubit),
              const buildRememberMeRow(),
              SizedBox(
                height: 2.h,
              ),
              State is SignInLoading
                  ? const CircularProgressIndicator(
                      color: PrimaryColor,
                    )
                  : CustomButton(
                      textcolor: Colors.white,
                      groundColor: PrimaryColor,
                      button: "Log In",
                      onPressed: () async {
                        await cubit.signIn();
                      },
                    ),
              SizedBox(
                height: 1.h,
              ),
              SocialLoginButtons(context),
              SizedBox(height: 2.h),
              const ToRegisterSection(),
              SizedBox(height: 3.h),
            ],
          ),
        );
      },
    );
  }
}
