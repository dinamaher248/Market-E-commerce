class UserState {}

final class UserInitialState extends UserState {}

final class SignInSuccess extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

///####################################################
final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}


final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
///#####################################################
final class resetPassSuccess extends UserState {
    final String message;

  resetPassSuccess({required this.message});

}

final class resetPassLoading extends UserState {}

final class restPassFailure extends UserState {
  final String errMessage;

  restPassFailure({required this.errMessage});

}
///#####################################################
final class GetUserSuccess extends UserState {

}

final class GetUserLoading extends UserState{}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
