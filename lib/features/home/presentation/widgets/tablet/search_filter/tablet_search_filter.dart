import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../common/horizontal/rectangled_filter_card.dart';
import '../../common/vertical/squared_filter_card.dart';
import '../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../controller/home_controller.dart';
// Date: 5/8/2024
// By: Youssef Ashraf
// Last update: 6/8/2024
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons In Tablet View.

class TabletSearchFilter extends GetView<HomeController> {
  final VoidCallback? onButtonTap;

  const TabletSearchFilter({
    super.key,
    this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isRequest = controller.currentCategoryIndex.value == 2;

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
                      hintStyle: context.isTablett
                          ? AppTextStyles.font16BlackMediumCairo
                          : AppTextStyles.font12BlackCairo,
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
                        width: context.isTablett ? 24.w : 16.0.w,
                        height: context.isTablett ? 24.h : 16.0.h,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(9),
              if (context.isLandscapee)
                Row(
                  children: [
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.filter,
                      text: 'Filter',
                      color: AppColors.card,
                      onTap: () {},
                    ),
                    horizontalSpace(9),
                    if (isRequest)
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 9.w),
                        child: AppDropdown(
                          showDropdownIcon: false,
                          image: AppAssets.add,
                          textAlign: TextAlign.center,
                          width: 112.w,
                          style: context.isPhone
                              ? AppTextStyles.font16BlackMediumCairo
                                  .copyWith(color: AppColors.textButton)
                              : AppTextStyles.font18BlackMediumCairo
                                  .copyWith(color: AppColors.textButton),
                          color: AppColors.primary,
                          height: 37.h,
                          onChanged: (value) {
                            Get.toNamed(
                              Routes.requestAsset,
                              arguments: {'action': value},
                            );
                          },
                          items: List.generate(
                            controller.requestActions.length,
                            (index) {
                              return DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: controller.requestActions[index],
                                child: Text(
                                  controller.requestActions[index].getName,
                                  style: AppTextStyles
                                      .font14SecondaryBlackCairoMedium,
                                ),
                              );
                            },
                          ),
                          textButton: 'Request'.tr,
                        ),
                      ),
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.download,
                      text: 'Download',
                      color: AppColors.primary,
                      onTap: () {},
                    ),
                  ],
                ),
              if (!context.isLandscapee)
                Row(
                  children: [
                    SquaredChipCard(
                      icon: AppAssets.filter,
                      color: AppColors.card,
                      onTap: () {},
                    ),
                    horizontalSpace(9),
                    if (isRequest)
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 9.w),
                        child: AppDropdown(
                          showDropdownIcon: false,
                          image: AppAssets.add,
                          textAlign: TextAlign.center,
                          width: 112.w,
                          style: context.isPhone
                              ? AppTextStyles.font16BlackMediumCairo
                                  .copyWith(color: AppColors.textButton)
                              : AppTextStyles.font18BlackMediumCairo
                                  .copyWith(color: AppColors.textButton),
                          color: AppColors.primary,
                          height: 37.h,
                          onChanged: (value) {
                            if (value == RequestActions.requestAsset) {
                              Get.toNamed(
                                Routes.requestAsset,
                              );
                            }
                          },
                          items: List.generate(
                            controller.requestActions.length,
                            (index) {
                              return DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: controller.requestActions[index],
                                child: Text(
                                  controller.requestActions[index].getName,
                                  style: AppTextStyles
                                      .font14SecondaryBlackCairoMedium,
                                ),
                              );
                            },
                          ),
                          textButton: 'Request'.tr,
                        ),
                      ),
                    SquaredChipCard(
                      icon: AppAssets.download,
                      color: AppColors.primary,
                      onTap: () {},
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
    });
  }
}
