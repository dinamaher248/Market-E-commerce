import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../../core/utils/image_pathes.dart';
import '../../view_model/add_image/add_image_cubit.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({
    super.key,
  });

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  
    late String imagePath;

  @override
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        print("_image $_image");
        imagePath = pickedFile.path;
      });
      await context.read<AddImageCubit>().uploadImage(_image!);
    }
  }

  // File? pickedImage;

  // Future<void> pickAndUpload() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     pickedImage = File(pickedFile.path);
  //     await context.read<AddImageCubit>().uploadImage(pickedImage!);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage(ImagePathes.profile),
        ),
        // BlocBuilder<AddImageCubit, AddImageState>(
        //   builder: (context, imgState) {
        //     String currentImagePath = imagePath;

        //     if (imgState is AddImageLoaded) {
        //       currentImagePath = imgState.userData.image;
        //     }

        //     return CircleAvatar(
        //       radius: 55,
        //       backgroundImage: _image != null
        //           ? FileImage(_image!)
        //           : CachedNetworkImageProvider(
        //               "${Endpoints.baseUrl}/$currentImagePath",
        //               headers: {
        //                 "Authorization":
        //                     "Bearer ${CacheHelper.getData(key: ApiKey.token)}",
        //               },
        //             ) as ImageProvider,
        //     );
        //   },
        // ),
        InkWell(
          onTap: _pickImage,
          // () async {
          //   await pickAndUpload();
          // },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, color: Colors.blue, size: 20),
          ),
        )
      ],
    );
  }
}
