import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../home/data/models/product_model.dart';
import '../../../home/presentation/view/widgets/product_widget.dart';

class FavViewContent extends StatefulWidget {
  const FavViewContent({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<FavViewContent> createState() => _FavViewContentState();
}

class _FavViewContentState extends State<FavViewContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
        child: GridView.count(
          crossAxisCount: 2, // col count
          crossAxisSpacing: 2.h,
          mainAxisSpacing: 2.h,
          shrinkWrap: true,
          childAspectRatio: 0.75, // w : h
          padding: EdgeInsets.zero,
          children: widget.products
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
                        isFav: true,
                        isFavPage: true,
                        onRemove: () {
                          setState(() {
                            widget.products
                                .removeWhere((p) => p.id == product.id);
                          });
                        }),
                  ))
              .toList(),
        ));
  }
}
