import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/bar_home_Sec.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/build_home_content.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/home_cubit/home_state.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BarHomeSection(),
        SizedBox(
          height: 3.h,
        ),
        InkWell(
          child: const SearchWidget(),
          onTap: () {
            context.go(AppRouter.searchNotFoundPage);
          },
        ),
      
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial || state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoaded) {
                return const BuildHomeContent();
              } else if (state is HomeError) {
                return Center(child: Text(state.errMessage));
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
