import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';

import '../../../../../../../../core/constants/app_assets.dart';
//import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../employee/requests/entities/request_entity.dart';

//Youssef Ashraf
///Represent the Request Approval Buttons
class RequestedApprovalButtons extends StatelessWidget {
  final RequestEntity requestEntity;
  const RequestedApprovalButtons({super.key, required this.requestEntity});

  @override
  Widget build(BuildContext context) {
    final requestStatus = requestEntity.status;
    return requestStatus == RequestStatus.waiting
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reject Button
              Expanded(
                child: GestureDetector(
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
                          title: 'Rejection'.tr,
                          subTitle:
                              'Are You sure You Want to Reject this Approve ?'
                                  .tr,
                          onConfirm: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          }),
                      context: context,
                    );
                  },
                  child: Container(
                    height: context.isTablett ? 40.h : 30.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.red),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: context.isTablett ? 12.r : 8.r,
                          backgroundColor: AppColors.red,
                          child: SvgPicture.asset(
                            AppAssets.rejected,
                          ),
                        ),
                        horizontalSpace(8),
                        Flexible(
                          child: Text(
                            'Reject'.tr,
                            style: context.isTablett
                                ? AppTextStyles.font16MediumMonserrat
                                    .copyWith(color: AppColors.red)
                                : AppTextStyles.font16MediumMonserrat.copyWith(
                                    color: AppColors.red, fontSize: 14.sp),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              horizontalSpace(context.isTablett ? 8 : 26),
              // Approve Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HapticFeedbackHelper.triggerHapticFeedback(
                      vibration: VibrateType.mediumImpact,
                      hapticFeedback: HapticFeedback.mediumImpact,
                    );
                  },
                  child: Container(
                    height: context.isTablett ? 40.h : 30.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: context.isTablett ? 12.r : 8.r,
                          backgroundColor: AppColors.green,
                          child: SvgPicture.asset(
                            AppAssets.approved,
                          ),
                        ),
                        horizontalSpace(8),
                        Flexible(
                          child: Text(
                            'Approve'.tr,
                            style: context.isTablett
                                ? AppTextStyles.font16MediumMonserrat
                                    .copyWith(color: AppColors.green)
                                : AppTextStyles.font16MediumMonserrat.copyWith(
                                    color: AppColors.green, fontSize: 14.sp),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            height: context.isTablett ? 40.h : 30.h,
            decoration: BoxDecoration(
              border: Border.all(color: requestStatus.getColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: context.isTablett ? 12.r : 8.r,
                  backgroundColor: requestStatus.getColor,
                  child: FittedBox(
                    child: SvgPicture.asset(
                      requestStatus.getAsset,
                      height: 14.h,
                      width: 14.w,
                    ),
                  ),
                ),
                horizontalSpace(8),
                Flexible(
                  child: Text(
                    requestStatus.getName.tr,
                    style: context.isTablett
                        ? AppTextStyles.font16MediumMonserrat
                            .copyWith(color: requestStatus.getColor)
                        : AppTextStyles.font16MediumMonserrat.copyWith(
                            color: requestStatus.getColor, fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          );
  }
}
