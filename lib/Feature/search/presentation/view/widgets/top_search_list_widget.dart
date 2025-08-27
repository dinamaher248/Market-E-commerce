import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view_models/topSearch/top_search_cubit.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view_models/topSearch/top_search_state.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

class TopSearchListWidget extends StatefulWidget {
 const TopSearchListWidget({
    super.key,
  });


  @override
  State<TopSearchListWidget> createState() => _TopSearchListWidgetState();
}

class _TopSearchListWidgetState extends State<TopSearchListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<TopSearchCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopSearchCubit, TopSearchState>(
        listener: (context, State) {
      if (State is TopSearchLoaded) {
        print("Top Search Loaded Successfully");
      } else if (State is TopSearchError) {
        print("Eror message of get top search is ${State.errMessage}");
      }
    }, builder: (context, State) {
      if (State is TopSearchLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (State is TopSearchLoaded) {
        final products = State.products;

        return Wrap(
          spacing: 2.h, // المسافة بين العناصر أفقياً
          runSpacing: 15, // المسافة بين الصفوف (rows)
          children: products.map((item) {
            return Container(
              // padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              height: 5.h,
              width: 25.w,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 139, 182, 235).withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: CustomTextWidget(
                  color: PrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  text: item.data,
                ),
              ),
            );
            //   Chip(
            //     label: Text(item['data']),
            //     backgroundColor: Colors.blue.shade50,
            //   );
          }).toList(),
        );
      } else if (State is TopSearchError) {
        return Center(child: Text(State.errMessage));
      } else {
        return const Center(child: Text("No products available"));
      }
    });
  }
}
