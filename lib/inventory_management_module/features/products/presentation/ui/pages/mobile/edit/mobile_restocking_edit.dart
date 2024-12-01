import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/buttons/app_default_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../controller/add_product_controller.dart';
import '../../../widgets/common/attachments/product_warranty_attachment_section.dart';

// by : mohamed ashraf
//date :27/11/2024
class MobileRestockingEdit extends GetView<AddProductController> {
  const MobileRestockingEdit({super.key});
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
          child: GetBuilder<AddProductController>(
            builder: (controller) {
              return Column(
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
                        'Restocking Product'.tr,
                        style: AppTextStyles.font24MediumBlackCairo,
                      ),
                    ],
                  ),
                  verticalSpace(24),
                  LabeledFormField(
                    controller: controller.orderIdController,
                    label: 'Order Id'.tr,
                  ),
                  horizontalSpace(15),
                  LabeledFormField(
                    controller: controller.totalQuantityController,
                    label: 'Quantity'.tr,
                  ),
                  verticalSpace(24),
                  LabeledFormField(
                    readOnly: false,
                    controller: controller.unitCostController,
                    label: 'Unit Test'.tr,
                  ),
                  horizontalSpace(15),
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
                      style: AppTextStyles.font14SecondaryBlackCairoMedium,
                    ),
                  );
                },
              ),
                      ),
                  verticalSpace(24),
                  LabeledFormField(
                    readOnly: false,
                    controller: controller.orderIdController,
                    label: 'Order Value'.tr,
                  ),
                  horizontalSpace(15),
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
                              style: AppTextStyles.font14SecondaryBlackCairoMedium,
                            ),
                          );
                        },
                      ),
                    );
                  }),
                  verticalSpace(24),
                  GetBuilder<AddProductController>(builder: (controller) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Obx(() {
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
                            ),
                            horizontalSpace(15),
                            Expanded(
                              child: LabeledFormField(
                                readOnly: false,
                                controller: controller.stockOnHandController[index],
                                label: 'Stock On Hand'.tr,
                              ),
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
                  Text(
                    'Invoice'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  ),
                  const ProductWarrantyAttachmentSection(),
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
                        text: 'Save'.tr,
                        color: AppColors.primary,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ],
              );
            }
          ),
        ));
  }
}
