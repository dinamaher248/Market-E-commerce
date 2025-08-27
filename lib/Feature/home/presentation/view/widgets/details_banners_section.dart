import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_state.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../view_models/banners/banners_cubit.dart';

class DetailsBannersSection extends StatefulWidget {
  const DetailsBannersSection({
    super.key,
    this.showInternalLoading = true,
  });
  final bool showInternalLoading;

  @override
  State<DetailsBannersSection> createState() => _DetailsBannersSectionState();
}

class _DetailsBannersSectionState extends State<DetailsBannersSection> {
  @override
  void initState() {
    super.initState();
    context.read<BannersCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit, BannersState>(listener: (context, State) {
      if (State is BannersLoaded) {
        // customSnackBar(context, "category Loaded successfully", Colors.green);
        print("brand Loaded successfully");
      } else if (State is BannersError) {
        // customSnackBar(context, State.errMessage, Colors.red);
        print("Error message of get product is ${State.errMessage}");
      }
    }, builder: (context, state) {
      if (state is BannersLoaded) {
        final banners = state.bannerList;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          child: SizedBox(
            height: 16.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: banners.length,
              itemBuilder: (context, index) {
                final banner = banners[index];

                return Container(
                  width: 88.w,
                  alignment: Alignment.center,
                  child: Image.network(
                    "${Endpoints.baseUrlForImage}${banner.replaceAll('\\', '/')}",
                    errorBuilder: (context, error, stackTrace) =>
                        //const Icon(Icons.broken_image),
                        Image.asset(
                          ImagePathes.image13,
                          fit: BoxFit.fill,
                        ),
                  ),
                );
              },
            ),
          ),
        );
      } else if (state is BannersLoading) {
        return widget.showInternalLoading? Container(
          height: MediaQuery.of(context).size.height * 0.5, // نص الشاشة أو أي ارتفاع يناسبك
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ) : const SizedBox.shrink();
      } else if (state is BannersError) {
        return Center(child: Text(state.errMessage));
      } else {
        return const Center(child: Text("No Brands available"));
      }
    });
  }
}
