import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/bar_home_Sec.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_popular_product_section.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/category_view_widget.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children: [
            BarHomeSection(),
            SizedBox(
              height: 3.h,
            ),
            const SearchWidget(),
            SizedBox(
              height: 2.h,
            ),
            Image.asset(
              ImagePathes.image13,
              width: 90.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            CategoryViewWidget(text: "Popular Product"),

            DetailsPopularProductSection(),

            //second section
            CategoryViewWidget(text: "Category"),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductWidget(
                    imageWidth: 24.w,
                    imageHight: 120,
                    productImage: ImagePathes.product3,
                    productName: "Pampers",
                  ),
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product4,
                      productName: "Electronics"),
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product5,
                      productName: "Plants"),
                ],
              ),
            ),
            //

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product6,
                      productName: "Phones"),
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product7,
                      productName: "Food"),
                  ProductWidget(
                      imageWidth: 25.w,
                      imageHight: 120,
                      productImage: ImagePathes.product8,
                      productName: "Fashion"),
                ],
              ),
            ),

            //
            CategoryViewWidget(text: "Best for You"),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductWidget(
                    productImage: ImagePathes.product9,
                    imageWidth: 30.w,
                    imageHight: 120,
                    price: "799 LE",
                    productName: "Black JBL Airbods",
                    IsOffer: true,
                    isFav: true,
                    isAdd: true,
                  ),
                  ProductWidget(
                    productImage: ImagePathes.product10,
                    imageWidth: 30.w,
                    imageHight: 10.h,
                    price: "13999 LE",
                    productName: "Sony Smart TV 55 inch ",
                    isFav: true,
                    isAdd: true,
                  ),
                ],
              ),
            ),
            //
            CategoryViewWidget(text: "Brands"),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product11,
                      productName: "Smart Watch"),
                  ProductWidget(
                      imageWidth: 30.w,
                      imageHight: 120,
                      productImage: ImagePathes.product12,
                      productName: "Smart Watch"),
                  ProductWidget(
                      imageWidth: 20.w,
                      imageHight: 120,
                      productImage: ImagePathes.product13,
                      productName: "Smart Watch"),
                ],
              ),
            ),
            //
            CategoryViewWidget(text: "Buy Again"),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductWidget(
                    imageWidth: 30.w,
                    imageHight: 120,
                    productImage: ImagePathes.product4,
                    price: "399 LE",
                    productName: "Black Sony Headphone",
                    isFav: true,
                    isAdd: true,
                  ),
                  ProductWidget(
                    imageWidth: 30.w,
                    imageHight: 120,
                    productImage: ImagePathes.product14,
                    price: "14999 LE",
                    productName: "HP Chromebook laptop",
                    isFav: true,
                    isAdd: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}
