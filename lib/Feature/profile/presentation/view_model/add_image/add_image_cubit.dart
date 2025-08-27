import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/add_image/add_image_state.dart';
import '../../../../../core/Api/api_consumer.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/user_data_model.dart';

class AddImageCubit extends Cubit<AddImageState> {
  final ApiConsumer apiConsumer;

  AddImageCubit(this.apiConsumer) : super(AddImageInitial());

  Future<void> uploadImage(File imageFile) async {
    try {
      emit(AddImageLoading());
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(AddImageError("No token found"));
        return;
      }
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imageFile.path,
             filename: imageFile.path.split('/').last
),
      });

      Response response = await apiConsumer.post(
        Endpoints.addImageUrl,
        data: formData,
        isFormData: true,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      final userData = UserDataModel.fromJson(response.data["message"]);
      print("Uploading to: ${Endpoints.baseUrl}/portfoilo/addImage");
      print("File Path: ${imageFile.path}");
      print("Token: ${CacheHelper.getData(key: ApiKey.token)}");

      emit(AddImageLoaded(userData));
    } catch (e) {
      emit(AddImageError("Failed to  Upload $e"));
    }
  }
}
