import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_list.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_switch_list_tile.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/profile_sec_info.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/show_rate_dialog.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/services/theme_cubit.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({
    super.key,
  });

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isNotificationOn = true;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarWidget(
          textBar: "My Profile",
          isIcon: true,
        ),
        SizedBox(
          height: 3.h,
        ),
        // Profile Section
        const ProfileSecInfo(),
        SizedBox(height: 2.h),

        Divider(
          color: Theme.of(context).brightness == Brightness.light
              ? const Color.fromARGB(179, 151, 146, 146).withOpacity(0.2)
              : Colors.white30.withOpacity(0.2),
        ),
        SizedBox(height: 1.h),

        // Options List
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              buildListTile(
                context: context,
                icon: Icons.person_outline,
                text: "Account Preferences",
                onTap: () {},
              ),
              buildListTile(
                context: context,
                icon: Icons.credit_card,
                text: "Subscription & Payment",
                onTap: () {},
              ),
              switchListTile(
                context: context,
                icon: Icons.notifications_none,
                text: "App Notifications",
                value: isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    isNotificationOn = value;
                  });
                },
              ),
              switchListTile(
                context: context,

                icon: Icons.dark_mode_outlined,
                text: "Dark Mode",
                value: context.watch<ThemeCubit>().state ==
                    ThemeMode.dark, //isDarkMode,
                onChanged: (value) {
                  setState(() {
                    context.read<ThemeCubit>().toggleTheme();
                  });
                },
              ),
              buildListTile(
                context: context,
                icon: Icons.star_border,
                text: "Rate Us",
                onTap: () {
                  showRateUsDialog(context);
                },
              ),
              buildListTile(
                context: context,
                icon: Icons.feedback_outlined,
                text: "Provide Feedback",
                onTap: () {},
              ),
              buildListTile(
                context: context,
                icon: Icons.logout,
                text: "Log Out",
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                 // await prefs.clear();
                  await prefs.remove("token");
                  context.go(AppRouter.splashPath);
                },
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
    );
  }
}
