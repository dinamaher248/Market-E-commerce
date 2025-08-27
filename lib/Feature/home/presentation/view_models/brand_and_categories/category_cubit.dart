
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/brand_and_categories/brand_and_category_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/brand_or_categories_model.dart';

class CategoryCubit extends Cubit<BrandAndCategoryState> {
  CategoryCubit(this.apiConsumer) : super(BrandAndCategoryInitial());
  final ApiConsumer apiConsumer;



  Future<void> fetchProducts() async {
    emit(BrandAndCategoryLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(BrandAndCategoryError('No token found'));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.categoryUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final List data = response['list'];
      final products = data.map((item) => BrandOrCategoriesModel.fromJson(item)).toList();

      emit(BrandAndCategoryLoaded(products.cast<BrandOrCategoriesModel>()));
    } catch (e) {
      emit(BrandAndCategoryError('Failed to load category'));
    }
  }
}
