import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../approval/presentation/controller/approval_controller.dart';
import '../../../../../../approval/presentation/ui/constants/approval_id_constant.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../controller/admin_approval_controller.dart';
import '../../constants/approval_id_constant.dart';

// Date: 30/11/2024
// By: Mohamed Ashraf
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons In Tablet View.

class ApprovalSearchFilter extends GetView<AdminApprovalController> {
  final VoidCallback? onButtonTap;

  const ApprovalSearchFilter({
    super.key,
    this.onButtonTap,
  });

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
                    maxLines: 1,
                    hintText: 'Search Here...'.tr,
                    collapsed: true,
                    hintStyle: context.isTablett
                        ? AppTextStyles.font16BlackMediumCairo
                        : AppTextStyles.font12BlackCairo,
                    controller: controller.searchController,
                    onChanged: (value) {},
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
                    image: AppAssets.filter,
                    text: 'Filter',
                    color: AppColors.card,
                    onTap: () {},
                  ),
                  horizontalSpace(9),
                  GetBuilder<AdminApprovalController>(
                      id: ApprovalAdminIdConstant.changeApprovalStatus,
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectGridView();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: controller.gridViewSelect
                                    ? AppColors.primary
                                    : AppColors.white),
                            child:
                                Center(child: SvgPicture.asset(AppAssets.grid)),
                          ),
                        );
                      }),
                  horizontalSpace(13),
                  GetBuilder<AdminApprovalController>(
                      id: ApprovalAdminIdConstant.changeApprovalStatus,
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            controller.selectListView();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: controller.listViewSelect
                                    ? AppColors.primary
                                    : AppColors.white),
                            child:
                                Center(child: SvgPicture.asset(AppAssets.list)),
                          ),
                        );
                      })
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
                ],
              ),
          ],
        ),
      ),
    );
  }
}
