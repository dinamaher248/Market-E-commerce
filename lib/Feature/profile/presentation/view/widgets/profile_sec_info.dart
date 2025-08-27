
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../view_model/user_data/user_data_cubit.dart';
import '../../view_model/user_data/user_data_state.dart';

class ProfileSecInfo extends StatelessWidget {
  const ProfileSecInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserDataCubit>();

    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const CircularProgressIndicator();
        } else if (state is UserDataError) {
          return Text("There is an error${state.errMessage}");
        } else if (state is UserDataLoaded) {
          final user = state.userData;
          return Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(ImagePathes.profile),
                    ),
                    InkWell(
                      onTap: () {
                        context.go(AppRouter.editProfilePath);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit,
                            color: Colors.blue, size: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "@${user.email.replaceAll("@gmail.com", "")}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
