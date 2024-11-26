
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../controller/add_approval_cycle_controller.dart';

class AddApprovalCycle extends GetView<AddApprovalCycleController> {
  const AddApprovalCycle({
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
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 15.h,
            children: List.generate(
              controller.selectedApprovalCycle.length,
                  (index) => _BuildAvatarArrow(
                '${ controller.selectedApprovalCycle[index].firstName} ${ controller.selectedApprovalCycle[index].lastName}',
                controller.selectedApprovalCycle[index].position,
                controller.selectedApprovalCycle[index].profileImage,
                index,
              ),
            ),
          );

        }),
      ],
    );
  }
}

class _BuildAvatarArrow extends GetView<AddApprovalCycleController>  {
  final String name;
  final String postion;
  final String profileImage;
  final int index;
  const _BuildAvatarArrow(
      this.name, this.postion, this.profileImage, this.index);

  @override
  Widget build(BuildContext context) {
    final isLast = index == controller.selectedApprovalCycle.length - 1;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: AppColors.green,
              child: CircleAvatar(
                radius: 16.r,
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
            GestureDetector(
              onTap: (){
                controller.toggleSelection(index);
              },
                child: CircleAvatar(radius: 8,backgroundColor: AppColors.red, child: Icon(Icons.remove,color: Colors.white,size: 12,),))
          ],
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
              postion.tr,
              style: AppTextStyles.font12SecondaryBlackCairoMedium,
            ),
          ],
        ),
        if (!isLast)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppAssets.greenArrow,
            ),
          ),
      ],
    );
  }
}
