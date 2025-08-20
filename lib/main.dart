import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/core/Api/dio_consumer.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'core/cache/cache_helper.dart';
import 'core/routing/app_router.dart';
import 'core/services/bloc_provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  final dioConsumer = DioConsumer(dio: Dio());
 bool isDark = CacheHelper.getBoolean(key: "isDarkMode") ?? false;
  final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(isDark ? ThemeMode.dark : ThemeMode.light);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentTheme, child) {
          return MultiBlocProvider(
            providers: buildBlocProviders(dioConsumer),
            child: MarketEcommers(themeNotifier: themeNotifier),
          );
        },
      ),
    ),
  );
}
class MarketEcommers extends StatelessWidget {
  const MarketEcommers({super.key, required this.themeNotifier});
  final ValueNotifier<ThemeMode> themeNotifier;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(themeNotifier: themeNotifier); // instance هنا

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.router, // استخدمنا الـ getter
          theme: ThemeData.light(),
          darkTheme:  darkTheme,
          themeMode: themeNotifier.value,
        );
      },
    );
  }
}

