import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';

import '../../../../../../../../core/enums/overall_inventory.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../products/enums/product_enums.dart';
import '../../../../../constants/dashboard_ids.dart';
import '../../../../controller/dashboard_controller.dart';

class HorizontalSummaryHeader extends GetView<DashboardController> {
  const HorizontalSummaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.card,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Overall Inventory'.tr,
                  style: AppTextStyles.font20BlackCairoMedium,
                ),
                const Spacer(),
                GetBuilder<DashboardController>(
                    id: DashboardIds.dashboardHeaderFilter,
                    builder: (controller) {
                      return AppDropdown(
                        showDropdownIcon: true,
                        textButton: controller.selectedProductType?.getName,
                        style: AppTextStyles.font14BlackRegularCairo,
                        height: 40.h,
                        color: Get.isDarkMode
                            ? AppColors.background
                            : AppColors.field,
                        value: controller.selectedProductType,
                        onChanged: (value) {
                          controller.updateProductType(value);
                        },
                        items: List.generate(
                          ProductType.values.length,
                          (index) {
                            return DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: ProductType.values[index],
                              child: Text(
                                ProductType.values[index].getName.tr,
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                        hintText: 'Product Type'.tr,
                      );
                    }),
              ],
            ),
            verticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                OverallInventory.values.length,
                (index) {
                  return Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          OverallInventory.values[index].getIcon,
                          width: 50.w,
                          height: 50.h,
                        ),
                        horizontalSpace(4),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                OverallInventory.values[index].getName.tr,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.font16BlackSemiBoldCairo
                                    .copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                '20',
                                style: AppTextStyles.font16BlackSemiBoldCairo,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
