
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/add_to_cart_button.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/image_pathes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BarWidget(
            textBar: "Product Details",
            isIcon: true,
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                Image.network(
                  product.images[0].replaceAll('\\', '/'),
                  width: 90.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    ImagePathes.product2,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.category}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
                              Text(" ${product.rating.toStringAsFixed(1)}",
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${product.title}",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          "${product.description}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            )),
          ),

          ///
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "Price \$${product.price}",
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),

                AddToCartButton(
                  isLoading: true,
                  productId: product.id,
                ),
                // addToCartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
