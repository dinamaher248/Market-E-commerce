import 'package:marketi_ecommers/core/Api/endpoints.dart';

class SignUpModel {
  final String message;
  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(message: jsonData[ApiKey.message]);
  }

  SignUpModel({required this.message});
}
