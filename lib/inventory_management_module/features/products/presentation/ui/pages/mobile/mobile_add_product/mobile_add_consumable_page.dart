import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../controller/add_product_controller.dart';
import '../../../widgets/common/add_approvals_search.dart';
import '../../../widgets/common/attachments/product_specification_attachments_section.dart';
import '../../../widgets/common/attachments/product_warranty_attachment_section.dart';
import '../../../widgets/common/upload_image_avatar_widget.dart';
import '../../../widgets/tablet/card/add_approval_cycle.dart';

class MobileAddConsumablePage extends GetView<AddProductController> {
  const MobileAddConsumablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Add New Consumable'.tr,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                  ],
                ),
                verticalSpace(24),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Create Automatic IDs'.tr,
                      style: AppTextStyles.font16BlackMediumCairo,
                    ),
                    verticalSpace(8),
                    DefaultSwitchButton(
                        value: controller.autoId,
                        onChanged: (v) {
                          controller.toggleAutomaticIdSwitch(v);
                        })
                  ],
                ),
                verticalSpace(24),
                const UploadImageAvatarWidget(),
                verticalSpace(24),
                LabeledFormField(
                  controller: controller.orderIdController,
                  label: 'Order Id'.tr,
                ),
                verticalSpace(15),
                LabeledFormField(
                  controller: controller.productIdController,
                  label: 'ProductId'.tr,
                ),
                verticalSpace(24),
                Obx(() {
                  return LabeledDropdownField(
                    label: 'Category'.tr,
                    value: controller.categoryValue,
                    textButton: controller.categoryValue,
                    onChanged: (value) {
                      controller.updateCategoryValue(value);
                    },
                    controller: controller.categoryController,
                    items: List.generate(
                      controller.category.length,
                      (index) {
                        return DropdownMenuItem(
                          value: controller.category[index],
                          child: Text(
                            controller.category[index],
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  );
                }),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  controller: controller.subCategoryController,
                  label: 'subCategory'.tr,
                ),
                verticalSpace(24),
                LabeledFormField(
                  readOnly: false,
                  controller: controller.brandController,
                  label: 'Brand'.tr,
                ),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  controller: controller.modelController,
                  label: 'Model'.tr,
                ),
                verticalSpace(24),
          LabeledDropdownField(
            label: 'Usage Frequency'.tr,
            textButton: controller.currencyValue?.getName,
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
                    style:
                    AppTextStyles.font14SecondaryBlackCairoMedium,
                  ),
                );
              },
            ),
          ),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  date: true,
                  controller: controller.expirationDateController,
                  label: 'Expiration Date'.tr,
                ),
                verticalSpace(24),
                LabeledFormField(
                  controller: controller.reorderLevelController,
                  label: 'Reorder Level'.tr,
                ),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  controller: controller.reorderQuantityController,
                  label: 'Reorder Quantity'.tr,
                ),
                verticalSpace(24),
                LabeledFormField(
                  controller: controller.totalQuantityController,
                  label: 'Quantity'.tr,
                ),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  controller: controller.unitCostController,
                  label: 'Unit Cost'.tr,
                ),
                verticalSpace(24),
          LabeledDropdownField(
            label: 'Currency'.tr,
            textButton: controller.currencyValue?.getName,
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
                    style:
                    AppTextStyles.font14SecondaryBlackCairoMedium,
                  ),
                );
              },
            ),
          ),
                verticalSpace(15),
                Obx(() {
                  return LabeledDropdownField(
                    label: 'Supplier Name'.tr,
                    textButton: controller.supplierNameValue,
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
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  );
                }),
                verticalSpace(24),
                Obx(() {
                  return LabeledDropdownField(
                    label: 'Storage Requirement'.tr,
                    textButton:
                        controller.storageRequirementValue,
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
                            controller.storageRequirement[index].toString().tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  );
                }),
                verticalSpace(15),
                LabeledFormField(
                  readOnly: false,
                  date: true,
                  controller: controller.expectedLifetimeController,
                  label: 'Expected Lifetime'.tr,
                ),
                verticalSpace(24),
                Obx(() {
                  return SizedBox(
                    width: Get.width,
                    child: LabeledDropdownField(
                      label: 'Unit Of Measurement'.tr,
                      textButton:
                          controller.unitOfMeasurementValue?.getName,
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
                              style:
                                  AppTextStyles.font14SecondaryBlackCairoMedium,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }),
                verticalSpace(24),
                GetBuilder<AddProductController>(builder: (controller) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return LabeledDropdownField(
                              label: 'Storage Location'.tr,
                              value: controller
                                  .selectedStorageLocations[index].value,
                              textButton: controller
                                  .selectedStorageLocations[index]
                                  .value
                                  ?.getName,
                              onChanged: (value) {
                                controller.updateStorageLocationValue(
                                    index, value!);
                              },
                              controller:
                                  controller.storageLocationControllers[index],
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
                          verticalSpace(15),
                          LabeledFormField(
                            readOnly: false,
                            controller: controller.stockOnHandController[index],
                            label: 'Stock On Hand'.tr,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return verticalSpace(12);
                    },
                    itemCount: controller.storageLocationCount,
                  );
                }),
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
                      controller.addMoreStorage();
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
                Text(
                  'Product Specification'.tr,
                  style: AppTextStyles.font18BlackCairoMedium,
                ),
                verticalSpace(8),
                const ProductSpecificationAttachmentsSection(),
                verticalSpace(24),
                Text(
                  'Product Warranty'.tr,
                  style: AppTextStyles.font18BlackCairoMedium,
                ),
                const ProductWarrantyAttachmentSection(),
                verticalSpace(8),
                GetBuilder<AddProductController>(builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Requires Approval'.tr,
                            style: AppTextStyles.font16BlackMediumCairo,
                          ),
                          verticalSpace(100),
                          DefaultSwitchButton(
                            value: controller.isApproval,
                            onChanged: (bool value) async {
                              controller.toggleApproval();
                            },
                          ),
                        ],
                      ),
                      verticalSpace(26),
                      if (controller.isApproval)
                        const Column(
                          children: [
                            AddApprovalsSearch(),
                            AddApprovalCycle(),
                          ],
                        ),
                    ],
                  );
                }),
                verticalSpace(26),
                Row(
                  children: [
                    AppDefaultButton(
                      text: 'Discard',
                      color: AppColors.grey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    AppDefaultButton(
                      text: 'Add Consumable'.tr,
                      color: AppColors.primary,
                      onPressed: () {
                        controller.addConsumableItem();
                        Navigator.pop(context);
                        GetDialogHelper.generalDialog(
                            context: Get.context!,
                            child: DefaultDialog(
                              title: 'Success'.tr,
                              subTitle: 'You Successfully Added New Product'.tr,
                              lottieAsset: AppAssets.success,
                            ));
                      },
                    )
                  ],
                ),
              ],
            ),
          ));
    });
  }
}
