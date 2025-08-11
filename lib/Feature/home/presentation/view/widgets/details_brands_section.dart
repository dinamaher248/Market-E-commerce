import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/brand_and_categories/brand_and_category_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../view_models/brand_and_categories/brand_cubit.dart';

class DetailsBrandsSection extends StatefulWidget {
  DetailsBrandsSection({
    super.key,
    this.isScrollerV = false,
  });
  bool isScrollerV;
  @override
  State<DetailsBrandsSection> createState() => _DetailsBrandsSectionState();
}

class _DetailsBrandsSectionState extends State<DetailsBrandsSection> {
  @override
  void initState() {
    super.initState();
    context.read<BrandCubit>().fetchProducts();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<BrandCubit, BrandAndCategoryState>(
        listener: (context, State) {
      if (State is BrandAndCategoryLoaded) {
        // customSnackBar(context, "category Loaded successfully", Colors.green);
        print("brand Loaded successfully");
      } else if (State is BrandAndCategoryError) {
        // customSnackBar(context, State.errMessage, Colors.red);
        print("Error message of get product is ${State.errMessage}");
      }
    }, builder: (context, state) {
      if (state is BrandAndCategoryLoaded) {
        final brands = state.products;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          child: widget.isScrollerV == true
              ? GridView.count(
                  crossAxisCount: 2, // عدد الأعمدة
                  crossAxisSpacing: 2.h,
                  mainAxisSpacing: 2.h,
                  shrinkWrap: true,
                  childAspectRatio: 0.75, // نسبة العرض للارتفاع
                  physics:
                      const NeverScrollableScrollPhysics(), // علشان متتداخلش مع Scroll خارجي
                  children: brands
                      .map((brand) => ProductWidget(
                            imageWidth: double.infinity,
                            imageHight: 120,
                            productImage: brand.ImagePath.isNotEmpty
                                ? "${brand.ImagePath[0].replaceAll('\\', '/')}"
                                : ImagePathes.notExistPhoto,
                            productName: brand.name,
                            
                          ))
                      .toList(),
                )
              : SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductWidget(
                          imageWidth: 24.w,
                          imageHight: 120,
                          productImage: brand.ImagePath.isNotEmpty
                              ? "${brand.ImagePath[0].replaceAll('\\', '/')}"
                              : ImagePathes.notExistPhoto,
                          productName: brand.name,
                        ),
                      );
                    },
                  ),
                ),
        );
      } else if (state is BrandAndCategoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is BrandAndCategoryError) {
        return Center(child: Text("${state.errMessage}"));
      } else {
        return Center(child: Text("No Brands available"));
      }
    });
  }
}
