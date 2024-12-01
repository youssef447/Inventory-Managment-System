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

class VerticalSummaryHeader extends GetView<DashboardController> {
  const VerticalSummaryHeader({super.key});

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
                        value: controller.selectedProductType,
                        color: Get.isDarkMode
                            ? AppColors.background
                            : AppColors.field,
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
                                ProductType.values[index].getName.tr.tr,
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
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SvgPicture.asset(
                        OverallInventory.values[0].getIcon,
                      ),
                      horizontalSpace(4),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              OverallInventory.values[0].getName.tr,
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
                      ),
                    ]),
                    verticalSpace(30),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          OverallInventory.values[1].getIcon,
                        ),
                        horizontalSpace(4),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                OverallInventory.values[1].getName.tr,
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
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      SvgPicture.asset(
                        OverallInventory.values[2].getIcon,
                      ),
                      horizontalSpace(8),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              OverallInventory.values[2].getName.tr,
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
                      ),
                    ]),
                    verticalSpace(30),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          OverallInventory.values[3].getIcon,
                        ),
                        horizontalSpace(8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                OverallInventory.values[3].getName.tr,
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
                  ],
                ),
              ),
            ]),
            verticalSpace(30),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  OverallInventory.values[4].getIcon,
                ),
                horizontalSpace(8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        OverallInventory.values[4].getName.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font16BlackSemiBoldCairo.copyWith(
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
          ],
        ),
      ),
    );
  }
}
