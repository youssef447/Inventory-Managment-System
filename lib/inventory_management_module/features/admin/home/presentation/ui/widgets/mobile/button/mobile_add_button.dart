import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';

import '../../../../../../../../core/theme/app_colors.dart';

import '../../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../products/presentation/ui/pages/mobile/mobile_add_product/mobile_add_asset_page.dart';
import '../../../../../../../products/presentation/ui/pages/mobile/mobile_add_product/mobile_add_consumable_page.dart';
import '../../../../../../../products/presentation/ui/widgets/tablet/dialog/add_product_dialog.dart';
import '../../../../../../storage/presentation/controller/storage_form_controller.dart';
import '../../../../../../suppliers/presentation/controller/supplier_form_controller.dart';
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
                Row(
                  children: [
                    RectangledFilterCard(
                      width: 112.w,
                      image: AppAssets.add,
                      text: 'Assets'.tr,
                      color: AppColors.primary,
                      onTap: () {
                        GetDialogHelper.generalDialog(
                          child: const MobileAddAssetPage(),
                          context: context,
                        );
                      },
                    ),
                  ],
                )
              else if (controller.currentCategoryIndex.value == 2)
                RectangledFilterCard(
                  width: 145.w,
                  image: AppAssets.add,
                  text: 'Consumables'.tr,
                  color: AppColors.primary,
                  onTap: () {
                    GetDialogHelper.generalDialog(
                      child: const MobileAddConsumablePage(),
                      context: context,
                    );
                  },
                )
              else if (controller.currentCategoryIndex.value == 3)
                Expanded(
                  child: Row(
                    children: [
                      RectangledFilterCard(
                        width: 112.w,
                        text: 'Invoice'.tr,
                        color: AppColors.primary,
                        onTap: () {},
                      ),
                      const Spacer(),
                      RectangledFilterCard(
                        width: 112.w,
                        image: AppAssets.add,
                        text: 'Orders'.tr,
                        color: AppColors.primary,
                        onTap: () {
                          context.navigateTo(Routes.newOrder);
                          // Add category action
                        },
                      ),
                    ],
                  ),
                )
              else if (controller.currentCategoryIndex.value == 4)
                RectangledFilterCard(
                  width: 112.w,
                  image: AppAssets.add,
                  text: 'Suppliers'.tr,
                  color: AppColors.primary,
                  onTap: () {
                    Get.lazyPut(
                        () => SupplierFormController()..setSupplierData());
                    context.navigateTo(Routes.supplierForm);
                  },
                )
              else
                RectangledFilterCard(
                  image: AppAssets.add,
                  width: 140.w,
                  text: 'Storage Location'.tr,
                  color: AppColors.primary,
                  onTap: () {
                    Get.lazyPut(
                        () => StorageFormController()..setStorageData());
                    context.navigateTo(Routes.storageForm);
                  },
                ),
            ],
          ),
        );
      }),
    );
  }
}
