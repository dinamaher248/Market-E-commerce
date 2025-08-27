import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/add_to_cart/add_to_cart_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../../core/Api/endpoints.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.apiConsumer) : super(AddToCartInitial());
  final ApiConsumer apiConsumer;

  Future<void> addToProductCart(String productId) async {
    emit(AddToCartLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(AddToCartError('No token found'));
        return;
      }

      final response = await apiConsumer.post(
        Endpoints.addToCartUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "productId": productId,
        },
      );
      emit(AddToCartLoaded(response.data));
    } catch (e) {
      emit(AddToCartError("Error adding to cart: $e"));
    }
  }
}
