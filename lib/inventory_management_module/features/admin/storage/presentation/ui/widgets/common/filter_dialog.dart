import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../features/admin/storage/presentation/controller/storage_form_controller.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';

class AssignEmployeeFilterDialog extends GetView<StorageFormController> {
  const AssignEmployeeFilterDialog({super.key});

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
                    onChanged: (value) {
                      controller.updateDep(value);
                    },
                    hintText: 'Department'.tr,
                    height: 44.h,
                    value: controller.selectedDepartment?.value,
                    textButton: controller.selectedDepartment?.value?.getName,
                    items: List.generate(
                      Departments.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: Departments.values[index],
                          child: Text(
                            Departments.values[index].getName.tr,
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
                      controller.updateJobTitle(value);
                    },
                    hintText: 'Job Title'.tr,
                    height: 44.h,
                    value: controller.selectedJobTitle?.value,
                    textButton: controller.selectedJobTitle?.value,
                    items: List.generate(
                      controller.dummyjobTitles.length,
                      (index) {
                        return DropdownMenuItem(
                          value: controller.dummyjobTitles[index],
                          child: Text(
                            controller.dummyjobTitles[index],
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
