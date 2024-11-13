import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../controller/approval_controller.dart';

class TabletApprovalDetailsPage extends GetView<ApprovalController> {
  final int index;
  const TabletApprovalDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isPhone ? 343.w : Get.width * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.dialog,
        borderRadius: BorderRadius.circular(8.r),
      ),
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.8,
      ),
      child: Column(
        children: [
          Text(controller.approvalList[index].brand)
        ],
      ),
    );
  }
}
