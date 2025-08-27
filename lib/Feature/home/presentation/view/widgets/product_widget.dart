
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../cart/presentation/view_models/delete_from_cart/delete_from_cart_cubit.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget({
    super.key,
    required this.productId,
    this.productImage,
    this.price,
    required this.productName,
    this.imageHight,
    required this.imageWidth,
    this.IsOffer,
    this.isFav,
    this.isFavPage,
    this.isAdd,
    this.rating = "4.9",
    this.onRemove,
  });
  String? productImage;
  String? price;
  String productName;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  final bool? isFavPage;
  bool? isAdd;
  String? rating;
  final String productId;
  final VoidCallback? onRemove;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFav = false;
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface, //Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.isAdd == true
                ? Expanded(
                    child: ImageWidget(
                      imageWidth: widget.imageWidth,
                      imageHight: widget.imageHight,
                      IsOffer: widget.IsOffer,
                      isFav: widget.isFav,
                      isFavPage: widget.isFavPage,
                      isAdd: widget.isAdd,
                      productImage: widget.productImage,
                      nameProduct: widget.productName,
                      productId: widget.productId,
                      onRemove: widget.onRemove,
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ImageWidget(
                          imageWidth: widget.imageWidth,
                          imageHight: widget.imageHight,
                          IsOffer: widget.IsOffer,
                          isFav: widget.isFav,
                          isFavPage: widget.isFavPage,
                          isAdd: widget.isAdd,
                          productImage: widget.productImage,
                          nameProduct: widget.productName,
                          productId: widget.productId,
                        ),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.price != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: CustomTextWidget(
                      color: TextColor,
                      fontSize: 2.h,
                      fontWeight: FontWeight.w500,
                      text: widget.price!,
                    ),
                  ),
                if (widget.price != null) SizedBox(width: 10.w),
                if (widget.price != null)
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                if (widget.price != null) Text("${widget.rating}"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SizedBox(
                width: 35.w,
                child: Center(
                  child: CustomTextWidget(
                    color: TextColor,
                    fontSize: 2.h,
                    fontWeight: FontWeight.w500,
                    text: widget.productName,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            if (widget.isAdd == true)
              SizedBox(
                height: 3.h,
              ),
            if (widget.isAdd == true)
              Align(
                alignment: Alignment.center,
                child: quantity == 0
                    ? Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: SizedBox(
                          width: 34.w,
                          height: 4.h,
                          child: FloatingActionButton.extended(
                            onPressed: () async {
                              setState(() {
                                quantity = 1;
                              });
                              context
                                  .read<AddToCartCubit>()
                                  .addToProductCart(widget.productId);
                            },
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            heroTag: null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            label: Text(
                              "Add",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 34.w,
                          height: 4.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                icon: quantity == 1
                                    ? const Icon(Icons.delete,
                                        color: Colors.red, size: 18)
                                    : const Icon(Icons.remove,
                                        color: PrimaryColor, size: 18),
                                onPressed: () {
                                  setState(() {
                                    quantity--;
                                  });
                                  context
                                      .read<DeleteFromCartCubit>()
                                      .deleteProductCart(widget.productId);
                                },
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero,
                                icon: const Icon(Icons.add,
                                    color: PrimaryColor, size: 18),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                  context
                                      .read<AddToCartCubit>()
                                      .addToProductCart(widget.productId);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
