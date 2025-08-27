import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_popular_product_section.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/bar_widget.dart';
import '../../../../core/widgets/four_orgnaized_widget.dart';
import '../view_models/get_fav/get_fav_cubit.dart';
import '../view_models/get_fav/get_fav_state.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarWidget(
          textBar: 'Favorites',
        ),
        Expanded(
          child: BlocBuilder<GetFavCubit, GetFavState>(
            builder: (context, state) {
              if (state is GetFavLoading) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is GetFavLoaded) {
                final products = state.products;
                if (state.products.isEmpty) {
                  return Center(
                    child: FourOrgnaizedWidget(
                      image: Image.asset(
                        ImagePathes.image10,
                        width: 200.w,
                        height: 30.h,
                      ),
                      textBold: "Your Favorites page is Empty",
                      textNormal:
                          "Check our big offers, fresh products and fill your cart with items",
                      textButton: "Start Shopping",
                    ),
                  );
                } else {
                  return Expanded(
                    child: DetailsPopularProductSection(
                      isScrollerV: true,
                      isFav: true,
                      products: products,
                    ),
                  );
                }
              } else if (state is GetFavError) {
                return Center(child: Text(state.errMessage));
              } else {
                return const Center(child: Text("No products available"));
              }
            },
          ),
        ),
      ],
    );
  }
}
