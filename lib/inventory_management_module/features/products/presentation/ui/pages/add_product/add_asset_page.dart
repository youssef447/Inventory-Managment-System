import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/requests_enums.dart';
import 'package:inventory_management/inventory_management_module/core/theme/app_colors.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/buttons/app_default_button.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/buttons/default_switch_button.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../controller/add_product_controller.dart';
import '../../widgets/common/attachments/product_specification_attachments_section.dart';
import '../../widgets/common/attachments/product_warranty_attachment_section.dart';
import '../../widgets/common/upload_image_avatar_widget.dart';

class AddAssetPage extends GetView<AddProductController> {
  const AddAssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.85,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(8.r),
        ),
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.9,
        ),
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
                  Text(
                    'Add New Assets'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  const UploadImageAvatarWidget(),
                  const Spacer(),
                  Text(
                    'Create Automatic IDs'.tr,
                    style: AppTextStyles.font16BlackMediumCairo,
                  ),
                  horizontalSpace(8),
                  DefaultSwitchButton(value: true, onChanged: (v) {})
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.orderIdController,
                      label: 'Order Id'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.productIdController,
                      label: 'ProductId'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.categoryController,
                      label: 'Category'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.subCategoryController,
                      label: 'subCategory'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.brandController,
                      label: 'Brand'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.modelController,
                      label: 'Model'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.expirationDateController,
                      label: 'Expiration Date'.tr,
                      date: true,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.unitCostController,
                      label: 'Unit Cost'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.quantityController,
                      label: 'Unit Test'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: Obx(() {
                      return LabeledDropdownField(
                        label: 'Currency'.tr,
                        value: controller.currencyValue.value,
                        textButton: controller.currencyValue.value?.getName,
                        onChanged: (value) {
                          controller.updateCurrencyValue(value);
                        },
                        controller: controller.currencyController,
                        items: List.generate(
                          controller.currency.length,
                          (index) {
                            return DropdownMenuItem(
                              value: controller.currency[index],
                              child: Text(
                                controller.currency[index].getName.tr,
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return LabeledDropdownField(
                        label: 'Supplier Name'.tr,
                        value: controller.supplierNameValue.value,
                        textButton:
                            controller.supplierNameValue.value?.toString(),
                        onChanged: (value) {
                          controller.updateSupplierNameValue(value);
                        },
                        controller: controller.supplierNameController,
                        items: List.generate(
                          controller.supplierName.length,
                          (index) {
                            return DropdownMenuItem(
                              value: controller.supplierName[index],
                              child: Text(
                                controller.supplierName[index].toString(),
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: Obx(() {
                      return LabeledDropdownField(
                        label: 'Storage Requirement'.tr,
                        value: controller.storageRequirementValue.value,
                        textButton: controller.storageRequirementValue.value
                            ?.toString()
                            .tr,
                        onChanged: (value) {
                          controller.updateStorageRequirementValue(value);
                        },
                        controller: controller.storageRequirementController,
                        items: List.generate(
                          controller.storageRequirement.length,
                          (index) {
                            return DropdownMenuItem(
                              value: controller.storageRequirement[index],
                              child: Text(
                                controller.storageRequirement[index]
                                    .toString()
                                    .tr,
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      date: true,
                      controller: controller.expectedLifetimeController,
                      label: 'Expected Lifetime'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: Obx(() {
                      return LabeledDropdownField(
                        label: 'Unit Of Measurement'.tr,
                        value: controller.unitOfMeasurementValue.value,
                        textButton:
                            controller.unitOfMeasurementValue.value?.getName,
                        onChanged: (value) {
                          controller.updateUnitOfMeasurementValue(value);
                        },
                        controller: controller.unitOfMeasurementController,
                        items: List.generate(
                          controller.unitOfMeasurement.length,
                          (index) {
                            return DropdownMenuItem(
                              value: controller.unitOfMeasurement[index],
                              child: Text(
                                controller.unitOfMeasurement[index].getName,
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return LabeledDropdownField(
                        label: 'Storage Location'.tr,
                        value: controller.storageLocationValue.value,
                        textButton:
                            controller.storageLocationValue.value?.getName,
                        onChanged: (value) {
                          controller.updateStorageLocationValue(value);
                        },
                        controller: controller.storageLocationController,
                        items: List.generate(
                          controller.storageLocation.length,
                          (index) {
                            return DropdownMenuItem(
                              value: controller.storageLocation[index],
                              child: Text(
                                controller.storageLocation[index].getName,
                                style: AppTextStyles
                                    .font14SecondaryBlackCairoMedium,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      readOnly: false,
                      controller: controller.stockOnHandController,
                      label: 'Stock On Hand'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: RectangledFilterCard(
                  width: 200.w,
                  image: AppAssets.add,
                  text: 'Add More Storage'.tr,
                  textColor: AppColors.white,
                  color: AppColors.black,
                  onTap: () {
                    // Add category action
                  },
                ),
              ),
              verticalSpace(24),
              LabeledFormField(
                readOnly: false,
                expands: true,
                controller: controller.additionalNoteController,
                label: 'Additional Note'.tr,
              ),
              verticalSpace(24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Specification'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  ),
                  const Spacer(),
                  const ProductSpecificationAttachmentsSection(),
                ],
              ),
              verticalSpace(24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Warranty'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  ),
                  const Spacer(),
                  const ProductWarrantyAttachmentSection(),
                ],
              ),
              verticalSpace(26),
              Row(
                children: [
                  Text(
                    'Requires Approval'.tr,
                    style: AppTextStyles.font16BlackMediumCairo,
                  ),
                  horizontalSpace(100),
                  DefaultSwitchButton(value: false, onChanged: (v) {})
                ],
              ),
              verticalSpace(26),
              Row(
                children: [
                  AppDefaultButton(
                    text: 'Discard',
                    color: AppColors.grey,
                  ),
                  const Spacer(),
                  AppDefaultButton(
                    text: 'Add Asset',
                    color: AppColors.primary,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
