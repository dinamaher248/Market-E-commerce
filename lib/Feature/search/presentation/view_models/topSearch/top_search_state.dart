
import '../../../data/models/top_search_model.dart';

abstract class TopSearchState {}

class TopSearchInitial extends TopSearchState {}

class TopSearchLoading extends TopSearchState {}

class TopSearchLoaded extends TopSearchState {
  final List<TopSearchModel> products;

  TopSearchLoaded(this.products);
}

class TopSearchError extends TopSearchState {
  final String errMessage;

  TopSearchError(this.errMessage);
}
