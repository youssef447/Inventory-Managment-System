import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../controller/track_requests_controller.dart';

class ReasonOfRejectionDialog extends GetView<TrackRequestController> {
  final String requestId;

  const ReasonOfRejectionDialog({
    super.key,
    required this.requestId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.dialog,
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.isTablett ? 20.h : 16.h,
        horizontal: context.isTablett ? 20.w : 16.w,
      ),
      width: context.isTablett ? 651.w : 343.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 15.r,
                child: SvgPicture.asset(
                  AppAssets.canceled,
                  color: AppColors.icon,
                  width: 13.w,
                  height: 13.h,
                ),
              ),
              horizontalSpace(6),
              Text(
                'Reason Of Canceling'.tr,
                style: AppTextStyles.font16BlackCairoMedium,
              ),
            ],
          ),
          verticalSpace(context.isTablett ? 30 : 20),
          Text(
            'Justifications (Optional)'.tr,
            style: AppTextStyles.font14SecondaryBlackCairoMedium,
          ),
          verticalSpace(8),
          SizedBox(
            height: 96.h,
            child: AppTextFormField(
              expands: true,
              width: double.infinity,
              controller: controller.reasonOfRejectionController,
              contentPadding: EdgeInsets.all(8.r),
              maxLength: 200,
            ),
          ),
          verticalSpace(context.isTablett ? 30 : 25),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppDefaultButton(
              width: context.isTablett ? 92.w : 150.w,
              height: 42.h,
              radius: 6.r,
              text: 'Submit'.tr,
              color: AppColors.primary,
              style: AppTextStyles.font16ButtonMediumCairo,
              onPressed: () {
                controller.reasonOfRejectionController.clear();
                controller.cancelRequest(requestId, context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
