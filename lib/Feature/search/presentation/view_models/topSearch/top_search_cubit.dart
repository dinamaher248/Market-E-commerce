import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view_models/topSearch/top_search_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/top_search_model.dart';

class TopSearchCubit extends Cubit<TopSearchState> {
  TopSearchCubit(this.apiConsumer) : super(TopSearchInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchProducts() async {
    emit(TopSearchLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(TopSearchError('No token found'));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.topSearchsUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final List data = response['list'];
      final products = data.map((item) => TopSearchModel.fromJson(item)).toList();

      emit(TopSearchLoaded(products.cast<TopSearchModel>()));
    } catch (e) {
      emit(TopSearchError('Failed to load products'));
    }
  }
}
