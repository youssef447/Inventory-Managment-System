import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/enums/category_subactegory.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/widgets/buttons/app_default_button.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../controller/track_requests_controller.dart';

class TrackFilterDialog extends GetView<TrackRequestController> {
  const TrackFilterDialog({super.key});

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
                      controller.updateCategory(value);
                    },
                    hintText: 'Category'.tr,
                    height: 44.h,
                    value: controller.selectedCategory?.value,
                    textButton: controller.selectedCategory?.value?.getName,
                    items: List.generate(
                      Category.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: Category.values[index],
                          child: Text(
                            Category.values[index].getName,
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
                      controller.updateSubCategory(value);
                    },
                    hintText: 'Subcategory'.tr,
                    height: 44.h,
                    value: controller.selectedSubcategory?.value,
                    textButton: controller.selectedSubcategory?.value?.getName,
                    items: List.generate(
                      SubCategory.values.length,
                      (index) {
                        return DropdownMenuItem(
                          value: SubCategory.values[index],
                          child: Text(
                            SubCategory.values[index].getName.tr,
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
          verticalSpace(24),
          Row(
            children: [
              Expanded(
                child: LabeledFormField(
                  date: true,
                  label: 'Start Date',
                  controller: controller.startDateController,
                  onDateChanged: (value) => controller.updateStartDate(value),
                ),
              ),
              horizontalSpace(15),
              Expanded(
                child: LabeledFormField(
                  date: true,
                  label: 'End Date',
                  controller: controller.endDateController,
                  onDateChanged: (value) => controller.updateStartDate(value),
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
