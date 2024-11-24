

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../home/presentation/ui/widgets/common/horizontal/rectangled_filter_card.dart';
import '../../../../../../requests/presentation/controller/requests_controller.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../controller/admin_controller.dart';

// Date: 5/8/2024
// By: Youssef Ashraf
// Last update: 6/8/2024
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons In Tablet View.

class TabletAdminSearchFilter extends GetView<AdminController> {
  final VoidCallback? onButtonTap;

  const TabletAdminSearchFilter({
    super.key,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: context.isArabic ? false : true,
      child: Obx(() {
        final isRequest = controller.currentCategoryIndex.value == 2;
        final requestController = Get.find<RequestsController>();

        return Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 12.h,
          ),
          child: SlideAnimation(
            leftToRight: context.isArabic ? false : true,
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: SizedBox(
                      height: 37.h,
                      child: AppTextFormField(
                        backGroundColor: AppTheme.isDark ?? false
                            ? AppColors.field
                            : AppColors.white,
                        maxLines: 1,
                        hintText: 'Search Here...'.tr,
                        collapsed: true,
                        hintStyle:
                        AppTextStyles.font16SecondaryBlackCairoMedium,
                        controller: controller.searchController,
                        onChanged: (value) {
                          /*   if (index == 1) {
                            Get.find<AttendanceController>()
                                .searchAttendance(value);
                          } else if (index == 2) {
                            Get.find<RequestsController>().searchRequest(value);
                          } else if (index == 3) {
                            Get.find<ApprovalsController>()
                                .searchApprovalRequest(value);
                          } else if (index == 4) {
                            print('value $value');
                            Get.find<RequestTypeController>()
                                .searchRequestType(value);
                          } else if (index == 5) {
                            Get.find<LocationController>()
                                .searchLocation(value);
                          } */
                        },
                        contentPadding: context.isTablett
                            ? EdgeInsets.symmetric(
                          vertical: 2.h,
                        )
                            : null,
                        prefixIcon: SvgPicture.asset(
                          AppAssets.search,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),
                  ),
                ),
                horizontalSpace(9),
                Row(
                  children: [
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.filter,
                      text: 'Filter',
                      textColor: AppColors.text,
                      color: AppColors.card,
                      onTap: () {
                        // Open filter dialog
                      },
                    ),
                    horizontalSpace(9),
                    if (controller.currentCategoryIndex == 0)
                      RectangledFilterCard(
                        width: 112.w,
                        image: AppAssets.add,
                        text: 'Product'.tr,
                        color: AppColors.primary,
                        onTap: () {
                          // Add product action
                        },
                      )
                    else if (controller.currentCategoryIndex == 1)
                      RectangledFilterCard(
                        width: 112.w,
                        image: AppAssets.add,
                        text: 'Assets'.tr,
                        color: AppColors.primary,
                        onTap: () {
                          // Add service action
                        },
                      )
                    else if (controller.currentCategoryIndex == 2)
                        RectangledFilterCard(
                          width: 112.w,
                          image: AppAssets.add,
                          text: 'Consumables'.tr,
                          color: AppColors.primary,
                          onTap: () {
                            // Add category action
                          },
                        )
                      else if (controller.currentCategoryIndex == 3)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'order'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              // Add category action
                            },
                          )
                        else if (controller.currentCategoryIndex == 4)
                            RectangledFilterCard(
                              width: 112.w,
                              image: AppAssets.add,
                              text: 'Suppliers'.tr,
                              color: AppColors.primary,
                              onTap: () {
                                // Add category action
                              },
                            )
                      else
                        RectangledFilterCard(
                          width: 112.w,
                          image:AppAssets.add,
                          text: 'Storage Location'.tr,
                          color: AppColors.primary,
                          onTap: () {
                            // Default action
                          },
                        ),
                    horizontalSpace(9),
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.download,
                      text: 'Download'.tr,
                      color: AppColors.primary,
                      onTap: () {
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
