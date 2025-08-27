import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/banners_model.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.apiConsumer) : super(BannersInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchProducts() async {
    emit(BannersLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(BannersError('No token found'));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.bannerssUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final bannersModel = BannersModel.fromJson(response);
      emit(BannersLoaded(bannersModel.bannerList));
    } catch (e) {
      emit(BannersError('Failed to load banners'));
    }
  }
}
