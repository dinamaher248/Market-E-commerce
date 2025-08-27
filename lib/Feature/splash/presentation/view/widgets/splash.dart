import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../../../../core/routing/app_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.go(AppRouter.onBoarding1Path);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        ImagePathes.logo,
      ),
    );
  }
}
