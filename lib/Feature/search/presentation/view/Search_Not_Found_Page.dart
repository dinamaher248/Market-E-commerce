import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/widgets/core/title_of_product.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/top_search_list_widget.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:marketi_ecommers/core/widgets/four_orgnaized_widget.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:sizer/sizer.dart';

class SearchNotFoundPage extends StatefulWidget {
  const SearchNotFoundPage({super.key});

  @override
  State<SearchNotFoundPage> createState() => _SearchNotFoundPageState();
}

class _SearchNotFoundPageState extends State<SearchNotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarWidget(),
            SizedBox(
              height: 2.h,
            ),
            const SearchWidget(),
            SizedBox(
              height: 3.h,
            ),
            TitleOfPoducts(title: "Popular Search",),
            SizedBox(
              height: 2.h,
            ),
            const TopSearchListWidget(),
            
           
            //if search not found
            FourOrgnaizedWidget(
              image: Image.asset(
                ImagePathes.image11,
                width: 200.w,
                height: 30.h,
              ),
              textBold: "Oops Not Found!",
              textNormal:
                  "Check our big offers, fresh products and fill your cart with items",
              textButton: "Continue Shopping",
            ),
          ],
        ),
      ),
    );
  }
}
