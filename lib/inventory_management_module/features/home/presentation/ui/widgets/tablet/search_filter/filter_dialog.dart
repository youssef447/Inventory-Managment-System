// by : Mohamed Ashraf
// date : 20/11/2024
// filter for home asset

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/requests_enums.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../controller/filter_controller.dart';

class FilterDialog extends GetView<FilterController> {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  Get.width * 0.6,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.dialog,
        borderRadius: BorderRadius.circular(8.r),
      ),
      constraints: BoxConstraints(
        maxHeight: Get.height * 0.35,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 16,
                child:  SvgPicture.asset(
                  AppAssets.filter,
                  width: 16,
                  height: 16,
                  color: Colors.black,
                )
              ),
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
                    onChanged: (value) {
                      controller.updateRequestStatues(value);
                    },
                    hintText: 'Request Type'.tr,
                    height: 44.h,
                    value: controller.requestTypeValue.value,
                    textButton: controller.requestTypeValue.value?.getName,
                    items: List.generate(
                      controller.requestActions.length,
                          (index) {
                        return DropdownMenuItem(
                          value: controller.requestActions[index],
                          child: Text(
                            controller.requestActions[index].getName.tr,
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
                    onChanged: (value) {
                      controller.updateStatus(value);
                    },
                    hintText: 'Status'.tr,
                    height: 44.h,
                    value: controller.requestStatusValue.value,
                    textButton: controller.requestStatusValue.value?.getName,
                    items: List.generate(
                      controller.requestStatus.length,
                          (index) {
                        return DropdownMenuItem(
                          value: controller.requestStatus[index],
                          child: Text(
                            controller.requestStatus[index].getName.tr,
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
          verticalSpace(12),
          Expanded(
            child: LabeledFormField(
              controller: controller.requestedDateController,
              readOnly: false,
              date: true,
              label: 'Expected Delivery'.tr,
              hintText: 'Expected Delivery'.tr,
            ),
          ),
          Row(
              children: [
                Expanded(child: AppDefaultButton(text: 'Reset'.tr,color: AppColors.grey,)),
                horizontalSpace(16),
                Expanded(child: AppDefaultButton(text: 'Apply'.tr))
              ],
          )
        ],
      )
    );
  }
}
