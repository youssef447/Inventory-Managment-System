import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../home/constants/inventory_categories.dart';
import '../../../controller/requests_controller.dart';

class RequestCategoryRow extends GetView<RequestsController> {
  const RequestCategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 9.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(2.r),
        ),
        child: Obx(
          () {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                InventoryCategories.categories.length - 1,
                (index) {
                  final selected =
                      index == controller.currentCategoryIndex.value;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.updateCategoryIndex(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.card,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      child: Text(
                        InventoryCategories.categories[index].tr,
                        style: context.isTablett
                            ? AppTextStyles.font16BlackMediumCairo.copyWith(
                                fontWeight: selected
                                    ? AppFontWeights.semiBold
                                    : AppFontWeights.medium,
                                color: selected
                                    ? AppColors.textButton
                                    : AppColors.inverseBase)
                            : AppTextStyles.font14BlackCairo.copyWith(
                                color: selected
                                    ? AppColors.textButton
                                    : AppColors.inverseBase,
                                fontWeight: selected
                                    ? AppFontWeights.semiBold
                                    : AppFontWeights.medium,
                              ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
