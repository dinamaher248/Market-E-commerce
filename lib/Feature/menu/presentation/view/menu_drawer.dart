import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:sizer/sizer.dart';
import 'widgets/build_drawer_item.dart';

class NavigationMenuDrawerWidget extends StatelessWidget {
  const NavigationMenuDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go(AppRouter.profilePath);
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage(ImagePathes.profile),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Dina",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            const Divider(
              height: 2,
              color: Color.fromARGB(179, 169, 168, 168),
            ),
            SizedBox(height: 2.h),

            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  drawerItem(Icons.refresh, "Buy Again", context),
                  drawerItem(Icons.shopping_bag_outlined, "My Orders", context),
                  drawerItem(Icons.credit_card, "Payments", context),
                  drawerItem(Icons.settings, "Account Settings", context),
                  drawerItem(Icons.support_agent, "Support", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
