import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/products/presentation/ui/pages/tablet/add_product/add_consumable_page.dart';
import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../products/presentation/ui/pages/tablet/add_product/add_asset_page.dart';
import '../../../../../../../products/presentation/ui/widgets/tablet/dialog/add_product_dialog.dart';
import '../../../../controller/admin_controller.dart';

// Date: 5/8/2024
// By: Youssef Ashraf
// Last update: 6/8/2024
// Objectives: This file is responsible for providing the search filter widget which has search field and filter buttons In Tablet View.

class MobileAddButton extends GetView<AdminController> {


  const MobileAddButton({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: context.isArabic ? false : true,
      child: Obx(() {
        return SlideAnimation(
          leftToRight: context.isArabic ? false : true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (controller.currentCategoryIndex == 0)
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
              else if (controller.currentCategoryIndex == 1)
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
              else if (controller.currentCategoryIndex == 2)
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
                        image: AppAssets.add,
                        text: 'Storage Location'.tr,
                        color: AppColors.primary,
                        onTap: () {
                          // Default action
                        },
                      ),
            ],
          ),
        );
      }),
    );
  }
}
