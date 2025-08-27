import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/profile_photo_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/widgets/bar_widget.dart';
import '../../../../../core/widgets/core/custom_snack_bar.dart';
import '../../../../../core/widgets/core/text_field_widget.dart';
import '../../../data/models/user_data_model.dart';
import '../../view_model/user_edit/user_edit_cubit.dart';
import '../../view_model/user_edit/user_edit_state.dart';

class ProfileEditViewBody extends StatefulWidget {
  const ProfileEditViewBody({super.key});

  @override
  State<ProfileEditViewBody> createState() => _ProfileEditViewBodyState();
}

class _ProfileEditViewBodyState extends State<ProfileEditViewBody> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _genderController;
  late TextEditingController _addressController;
  late TextEditingController _typeController;
  //late String imagePath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _genderController = TextEditingController();
    _addressController = TextEditingController();
    _typeController = TextEditingController();
    context.read<UserEditCubit>().loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserEditCubit, UserEditState>(
      listener: (context, state) {
        if (state is UserEditSuccess) {
          customSnackBar(context, state.message, Colors.green);
        } else if (state is UserEditError) {
          customSnackBar(context, state.errMessage, Colors.red);
          print(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is UserEditLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UserEditLoaded) {
          final user = state.userData;
          _nameController.text = user.name;
          _emailController.text = user.email;
          _genderController.text = user.gender;
          _addressController.text = user.address;
          _typeController.text = user.type;
         // imagePath = user.image;

          return Padding(
            padding: EdgeInsets.all(4.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  BarWidget(textBar: "Edit Profile", isIcon: true),
                  SizedBox(height: 3.h),
                  const ProfilePhotoWidget(),
                  SizedBox(height: 3.h),
                  TextFieldWidget(
                    mailPassText: 'Name',
                    icon: Icons.person,
                    controller: _nameController,
                    isEdit: true,
                  ),
                  SizedBox(height: 1.h),
                  TextFieldWidget(
                    mailPassText: 'Email',
                    icon: Icons.mail_outlined,
                    controller: _emailController,
                    isEdit: true,
                  ),
                  SizedBox(height: 1.h),
                  TextFieldWidget(
                    mailPassText: 'Gender',
                    icon: Icons.male,
                    controller: _genderController,
                    isEdit: true,
                  ),
                  SizedBox(height: 1.h),
                  TextFieldWidget(
                    mailPassText: 'Type',
                    icon: Icons.type_specimen,
                    controller: _typeController,
                    isEdit: true,
                  ),
                  SizedBox(height: 1.h),
                  TextFieldWidget(
                    mailPassText: 'Address',
                    icon: Icons.gps_fixed,
                    controller: _addressController,
                    isEdit: true,
                  ),
                  SizedBox(height: 4.h),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final userData = UserDataModel(
                          id: CacheHelper.getData(key: ApiKey.id),
                          name: _nameController.text,
                          email: _emailController.text,
                          gender: _genderController.text,
                          address: _addressController.text,
                          type: _typeController.text,
                          //image: imagePath,
                        );
                        context.read<UserEditCubit>().editUserData(userData);
                      }
                    },
                    child: const Text("Save Changes"),
                  ),
                ],
              ),
            ),
          );
        }

        return const Center(child: Text("Failed to load user data"));
      },
    );
  }
}
