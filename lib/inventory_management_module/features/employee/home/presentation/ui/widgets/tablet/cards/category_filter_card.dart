
//Youssef Ashraf
// Date: 7/11/2024
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';

///Represents the category filter card as part of category filter row in home page
class TabletCategoryFilterCard extends StatelessWidget {
  final String name;
  final bool selected;
  final int count;
  const TabletCategoryFilterCard({
    super.key,
    required this.name,
    required this.selected,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablett;
    return Row(children: [
      Container(
        height: isTablet ? 48.h : 32.h,
        width: isTablet ? 48.h : 32.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.card,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Text(
          DateTimeHelper.formatInt(count),
          style: isTablet
              ? AppTextStyles.font20SecondaryBlackSemiBoldCairo.copyWith(
                  fontWeight: selected
                      ? AppFontWeights.semiBold
                      : AppFontWeights.medium,
                  color:
                      selected ? AppColors.textButton : AppColors.inverseBase)
              : AppTextStyles.font14BlackCairo.copyWith(
                  color:
                      selected ? AppColors.textButton : AppColors.inverseBase,
                  fontWeight: selected
                      ? AppFontWeights.semiBold
                      : AppFontWeights.medium,
                ),
        ),
      ),
      horizontalSpace(isTablet ? 16.w : 4.w),
      Text(
        name.tr,
        overflow: TextOverflow.ellipsis,
        style: isTablet
            ? AppTextStyles.font20SecondaryBlackSemiBoldCairo.copyWith(
                fontWeight:
                    selected ? AppFontWeights.extraBold : AppFontWeights.medium,
                color: AppColors.text,
              )
            : AppTextStyles.font14BlackCairo.copyWith(
                color: AppColors.text,
                fontWeight:
                    selected ? AppFontWeights.extraBold : AppFontWeights.medium,
              ),
      ),
    ]);
  }
}
