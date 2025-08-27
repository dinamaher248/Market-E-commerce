import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';
import '../../../../cart/presentation/view_models/add_to_cart/add_to_cart_cubit.dart';
import '../../../../cart/presentation/view_models/delete_from_cart/delete_from_cart_cubit.dart';

class AddToCartButton extends StatefulWidget {
  final bool isLoading;
  final String productId;
  final int initialQuantity;

  const AddToCartButton({
    super.key,
    required this.isLoading,
    required this.productId,
    this.initialQuantity = 0,
  });

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    if (quantity > 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 40.w,
        height: 4.h,
        child: Row(
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
                 context.read<DeleteFromCartCubit>().deleteProductCart(widget.productId);
              },
            ),
            Text(
              "$quantity",
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.add, color: PrimaryColor, size: 18),
              onPressed: () {
                setState(() {
                  quantity++;
                });
                 context.read<AddToCartCubit>().addToProductCart(widget.productId);
              },
            ),
          ],
        ),
      );
    }

    return ElevatedButton(
      onPressed: () {
        setState(() {
          quantity = 1;
        });
        context.read<AddToCartCubit>().addToProductCart(widget.productId);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
          side: const BorderSide(color: PrimaryColor, width: 1.5),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.shopping_cart, color: PrimaryColor),
          SizedBox(width: 2.w),
          CustomTextWidget(
            color: PrimaryColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w300,
            text: "Add to Cart",
          ),
        ],
      ),
    );
  }
}
