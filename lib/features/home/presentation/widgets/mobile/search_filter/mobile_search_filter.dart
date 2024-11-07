/* // Date: 5/8/2024
// By: Youssef Ashraf
// Last update: 6/8/2024
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tracking_module/core/configs/extensions/extensions.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/fields/default_form_field.dart';
import '../../../../../../approvals/presentation/controller/approvals_controller.dart';
import '../../../../../../attendance/presentation/controller/controller/attendance_controller.dart';
import '../../../../../../location/presentation/controller/controller/location_controller.dart';
import '../../../../../../request/presentation/controller/requests_controller.dart';
import '../../../../../../request_type/presentation/controller/request_types_controller.dart';
import '../../../../controller/controller/home_controller.dart';

import '../../dialogs/filter/attendance_filter_dialog.dart';
import '../../dialogs/filter/req_filter.dart';
import '../cards/chip_card.dart';

class MobileSearchFilter extends GetView<HomeController> {
  final VoidCallback? onButtonTap;
  final int index;
  final bool readOnly;

  const MobileSearchFilter({
    super.key,
    this.onButtonTap,
    required this.index,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
      ),
      child: SlideAnimation(
        leftToRight: context.isArabic ? false : true,
        child: index != 3
            ? Column(
                children: [
                  SearchField(controller: controller, index: index),

                  if (!readOnly)
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 12.h),
                      child: GestureDetector(
                        onTap: onButtonTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 9.h,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.primary,
                          ),
                          child: Text(
                            index == 1
                                ? 'Add Transaction'.tr
                                : index == 2
                                    ? 'Send Request'.tr
                                    : index == 4
                                        ? 'Add Request Type'.tr
                                        : 'Add Location'.tr,
                            style: AppTextStyles.font16ButtonMediumCairo,
                          ),
                        ),
                      ),
                    ),
                  // verticalSpace(16),
                ],
              )
            : SearchField(controller: controller, index: index),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.controller,
    required this.index,
  });

  final HomeController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    final isAttendnace = index == 1;

    final isReqType = index == 4;
    final isLocation = index == 5;
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: SizedBox(
              height: 40.h,
              child: AppTextFormField(
                maxLines: 1,
                hintText: 'Search Here...'.tr,
                collapsed: true,
                backGroundColor: AppTheme.isDark ?? false
                    ? AppColors.field
                    : AppColors.white,
                hintStyle: context.isTablett
                    ? AppTextStyles.font16BlackMediumCairo
                    : AppTextStyles.font12BlackCairo,
                controller: controller.searchController,
                onChanged: (value) {
                  if (index == 1) {
                    Get.find<AttendanceController>().searchAttendance(value);
                  } else if (index == 2) {
                    Get.find<RequestsController>().searchRequest(value);
                  } else if (index == 3) {
                    Get.find<ApprovalsController>()
                        .searchApprovalRequest(value);
                  } else if (index == 4) {
                    print('value $value');
                    Get.find<RequestTypeController>().searchRequestType(value);
                  } else if (index == 5) {
                    Get.find<LocationController>().searchLocation(value);
                  }
                },
                contentPadding: context.isTablett
                    ? EdgeInsets.symmetric(
                        vertical: 2.h,
                      )
                    : null,
                textAlign: TextAlign.start,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r)),
                prefixIcon: SvgPicture.asset(
                  AppAssets.search,
                  width: context.isTablett ? 24.w : 16.0.w,
                  height: context.isTablett ? 24.h : 16.0.h,
                ),
              ),
            ),
          ),
        ),
        if (!isReqType && !isLocation)
          Row(
            children: [
              horizontalSpace(8),
              ChipCard(
                image: AppAssets.sort,
                onTap: () {
                  HapticFeedbackHelper.triggerHapticFeedback(
                    vibration: VibrateType.mediumImpact,
                    hapticFeedback: HapticFeedback.mediumImpact,
                  );
                  GetDialogHelper.generalDialog(
                    child: isAttendnace
                        ? const AttendanceFilterDialog()
                        : const ReqFilterDialog(),
                    context: context,
                  );
                },
              ),
            ],
          ),
        horizontalSpace(8),
        ChipCard(
          image: AppAssets.export,
          onTap: () {
            HapticFeedbackHelper.triggerHapticFeedback(
              vibration: VibrateType.mediumImpact,
              hapticFeedback: HapticFeedback.mediumImpact,
            );
            controller.exportTable();
          },
        ),
      ],
    );
  }
}
 */