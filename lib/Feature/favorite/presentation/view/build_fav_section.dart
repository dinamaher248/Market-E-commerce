import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view/fav_view_content.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/core/title_of_product.dart';
import '../../../home/data/models/product_model.dart';
import '../../../search/presentation/view/widgets/search_widget.dart';

Widget buildFavSection(
    bool showInternalLoading, final List<ProductModel> products) {
  return Column(
    children: [
      SizedBox(
        height: 2.h,
      ),
      const SearchWidget(),
      SizedBox(
        height: 3.h,
      ),
      TitleOfPoducts(
        title: "All Products",
      ),
      FavViewContent(products: products),
    ],
  );
  
}
