

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../controller/add_approval_cycle_controller.dart';

class MobileAddApprovalCycle extends GetView<AddApprovalCycleController>  {
  const MobileAddApprovalCycle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.buildings),
            horizontalSpace(8),
            Text('${'Approval Cycle'.tr}:',
                style: AppTextStyles.font14BlackCairoMedium),
          ],
        ),
        verticalSpace(16),
        Obx((){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              controller.selectedApprovalCycle.length,
                  (index) => Padding(
                padding: index !=    controller.selectedApprovalCycle.length - 1
                    ? EdgeInsets.only(bottom: 17.h)
                    : EdgeInsets.zero,
                child: _BuildAvatarArrow(
                  '${   controller.selectedApprovalCycle[index].firstName} ${   controller.selectedApprovalCycle[index].lastName}',
                  controller.selectedApprovalCycle[index].position,
                  controller.selectedApprovalCycle[index].profileImage,
                  index,
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}

class _BuildAvatarArrow extends StatelessWidget {
  final String name;
  final String postion;
  final String profileImage;
  final int index;
  const _BuildAvatarArrow(
      this.name, this.postion, this.profileImage, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index != 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.line,
                color: AppColors.black
              ),
              SvgPicture.asset(
            AppAssets.blackArrow
              ),
            ],
          ),
        CircleAvatar(
          radius: 16.r,
          backgroundImage: NetworkImage(profileImage),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.font14BlackCairoMedium,
            ),
            Text(
              postion,
              style: AppTextStyles.font12SecondaryBlackCairoMedium,
            ),
          ],
        ),
      ],
    );
  }
}
