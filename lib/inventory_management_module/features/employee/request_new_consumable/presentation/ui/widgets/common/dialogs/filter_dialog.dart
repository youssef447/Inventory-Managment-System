import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/enums/requires_approval.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/widgets/buttons/app_default_button.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../controller/request_consumable_controller.dart';

//Youssef Ashraf
///Represents the consumable requests filter dialog in tablet and mobile views
class ConsumableFilterDialog extends GetView<RequestConsumableController> {
  const ConsumableFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isTablett ? 411.w : 343.w,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.dialog,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 16,
                  child: SvgPicture.asset(
                    AppAssets.filter,
                    width: 16,
                    height: 16,
                    color: Colors.black,
                  )),
              horizontalSpace(8),
              Text(
                'Filter'.tr,
                style: AppTextStyles.font24MediumBlackCairo,
              ),
            ],
          ),
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => AppDropdown(
                    showDropdownIcon: true,
                    width: 100.w,
                    onChanged: (value) {
                      controller.updateReqStatus(value);
                    },
                    hintText: 'Status'.tr,
                    height: 44.h,
                    value: controller.selectedReqStatus?.value,
                    textButton: controller.selectedReqStatus?.value?.getName,
                    items: List.generate(
                      RequestStatus.values.length - 2,
                      (index) {
                        return DropdownMenuItem(
                          value: RequestStatus.values[index],
                          child: Text(
                            RequestStatus.values[index].getName,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: Obx(
                  () => AppDropdown(
                    showDropdownIcon: true,
                    width: 100.w,
                    onChanged: (value) {
                      controller.updateRequiresApproval(value);
                    },
                    hintText: 'Requires Approval'.tr,
                    height: 44.h,
                    value: controller.selectedRequiresApproval?.value,
                    textButton:
                        controller.selectedRequiresApproval?.value?.getName,
                    items: List.generate(
                      RequiresApproval.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: RequiresApproval.values[index],
                          child: Text(
                            RequiresApproval.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(15),
          Obx(
            () => Row(
              children: [
                Expanded(
                    child: AppDefaultButton(
                  text: 'Reset'.tr,
                  color: AppColors.grey,
                  onPressed: () {
                    controller.resetFilter();
                  },
                )),
                horizontalSpace(16),
                Expanded(
                  child: AppDefaultButton(
                    text: 'Apply'.tr,
                    textColor: controller.applyEnabled.value
                        ? AppColors.secondaryBlack
                        : AppColors.textButton,
                    color: controller.applyEnabled.value
                        ? AppColors.primary
                        : AppColors.grey,
                    onPressed: () {
                      if (controller.applyEnabled.value == false) return;
                      Navigator.of(context, rootNavigator: true).pop();
                      controller.applyFilter();
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
