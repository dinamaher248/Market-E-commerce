
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/category_view_widget.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_banners_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_brands_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_popular_product_section.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';

class BuildHomeContent extends StatelessWidget {
  const BuildHomeContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        children: [
          const DetailsBannersSection(
            showInternalLoading: false,
          ),

          CategoryViewWidget(
              text: "Popular Product",
              location: AppRouter.popularProductPagePath),

          DetailsPopularProductSection(
            showInternalLoading: false,
          ),

          CategoryViewWidget(
              text: "Category", location: AppRouter.allCategoriesPagePath),

          DetailsCategorySection(
            showInternalLoading: false,
          ),
          DetailsCategorySection(
            showInternalLoading: false,
          ),

          CategoryViewWidget(
              text: "Best for You", location: AppRouter.bestForYouPagePath),

          DetailsPopularProductSection(
            showInternalLoading: false,
          ),
          CategoryViewWidget(
              text: "Brands", location: AppRouter.allBrandsPagePath),

          DetailsBrandsSection(
            showInternalLoading: false,
          ),
          CategoryViewWidget(
              text: "Buy Again", location: AppRouter.buyAgainPagePath),
          DetailsPopularProductSection(
            showInternalLoading: false,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
