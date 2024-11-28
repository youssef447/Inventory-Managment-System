import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/theme/app_colors.dart';

class UploadImageAvatarWidget extends StatelessWidget {
  const UploadImageAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
            radius: 36, // Adjust the radius as needed
            backgroundColor: Colors.grey.shade300,
            child: SvgPicture.asset(
              AppAssets.gallery,
              width: 30,
              height: 30,
            )),
        // Positioned camera icon
        CircleAvatar(
            radius: 12,
            backgroundColor: Colors.yellow,
            child: SvgPicture.asset(AppAssets.camera,
                width: 15, height: 15, color: AppColors.black)),
      ],
    );
  }
}
