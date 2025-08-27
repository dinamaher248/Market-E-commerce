import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/all_brands_page.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/all_categories_page.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/best_for_you_page.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/buy_again_page.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/home_view.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/popular_product_page.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/product_details.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view/login_view.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view/register_view.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/Search_Not_Found_Page.dart';
import 'package:marketi_ecommers/Feature/success_order/presentation/view/Success_Order_Page.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/forget_password_with_mail.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/forget_password_with_phone.dart';
import 'package:marketi_ecommers/Feature/verify/presentation/view/verify_code_with_mail.dart';
import '../../Feature/cart/presentation/view/cart_view.dart';
import '../../Feature/checkout/presentation/view/checkout_view.dart';
import '../../Feature/favorite/presentation/view/fav_view.dart';
import '../../Feature/for_password/presentation/view/confirmation_new_pass .dart';
import '../../Feature/for_password/presentation/view/congratulation_reset_pass.dart';
import '../../Feature/profile/presentation/view/profile_edit_view.dart';
import '../../Feature/profile/presentation/view/profile_view.dart';
import '../../Feature/splash/presentation/view/on_boarding1.dart';
import '../../Feature/splash/presentation/view/on_boarding2.dart';
import '../../Feature/splash/presentation/view/on_boarding3.dart';
import '../../Feature/splash/presentation/view/splash_view.dart';
import '../../Feature/verify/presentation/view/verify_code_with_phone.dart';

class AppRouter {
  static String splashPath = '/';
  static String onBoarding1Path = '/onBoarding1Path';
  static String onBoarding2Path = '/onBoarding2Path';
  static String onBoarding3Path = '/onBoarding3Path';
  static String loginPath = '/loginPath';
  static String registerPath = '/registerPath';
  static String forgetPasswordWithPhone = '/forgetPasswordWithPhone';
  static String forgetPasswordWithMail = '/forgetPasswordWithMail';
  static String verifyCodeWithPhone = '/verifyCodeWithPhone';
  static String verifyCodeWithMail = '/verifyCodeWithMail';
  static String confirmationNewPass = '/confirmationNewPass';
  static String congratulationResetPass = '/congratulationResetPass';
  static String searchNotFoundPage = '/searchNotFoundPage';
  static String successOrderPage = '/successOrderPage';
  static String cartViewPath = '/cartViewPath';
  static String homePath = '/homePath';
  static String allBrandsPagePath = '/allBrandsPagePath';
  static String allCategoriesPagePath = '/allCategoriesPagePath';
  static String buyAgainPagePath = '/buyAgainPagePath';
  static String bestForYouPagePath = '/bestForYouPagePath';
  static String popularProductPagePath = '/popularProductPagePath';
  static String detailsProductPath = '/detailsPopularProductSectionPath';
  static String menuPath = '/menuPath';
  static String profilePath = '/profilePath';
  static String favoritesPath = '/favoritesPath';
  static String checkOutPath = '/checkOutPath';
  static String editProfilePath = '/editProfilePath';

  GoRouter get router => GoRouter(
        initialLocation: splashPath,
        routes: [
          GoRoute(
            path: splashPath,
            builder: (context, state) => const SplashView(),
          ),
          GoRoute(
            path: onBoarding1Path,
            builder: (context, state) => const OnBoarding1(),
          ),
          GoRoute(
            path: onBoarding2Path,
            builder: (context, state) => const OnBoarding2(),
          ),
          GoRoute(
            path: onBoarding3Path,
            builder: (context, state) => const OnBoarding3(),
          ),
          GoRoute(
            path: loginPath,
            builder: (context, state) => const LoginView(),
          ),
          GoRoute(
            path: registerPath,
            builder: (context, state) => const RegisterView(),
          ),
          GoRoute(
            path: forgetPasswordWithPhone,
            builder: (context, state) => const ForgetPasswordWithPhone(),
          ),
          GoRoute(
            path: forgetPasswordWithMail,
            builder: (context, state) => const ForgetPasswordWithMail(),
          ),
          GoRoute(
            path: verifyCodeWithPhone,
            builder: (context, state) => const VerifyCodeWithPhone(),
          ),
          GoRoute(
            path: verifyCodeWithMail,
            builder: (context, state) => const VerifyCodeWithMail(),
          ),
          GoRoute(
            path: confirmationNewPass,
            builder: (context, state) => const ConfirmationNewPass(),
          ),
          GoRoute(
            path: congratulationResetPass,
            builder: (context, state) => const CongratulationResetPass(),
          ),
          GoRoute(
            path: successOrderPage,
            builder: (context, state) => const SuccessOrderPage(),
          ),
          GoRoute(
            path: cartViewPath,
            builder: (context, state) => const CartView(),
          ),
          GoRoute(
            path: searchNotFoundPage,
            builder: (context, state) => const SearchNotFoundPage(),
          ),
          GoRoute(
              path: homePath, builder: (context, state) => const HomeView()),
          GoRoute(
            path: allBrandsPagePath,
            builder: (context, state) => const AllBrandsPage(),
          ),
          GoRoute(
            path: allCategoriesPagePath,
            builder: (context, state) => const AllCategoriesPage(),
          ),
          GoRoute(
            path: bestForYouPagePath,
            builder: (context, state) => const BestForYouPage(),
          ),
          GoRoute(
            path: buyAgainPagePath,
            builder: (context, state) => const BuyAgainPage(),
          ),
          GoRoute(
            path: popularProductPagePath,
            builder: (context, state) => const PopularProductPage(),
          ),
          GoRoute(
              path: detailsProductPath,
              builder: (context, state) {
                final product = state.extra;
                return ProductDetails(product: product);
              }),
          GoRoute(
            path: profilePath,
            builder: (context, state) => const ProfileView(),
          ),
          GoRoute(
            path: editProfilePath,
            builder: (context, state) => const EditProfilePage(),
          ),
          GoRoute(
              path: checkOutPath,
              builder: (context, state) {
                final checkoutData = state.extra;
                return CheckoutView(checkoutData: checkoutData);
              }),
          GoRoute(
            path: favoritesPath,
            builder: (context, state) {
              const favView = FavView();
              return favView;
            },
          ),
        ],
      );
}
