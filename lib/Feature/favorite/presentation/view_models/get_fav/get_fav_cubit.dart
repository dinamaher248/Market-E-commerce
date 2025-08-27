import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view_models/get_fav/get_fav_state.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';

class GetFavCubit extends Cubit<GetFavState> {
  GetFavCubit(this.apiConsumer) : super(GetFavInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchProducts() async {
    emit(GetFavLoading());

    try {
      final token = CacheHelper.getData(key: ApiKey.token);
      if (token == null) {
        emit(GetFavError('No token found'));
        return;
      }
      final response = await apiConsumer.get(
        Endpoints.getFavUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final List data = response['list'];
      final products = data.map((item) => ProductModel.fromJson(item)).toList();

      emit(GetFavLoaded(products.cast<ProductModel>()));
    } catch (e) {
      emit(GetFavError('Failed to load products $e'));
      print(e);
    }
  }
}
