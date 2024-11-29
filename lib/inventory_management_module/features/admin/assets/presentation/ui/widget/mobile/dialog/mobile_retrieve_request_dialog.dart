//by : Mohamed Ashraf


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../controller/admin_assets_controller.dart';

class MobileRetrieveRequestDialog extends GetView<AdminAssetsController> {
  const MobileRetrieveRequestDialog({super.key});

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
        constraints: BoxConstraints(maxHeight: Get.height * 0.7),
        child: SingleChildScrollView(
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
                  Text('Retrieve Request'.tr,
                      overflow: TextOverflow.ellipsis,
                      style: context.isTablett
                          ? AppTextStyles.font20MediumBlackCairo
                          : AppTextStyles.font16BlackMediumCairo),
                ],
              ),
              verticalSpace(24),
              LabeledFormField(
              label: 'Asset Id',
                controller: controller.assetIdController,
              ),
                     horizontalSpace(16),
              LabeledFormField(
                label: 'Request Id',
                controller: controller.requestIdController,
              ),
              verticalSpace(24),
              LabeledFormField(
                label: 'Quantity',
                controller: controller.quantityController,
              ),
              horizontalSpace(16),
              LabeledFormField(
                label: 'Return Date',
                controller: controller.returnDateController,
                date: true,
              ),
              verticalSpace(24),
        LabeledDropdownField(
          label: 'Delivery Method'.tr,
          value: controller.deliveryMethodValue.value,
          textButton: controller.deliveryMethodValue.value,
          onChanged: (value) {
            controller.updateDeliveryMethodValue(value);
          },
          controller: controller.deliveryMethodController,
          items: List.generate(controller.deliveryMethod.length,
                (index) {
              return DropdownMenuItem(
                value: controller.deliveryMethod[index],
                child: Text(
                  controller.deliveryMethod[index],
                  style:
                  AppTextStyles.font14SecondaryBlackCairoMedium,
                ),
              );
            },
          ),
        ),
              verticalSpace(24),
              Row(
                children: [
                  AppDefaultButton(
                    text: 'Discard'.tr,
                    color: AppColors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                     const Spacer(),
                  AppDefaultButton(
                    text: 'Submit'.tr,
                    onPressed: () {
                      Navigator.pop(context);
                      GetDialogHelper.generalDialog(
                        context: Get.context!,
                        child:  DefaultDialog(
                          title: 'Successful'.tr,
                          subTitle: 'You Successfully Retrieved This Product'.tr,
                          lottieAsset: AppAssets.success,
                        ),
                      );

                    },
                  ),

                ],
              )
            ],
          ),
        ));
  }
}
