import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../home/domain/user_entity.dart';

//Youssef Ashraf
///Represents Other Message Sender Header (name,profile) in the Inquiry Chat Card
class OtherMessageHeader extends StatelessWidget {
  final UserEntity userEntity;
  const OtherMessageHeader({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: // other message
          [
        CircleAvatar(
          backgroundImage: NetworkImage(userEntity.profileImage),
          radius: context.isPhone ? 16.r : 24.r,
        ),
        horizontalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${userEntity.firstName} ${userEntity.lastName}',
                style: context.isPhone
                    ? AppTextStyles.font14BlackCairoMedium
                    : AppTextStyles.font16BlackCairoMedium,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                userEntity.jobTitle,
                style: AppTextStyles.font12SecondaryBlackCairoMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
