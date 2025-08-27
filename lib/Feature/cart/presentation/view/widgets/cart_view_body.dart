import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/cart_product_widget.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/check_out_sec_widget.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/total_price_sec.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../../../../core/widgets/core/title_of_product.dart';

class CartViewBody extends StatefulWidget {
  CartViewBody({super.key, required this.products});
  List<ProductModel> products;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool isFav = false;
  int quantity = 0;
  double totalPrice = 0.0;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        TitleOfPoducts(
          title: "Products in Cart",
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];

              totalPrice += product.price;
              return Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: InkWell(
                  onTap: () {
                    context.push(AppRouter.detailsProductPath, extra: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CartProductWidget(
                        imageWidth: 40.w,
                        imageHight: 120,
                        productImage: product.images.isNotEmpty
                            ? product.images[0].replaceAll('\\', '/')
                            : ImagePathes.notExistPhoto,
                        price: "${product.price} LE",
                        rating: product.rating!.toStringAsFixed(1),
                        productName: product.category,
                        IsOffer: true,
                        isFav: true,
                        productId: product.id,
                        quantityRemain: product.remain!,
                        onRemove: () {
                          setState(() {
                            widget.products.removeAt(index);
                          });
                        }),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        TotalPriceSec(widget: widget),
        SizedBox(
          height: 2.h,
        ),
        CheckOutSecWidget(widget: widget),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
