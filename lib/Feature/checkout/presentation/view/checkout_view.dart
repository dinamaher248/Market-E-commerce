import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/widgets/bar_widget.dart';
import '../../../cart/presentation/view/widgets/elevated_button_widget.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BarWidget(
                textBar: "Checkout",
              ),
              const SizedBox(height: 20),
              CustomTextWidget(
                  color: Colors.black,
                  fontSize: 16,
                  text: "Address",
                  fontWeight: FontWeight.bold),
        
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.home, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Home",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Anshas, Al-sharqia, Egypt."),
                          Text("Mobile: +20 101 840 3043"),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change"),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 20),
        
              // Delivery time
              CustomTextWidget(
                  color: Colors.black,
                  fontSize: 16,
                  text: "Delivery time",
                  fontWeight: FontWeight.bold),
        
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.local_shipping_outlined, color: Colors.black54),
                    SizedBox(width: 8),
                    Text("Within 2 days"),
                  ],
                ),
              ),
        
              const SizedBox(height: 20),
        
              CustomTextWidget(
                  color: Colors.black,
                  fontSize: 16,
                  text: "Payment",
                  fontWeight: FontWeight.bold),
        
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.payments_outlined, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text("Cash on delivery"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change"),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: 20),
        
              // Voucher code
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
        
              CustomTextWidget(
                  color: Colors.black,
                  fontSize: 16,
                  text: "Payment",
                  fontWeight: FontWeight.bold),
        
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildRow("Subtotal (3 items)", "EGP 1,120.00"),
                    const Divider(),
                    _buildRow("Delivery Fees", "EGP 10.00"),
                    const Divider(thickness: 1.5),
                    _buildRow("Total", "EGP 1,130.00",
                        isBold: true, color: Colors.blue),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              ElevatedButtonWidget(
                textButton: "Place Order",
                onPressed: () {
                  context.push(AppRouter.successOrderPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildRow(String label, String value,
    {bool isBold = false, Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextWidget(
          color: Colors.black,
          fontSize: 17.sp,
          text: label,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      CustomTextWidget(
        color: color ?? Colors.black,
        fontSize: 17.sp,
        text: value,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    ],
  );
}
