import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../features/admin/storage/presentation/controller/storage_form_controller.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../constants/storage_ids.dart';
import 'filter_dialog.dart';

//Youssef Ashraf
///Objectives: This file is responsible for providing Employee Assignment sectionin Storage Form Page (Mobile-Tablet).
class AssignEmployeeSection extends GetView<StorageFormController> {
  const AssignEmployeeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StorageFormController>(
        id: StorageIds.storageForm,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assign Employee',
                style: AppTextStyles.font16BlackCairoMedium,
              ),
              verticalSpace(context.isTablett ? 30.h : 20.h),
              Row(
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
                          onChanged: (value) {},
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
                  if (context.isLandscapee)
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.filter,
                      text: 'Filter',
                      textColor: AppColors.text,
                      color: AppColors.card,
                      onTap: () {
                        GetDialogHelper.generalDialog(
                          child: const AssignEmployeeFilterDialog(),
                          context: context,
                        );
                      },
                    ),
                  if (!context.isLandscapee)
                    SquaredChipCard(
                      icon: AppAssets.filter,
                      color: AppColors.card,
                      onTap: () {
                        GetDialogHelper.generalDialog(
                          child: const AssignEmployeeFilterDialog(),
                          context: context,
                        );
                      },
                    ),
                ],
              ),
              verticalSpace(16),
              StaggeredGrid.count(
                crossAxisCount: context.isTablett
                    ? Get.width > 1200
                        ? 3
                        : 2
                    : 1,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: context.isLandscapee ? 20.w : 16.w,
                children: List.generate(
                  controller.dummyUsers.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        if (!controller.isEditable) return;
                        controller.selectUser(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundImage: NetworkImage(
                                  controller.dummyUsers[index].profileImage),
                            ),
                            horizontalSpace(4),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.dummyUsers[index].firstName} ${controller.dummyUsers[index].lastName}',
                                      style:
                                          AppTextStyles.font14BlackCairoMedium,
                                    ),
                                    Text(
                                      controller
                                          .dummyUsers[index].department.getName,
                                      style: AppTextStyles
                                          .font14SecondaryBlackCairoRegular,
                                    ),
                                    Text(
                                      controller.dummyUsers[index].jobTitle,
                                      style: AppTextStyles
                                          .font14SecondaryBlackCairoRegular,
                                    ),
                                  ]),
                            ),
                            if (controller.assignedUsers[index])
                              GestureDetector(
                                onTap: () => controller.unassignUser(index),
                                child: SvgPicture.asset(
                                  AppAssets.delete,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}
