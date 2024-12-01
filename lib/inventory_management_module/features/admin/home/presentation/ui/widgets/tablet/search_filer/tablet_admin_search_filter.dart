import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../../features/products/presentation/ui/pages/tablet/add_product/add_consumable_page.dart';
import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../../../../products/presentation/ui/pages/tablet/add_product/add_asset_page.dart';
import '../../../../../../../products/presentation/ui/widgets/tablet/dialog/add_product_dialog.dart';
import '../../../../../../storage/presentation/controller/storage_form_controller.dart';
import '../../../../../../suppliers/presentation/controller/supplier_form_controller.dart';
import '../../../../controller/admin_controller.dart';
import '../../common/admin_filter_dialog.dart';

// Date: 26/11/2024
// By: Mohamed Ashraf
// Last update: 27/11/2024
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
        return Padding(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: 12.h,
          ),
          child: SlideAnimation(
            leftToRight: context.isArabic ? false : true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (controller.currentCategoryIndex.value == 3)
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: RectangledFilterCard(
                      width: 112.w,
                      text: 'Invoice'.tr,
                      color: AppColors.primary,
                      onTap: () {
                        context.navigateTo(Routes.invoices);
                      },
                    ),
                  ),
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
                        if (context.isLandscapee)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.filter,
                            text: 'Filter'.tr,
                            textColor: AppColors.text,
                            color: AppColors.card,
                            onTap: () {
                              GetDialogHelper.generalDialog(
                                  child: const AdminFilterDialog(),
                                  context: context);
                            },
                          ),
                        if (!context.isLandscapee)
                          SquaredChipCard(
                            icon: AppAssets.filter,
                            color: AppColors.card,
                            onTap: () {
                              GetDialogHelper.generalDialog(
                                  child: const AdminFilterDialog(),
                                  context: context);
                            },
                          ),
                        horizontalSpace(9),
                        if (controller.currentCategoryIndex.value == 0)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Product'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              GetDialogHelper.generalDialog(
                                child: const AddProductDialog(),
                                context: context,
                              );
                            },
                          )
                        else if (controller.currentCategoryIndex.value == 1)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Assets'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              GetDialogHelper.generalDialog(
                                child: const AddAssetPage(),
                                context: context,
                              );
                            },
                          )
                        else if (controller.currentCategoryIndex.value == 2)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Consumables'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              GetDialogHelper.generalDialog(
                                child: const AddConsumablePage(),
                                context: context,
                              );
                            },
                          )
                        else if (controller.currentCategoryIndex.value == 3)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Order'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              context.navigateTo(Routes.newOrder);
                            },
                          )
                        else if (controller.currentCategoryIndex.value == 4)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Suppliers'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              Get.lazyPut(
                                () =>
                                    SupplierFormController()..setSupplierData(),
                              );
                              context.navigateTo(Routes.supplierForm);
                            },
                          )
                        else
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.add,
                            text: 'Storage Location'.tr,
                            color: AppColors.primary,
                            onTap: () {
                              Get.lazyPut(() =>
                                  StorageFormController()..setStorageData());
                              context.navigateTo(Routes.storageForm);
                            },
                          ),
                        horizontalSpace(9),
                        if (context.isLandscapee)
                          RectangledFilterCard(
                            width: 112.w,
                            image: AppAssets.download,
                            text: 'Download'.tr,
                            color: AppColors.primary,
                            onTap: () {},
                          ),
                        if (!context.isLandscapee)
                          SquaredChipCard(
                            icon: AppAssets.download,
                            color: AppColors.primary,
                            onTap: () {},
                          ),
                      ],
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
