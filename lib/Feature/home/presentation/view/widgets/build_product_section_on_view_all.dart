import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../view_models/Product/product_cubit.dart';
import '../../view_models/Product/product_state.dart';

Widget buildProductSection(bool isScrollerV, bool showInternalLoading) {
  return BlocConsumer<ProductCubit, ProductState>(listener: (context, State) {
    if (State is ProductLoaded) {
    } else if (State is ProductError) {
      print("Eror message of get product is ${State.errMessage}");
    }
  }, builder: (context, state) {
    if (state is ProductLoaded) {
      final products = state.products;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
        child: isScrollerV == true
            ? ProductsInVerticalPage(products: products)
            : ProductInHomePage(products: products),
      );
    } else if (state is ProductLoading) {
      return showInternalLoading
          ? Container(
              height: MediaQuery.of(context).size.height * 0.5,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : const SizedBox.shrink();
    } else if (state is ProductError) {
      return Center(child: Text(state.errMessage));
    } else {
      return const Center(child: Text("No products available"));
    }
  });
}

class ProductInHomePage extends StatelessWidget {
  const ProductInHomePage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 28.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: InkWell(
                onTap: () {
                  context.push(AppRouter.detailsProductPath,
                      extra: product);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductWidget(
                    imageWidth: 40.w,
                    imageHight: 120,
                    productImage: product.images.isNotEmpty
                        ? product.images[0].replaceAll('\\', '/')
                        : ImagePathes.notExistPhoto,
                    price: "${product.price} LE",
                    rating: product.rating!.toStringAsFixed(1),
                    productName: product.title,
                    IsOffer: true,
                    isAdd: true,
                    isFav: true,
                    productId: product.id,
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}

class ProductsInVerticalPage extends StatelessWidget {
  const ProductsInVerticalPage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2, 
        crossAxisSpacing: 2.h,
        mainAxisSpacing: 2.h,
        shrinkWrap: true,
        childAspectRatio: 0.75, 
        padding: EdgeInsets.zero, 
        children: products
            .map((product) => InkWell(
                  onTap: () {
                    context.push(AppRouter.detailsProductPath,
                        extra: product);
                  },
                  child: ProductWidget(
                    imageWidth: double.infinity,
                    imageHight: 120,
                    productImage: product.images.isNotEmpty
                        ? product.images[0].replaceAll('\\', '/')
                        : ImagePathes.notExistPhoto,
                    productName: product.title,
                    isAdd: true,
                    rating: product.rating!.toStringAsFixed(1),
                    price: "${product.price} LE",
                    productId: product.id,
                  ),
                ))
            .toList(),
      );
  }
}
