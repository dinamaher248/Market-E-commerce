import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/checkout/data/models/checkout_model_product.dart';
import 'package:marketi_ecommers/Feature/checkout/presentation/view_model/checkout_cubit/checkout_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../../core/Api/endpoints.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.apiConsumer) : super(CheckoutInitial());
  final ApiConsumer apiConsumer;

  Future<void> checkoutAll(List<CheckOutModelProduct> products) async {
    emit(CheckoutLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(CheckoutError('No token found'));
        return;
      }
      final userId = CacheHelper.getData(key: ApiKey.id);

      final response = await apiConsumer.post(
        Endpoints.checkoutUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "userId": userId,
          "products": products.map((p) => p.toJson()).toList(),
        },
      );
      final List<CheckOutModelProduct> checkedOutProducts =
          (response.data['products'] as List)
              .map((json) => CheckOutModelProduct(
                    products: json['product'],
                    quantity: json['quantity'],
                  ))
              .toList();

      emit(CheckoutLoaded(checkedOutProducts));
    } catch (e) {
      emit(CheckoutError("Error during checkout: $e"));
    }
  }
}
