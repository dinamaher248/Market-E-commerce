import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/delete_from_cart/delete_from_cart_cubit.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/get_cart/get_cart_cubit.dart';
import 'package:marketi_ecommers/Feature/checkout/presentation/view_model/checkout_cubit/checkout_cubit.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view_models/add_to_fav/add_to_fav_cubit.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/send_resete_password_cubit.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/add_image/add_image_cubit.dart';
import 'package:marketi_ecommers/core/Api/dio_consumer.dart';
import 'package:marketi_ecommers/core/services/theme_cubit.dart';
import 'package:marketi_ecommers/core/widgets/bottom_navigation.dart';

import '../../Feature/cart/presentation/view_models/add_to_cart/add_to_cart_cubit.dart';
import '../../Feature/favorite/presentation/view_models/delete_from_fav/delete_from_fav_cubit.dart';
import '../../Feature/favorite/presentation/view_models/get_fav/get_fav_cubit.dart';
import '../../Feature/for_password/presentation/view_models/reset_pass_cubit.dart';
import '../../Feature/home/presentation/view_models/Product/product_cubit.dart';
import '../../Feature/home/presentation/view_models/banners/banners_cubit.dart';
import '../../Feature/home/presentation/view_models/brand_and_categories/brand_cubit.dart';
import '../../Feature/home/presentation/view_models/brand_and_categories/category_cubit.dart';
import '../../Feature/home/presentation/view_models/home_cubit/home_cubit.dart';
import '../../Feature/login/presentation/view_models/signIn_cubit/signIn_cubit.dart';
import '../../Feature/profile/presentation/view_model/user_data/user_data_cubit.dart';
import '../../Feature/profile/presentation/view_model/user_edit/user_edit_cubit.dart';
import '../../Feature/register/presentation/view_models/signUP_cubit/signUP_cubit.dart';
import '../../Feature/search/presentation/view_models/topSearch/top_search_cubit.dart';
import '../../Feature/verify/presentation/view_models/activated_reset_password_cubit.dart';

List<BlocProvider> buildBlocProviders(DioConsumer dioConsumer) {
  return [
    BlocProvider<SigninCubit>(create: (_) => SigninCubit(dioConsumer)),
    BlocProvider<SignupCubit>(create: (_) => SignupCubit(dioConsumer)),
    BlocProvider<SendResetePasswordCubit>(
        create: (_) => SendResetePasswordCubit(dioConsumer)),
    BlocProvider<ActivatedResetPasswordCubit>(
        create: (_) => ActivatedResetPasswordCubit(dioConsumer)),
    BlocProvider<ResetPassCubit>(create: (_) => ResetPassCubit(dioConsumer)),
    BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(
        bannersCubit: BannersCubit(dioConsumer),
        productsCubit: ProductCubit(dioConsumer),
        brandCubit: BrandCubit(dioConsumer),
        categoryCubit: CategoryCubit(dioConsumer),
      ),
    ),
    BlocProvider<ProductCubit>(create: (_) => ProductCubit(dioConsumer)),
    BlocProvider<BannersCubit>(create: (_) => BannersCubit(dioConsumer)),
    BlocProvider<TopSearchCubit>(create: (_) => TopSearchCubit(dioConsumer)),
    BlocProvider<BrandCubit>(create: (_) => BrandCubit(dioConsumer)),
    BlocProvider<CategoryCubit>(create: (_) => CategoryCubit(dioConsumer)),
    BlocProvider<UserDataCubit>(create: (_) => UserDataCubit(dioConsumer)),
    BlocProvider<AddToCartCubit>(
      create: (context) => AddToCartCubit(dioConsumer),
    ),
    BlocProvider<DeleteFromCartCubit>(
      create: (context) => DeleteFromCartCubit(dioConsumer),
    ),
     BlocProvider<GetCartCubit>(
      create: (context) => GetCartCubit(dioConsumer),
    ),

    //
     BlocProvider<AddToFavCubit>(
      create: (context) => AddToFavCubit(dioConsumer),
    ),
    BlocProvider<DeleteFromFavCubit>(
      create: (context) => DeleteFromFavCubit(dioConsumer),
    ),
     BlocProvider<GetFavCubit>(
      create: (context) => GetFavCubit(dioConsumer),
    ),
    BlocProvider<CheckoutCubit>(
      create: (context) => CheckoutCubit(dioConsumer),
    ),
     BlocProvider<UserEditCubit>(
      create: (context) => UserEditCubit(dioConsumer),
    ),
    BlocProvider<BottomNavCubit>(
      create: (context) => BottomNavCubit(),
    ),
    BlocProvider<AddImageCubit>(
      create: (context) =>AddImageCubit(dioConsumer),
    ),
     BlocProvider<ThemeCubit>(create:(context) => ThemeCubit()),
  ];
}
