import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/reset_pass_state/resete_pass_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:marketi_ecommers/core/errors/exceptions.dart';

import '../../../../cubit/user_cubit/user_state.dart';
import '../../../login/presentation/view_models/signIn_cubit/signIn_state.dart';


class SendResetePasswordCubit extends Cubit<UserState> {
  SendResetePasswordCubit(this.apiConsumer) : super(UserInitialState());
  final ApiConsumer apiConsumer;
  TextEditingController signUpEmail = TextEditingController();

  
  SendResetePassword() async {
    try {
      emit(resetPassLoading());
      final response = await apiConsumer.post(Endpoints.sendPassEmail, data: {
        ApiKey.email: signUpEmail.text.trim(),
      });

      emit(resetPassSuccess(message: response[ApiKey.message]));
    } on ServerException catch (e) {
      emit(restPassFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
