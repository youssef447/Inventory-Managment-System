import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../home/presentation/ui/widgets/common/horizontal/rectangled_filter_card.dart';
import '../../../../../../home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../controller/track_requests_controller.dart';

class TrackRequestSearchFilter extends GetView<TrackRequestController> {
  const TrackRequestSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
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
                    hintText:
                        'Search By Name, Category, Subcategory, Brand, Or Model'
                            .tr,
                    collapsed: true,
                    hintStyle: context.isTablett
                        ? AppTextStyles.font16SecondaryBlackCairo
                        : AppTextStyles.font12SecondaryBlackCairoRegular
                            .copyWith(fontSize: 10.sp),
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
            context.isPhone
                ? SquaredChipCard(
                    icon: AppAssets.filter,
                    color: AppColors.card,
                    onTap: () {},
                  )
                : RectangledFilterCard(
                    image: AppAssets.filter,
                    text: 'Filter',
                    textColor: AppColors.text,
                    color: AppColors.card,
                    onTap: () {},
                  )
          ],
        ),
      ),
    );
  }
}
