import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/get_cart/get_cart_state.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';

class GetCartCubit extends Cubit<GetCartState> {
  GetCartCubit(this.apiConsumer) : super(GetCartInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchProducts() async {
    emit(GetCartLoading());

    try {
      final token = CacheHelper.getData(key: ApiKey.token);
      if (token == null) {
        emit(GetCartError('No token found'));
        return;
      }
      final response = await apiConsumer.get(
        Endpoints.getCartUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final List data = response['list'];
      final products = data.map((item) => ProductModel.fromJson(item)).toList();

      emit(GetCartLoaded(products.cast<ProductModel>()));
    } catch (e) {
      emit(GetCartError('Failed to load products $e'));
      print(e);
    }
  }
}
