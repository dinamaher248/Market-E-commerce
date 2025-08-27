import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/get_cart/get_cart_cubit.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/get_cart/get_cart_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/bar_widget.dart';
import '../../../../core/widgets/four_orgnaized_widget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BarWidget(
            textBar: "Cart",
          ),
          Expanded(
            child: BlocBuilder<GetCartCubit, GetCartState>(
              builder: (context, state) {
                if (state is GetCartLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetCartLoaded) {
                  if (state.products.isEmpty) {
                    return FourOrgnaizedWidget(
                      image: Image.asset(
                        ImagePathes.image10,
                        width: 200.w,
                        height: 30.h,
                      ),
                      textBold: "Your Cart is Empty",
                      textNormal:
                          "Check our big offers, fresh products and fill your cart with items",
                      textButton: "Start Shopping",
                    );
                  } else {
                    return CartViewBody(
                      products: state.products,
                    );
                  }
                } else if (state is GetCartError) {
                  return Center(child: Text(state.errMessage));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
