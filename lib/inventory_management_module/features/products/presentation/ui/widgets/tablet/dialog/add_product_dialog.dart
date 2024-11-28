//by : Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../features/products/presentation/ui/pages/tablet/add_product/add_consumable_page.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../controller/add_product_controller.dart';
import '../../../pages/mobile/mobile_add_product/mobile_add_asset_page.dart';
import '../../../pages/tablet/add_product/add_asset_page.dart';

class AddProductDialog extends GetView<AddProductController> {
  const AddProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.isTablett ? Get.width * 0.6 : Get.width * 0.9,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(8.r),
        ),
        constraints: BoxConstraints(maxHeight: Get.height * 0.2),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 16,
                    child: SvgPicture.asset(
                      AppAssets.add,
                      width: 16,
                      height: 16,
                      color: Colors.black,
                    )),
                horizontalSpace(8),
                Text('Add New Product'.tr,
                    overflow: TextOverflow.ellipsis,
                    style: context.isTablett
                        ? AppTextStyles.font24MediumBlackCairo
                        : AppTextStyles.font16BlackMediumCairo),
                const Spacer(),
                Obx(
                  () => AppDropdown(
                    width: context.isTablett ? 150.w : 120.w,
                    showDropdownIcon: true,
                    onChanged: (value) {
                      controller.updateProductTypeValue(value);
                    },
                    hintText: 'Assets',
                    height: 44.h,
                    value: controller.productTypeValue.value,
                    textButton: controller.productTypeValue.value?.getName,
                    items: List.generate(
                      controller.productType.length,
                      (index) {
                        return DropdownMenuItem(
                          value: controller.productType[index],
                          child: Text(
                            controller.productType[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            AppDefaultButton(
              text: 'Next'.tr,
              onPressed: () {
                Navigator.pop(context);
                controller.productTypeValue.value == ProductTypes.asset
                    ? GetDialogHelper.generalDialog(
                        child: context.isTablett
                            ? const AddAssetPage()
                            : MobileAddAssetPage(),
                        context: context,
                      )
                    : GetDialogHelper.generalDialog(
                        child: const AddConsumablePage(),
                        context: context,
                      );
              },
            )
          ],
        ));
  }
}
