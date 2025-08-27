
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../cart/presentation/view_models/delete_from_cart/delete_from_cart_cubit.dart';

class CartProductWidget extends StatefulWidget {
  CartProductWidget({
    super.key,
    required this.productId,
    this.productImage,
    this.price,
    required this.productName,
    this.imageHight,
    required this.imageWidth,
    this.IsOffer,
    this.isFav,
    this.rating = "4.9",
    this.quantityRemain = 10,
    this.onRemove,
  });
  String? productImage;
  String? price;
  String productName;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  String? rating;
  final String productId;
  final int quantityRemain;
  final VoidCallback? onRemove;
  @override
  State<CartProductWidget> createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  bool isFav = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 25.w,
          child: ImageWidget(
            imageWidth: widget.imageWidth,
            imageHight: widget.imageHight,
            IsOffer: widget.IsOffer,
            productImage: widget.productImage,
            nameProduct: widget.productName,
            productId: widget.productId,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: CustomTextWidget(
                        color: Colors.black,
                        fontSize: 16,
                        text: widget.productName,
                        fontWeight: FontWeight.w500,
                        maxLines: 3,
                      ),
                    ),
                    Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black45 
                              : Colors.white70
                    ),
                  ],
                ),
                CustomTextWidget(
                  color: const Color.fromARGB(255, 125, 124, 124),
                  fontSize: 15.sp,
                  text: " ${widget.quantityRemain} Diapers",
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: CustomTextWidget(
                        color: TextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        text: "Price : ${widget.price!}",
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        Text("${widget.rating}"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: quantity == 1
                          ? const Icon(Icons.delete, color: Colors.red, size: 18)
                          : const Icon(Icons.remove, color: PrimaryColor, size: 18),
                      onPressed: () {
                        setState(() {
                          quantity--;
                        });
                        if (quantity < 1) {
                          context
                              .read<DeleteFromCartCubit>()
                              .deleteProductCart(widget.productId);
                          widget.onRemove?.call();
                        } else {
                          context
                              .read<DeleteFromCartCubit>()
                              .deleteProductCart(widget.productId);
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.h),
                      child: Text(
                        "$quantity",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add, color: PrimaryColor, size: 18),
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
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
