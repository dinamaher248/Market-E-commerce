import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/widgets/bar_widget.dart';
import '../../../cart/presentation/view/widgets/elevated_button_widget.dart';
import '../view_model/checkout_cubit/checkout_cubit.dart';
import '../view_model/checkout_cubit/checkout_state.dart';
import 'widgets/address_card.dart';
import 'widgets/build_row.dart';
import 'widgets/info_card.dart';
import 'widgets/section_title.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.checkoutData});
  final dynamic checkoutData;
  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Order placed successfully ✅")),
            );
            context.push(AppRouter.successOrderPage);
          } else if (state is CheckoutError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BarWidget(textBar: "Checkout"),
                  const SizedBox(height: 20),

                  /// Address Section
                  sectionTitle("Address"),
                  const SizedBox(height: 8),
                  addressCard(),

                  const SizedBox(height: 20),

                  /// Delivery time
                  sectionTitle("Delivery time"),
                  const SizedBox(height: 8),
                  infoCard(
                    icon: Icons.local_shipping_outlined,
                    text: "Within 2 days",
                  ),

                  const SizedBox(height: 20),

                  /// Payment Method
                  sectionTitle("Payment"),
                  const SizedBox(height: 8),
                  infoCard(
                    icon: Icons.payments_outlined,
                    text: "Cash on delivery",
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text("Change"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Voucher
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Voucher code",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Apply"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Payment Summary
                  sectionTitle("Payment"),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        buildRow("Subtotal (3 items)", "EGP 1,120.00"),
                        const Divider(),
                        buildRow("Delivery Fees", "EGP 10.00"),
                        const Divider(thickness: 1.5),
                        buildRow("Total", "EGP 1,130.00",
                            isBold: true, color: Colors.blue),
                      ],
                    ),
                  ),

                  SizedBox(height: 7.h),

                  /// Place Order Button
                  ElevatedButtonWidget(
                    textButton: "Place Order",
                    onPressed: () {
                      context.read<CheckoutCubit>().checkoutAll(
                            widget.checkoutData.products,
                          );

                      print(
                        widget.checkoutData.userId,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
