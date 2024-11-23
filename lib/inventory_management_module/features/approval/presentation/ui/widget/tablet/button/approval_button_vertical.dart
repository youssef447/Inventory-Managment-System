//by : mohamed Ashraf
//date : 11/11/2024
// this widget response to show two button in vertical uses in tablet view

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../controller/approval_controller.dart';
import '../../../constants/approval_button.dart';

class ApprovalButtonVertical extends GetView<ApprovalController> {
  const ApprovalButtonVertical({super.key, required this.approvalId});
  final String approvalId;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Reject Button
        GestureDetector(
          onTap: () {
            HapticFeedbackHelper.triggerHapticFeedback(
              vibration: VibrateType.mediumImpact,
              hapticFeedback: HapticFeedback.mediumImpact,
            );
            GetDialogHelper.generalDialog(
              child: DefaultDialog(
                width: context.isPhone ? 343.w : 411.w,
                showButtons: true,
                icon: AppAssets.canceled,
                title: 'Reject Approve'.tr,
                subTitle: 'Are You sure You Want to Reject this Approve ?'.tr,
                onConfirm: () {
                  controller.changeApprovalStatusById(
                      approvalId, 'Rejected', context);
                },
              ),
              context: context,
            );
          },
          child: Container(
            height: 40.h,
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(ApprovalButton.reject.tr,
                    style: AppTextStyles.font16InputColorCairo
                        .copyWith(color: AppColors.red)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Approve Button
        GestureDetector(
          onTap: () {
            HapticFeedbackHelper.triggerHapticFeedback(
              vibration: VibrateType.mediumImpact,
              hapticFeedback: HapticFeedback.mediumImpact,
            );
            controller.changeApprovalStatusById(
                approvalId, 'Approved', context);
          },
          child: Container(
            height: 40.h,
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(ApprovalButton.approve.tr,
                    style: AppTextStyles.font16InputColorCairo
                        .copyWith(color: AppColors.green)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
