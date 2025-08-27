import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:marketi_ecommers/core/widgets/core/title_of_product.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/bar_widget.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BarWidget(
            textBar: 'Categories',
          ),
          SizedBox(
            height: 2.h,
          ),
          const SearchWidget(),
          SizedBox(
            height: 3.h,
          ),
          TitleOfPoducts(
            title: "All Categories",
          ),
          
          Expanded(
            child: DetailsCategorySection(
              isScrollerV: true,
            ),
          ),
        ],
      ),
    );
  }
}
