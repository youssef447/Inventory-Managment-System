part of '../../../pages/tablet/tablet_new_order_form_page.dart';

//Youssef Ashraf
/// Product Order Form in Tablet View
class TabletProductOrderForm extends GetView<NewOrderFormController> {
  final int index;
  const TabletProductOrderForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Order Details'.tr,
              style: AppTextStyles.font20BlackCairoMedium,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => controller.hideProductDetailsCard(index),
              child: Text(
                controller.hideForm[index] ? 'Expand'.tr : 'Hide'.tr,
                style: AppTextStyles.font14BlackCairoMedium
                    .copyWith(color: AppColors.blue),
              ),
            ),
          ],
        ),
        verticalSpace(17),
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.orderIDController[index],
                label: 'Order ID',
                readOnly: controller.createAutomaticIDs[index],
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: LabeledFormField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.quantityController[index],
                label: 'Quantity',
                readOnly: false,
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.unitCostController[index],
                label: 'Unit Cost',
                readOnly: false,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: LabeledDropdownField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.currencyController[index],
                label: 'Currency',
                hintText: 'Select Currency',
                textButton: controller.selectedCurrency[index]?.getName,
                value: controller.selectedCurrency[index],
                onChanged: (value) {
                  controller.selectCurrency(value, index);
                },
                items: List.generate(
                  Currency.values.length,
                  (index) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: Currency.values[index],
                      child: Text(
                        Currency.values[index].getName.tr,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: LabeledDropdownField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.supplierController[index],
                label: 'Supplier',
                hintText: 'Select Supplier',
                textButton: controller.selectedSupplier[index]?.supplierName,
                value: controller.selectedSupplier[index],
                onChanged: (value) {
                  controller.selectSupplier(value, index);
                },
                items: List.generate(
                  controller.suppliers.length,
                  (i) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: controller.suppliers[i],
                      child: Text(
                        controller.suppliers[i].supplierName,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: LabeledFormField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.orderValueController[index],
                label: 'Order Value',
                readOnly: false,
              ),
            ),
          ],
        ),
        verticalSpace(8),
        verticalSpace(8),
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                backGroundColor:
                    Get.isDarkMode ? AppColors.field : AppColors.white,
                controller: controller.expectedDeliveryController[index],
                label: 'Expected Delivery',
                date: true,
              ),
            ),
            horizontalSpace(20),
            const Spacer(),
          ],
        ),
        verticalSpace(8),
        ListView.separated(
          separatorBuilder: (context, index) {
            return verticalSpace(12);
          },
          itemCount: controller.storageLocationCount[index],
          shrinkWrap: true,
          itemBuilder: (context, count) {
            return Row(
              children: [
                Expanded(
                  child: LabeledDropdownField(
                    backGroundColor:
                        Get.isDarkMode ? AppColors.field : AppColors.white,
                    label: 'Storage Location'.tr,
                    value: controller.selectedStorageLocations[index][count],
                    textButton: controller
                        .selectedStorageLocations[index][count]?.locationName,
                    onChanged: (value) {
                      controller.updateStorageLocationValue(
                        index,
                        count,
                        value,
                      );
                    },
                    controller: controller.storageLocationControllers[index],
                    items: List.generate(
                      controller.storageLoctaions.length,
                      (i) {
                        return DropdownMenuItem(
                          value: controller.storageLoctaions[i],
                          child: Text(
                            controller.storageLoctaions[i].locationName,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                horizontalSpace(20),
                const Spacer(),
              ],
            );
          },
        ),
        verticalSpace(10),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: RectangledFilterCard(
            width: 200.w,
            image: AppAssets.add,
            text: 'Add More Storage'.tr,
            textColor: AppColors.white,
            color: AppColors.black,
            onTap: () {
              controller.addMoreStorage(index);
            },
          ),
        ),
        verticalSpace(8),
        LabeledFormField(
          backGroundColor: Get.isDarkMode ? AppColors.field : AppColors.white,
          controller: controller.additonalNotesController[index],
          label: 'Additional Notes',
          readOnly: false,
          expands: true,
        ),
        verticalSpace(40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invoice'.tr,
              style: AppTextStyles.font24MediumBlackCairo,
            ),
            const Spacer(),
            if (controller.invoices[index] == null)
              GestureDetector(
                onTap: () {
                  controller.uploadAttachments(index);
                },
                child: Container(
                  height: 35.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.5.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.card,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'No Files'.tr,
                        style: AppTextStyles.font14BlackCairoMedium
                            .copyWith(color: AppColors.textButton),
                      ),
                      context.isTablett ? horizontalSpace(100) : const Spacer(),
                      SvgPicture.asset(
                        AppAssets.export,
                        width: 16.w,
                        height: 16.h,
                        color: AppColors.icon,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        if (controller.invoices[index] != null)
          Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: AttachmentCard(
              showDelete: true,
              showDownload: false,
              model: controller.invoices[index]!,
              onDelete: () {
                controller.removeAttachment(index);
              },
            ),
          ),
        verticalSpace(20),
      ],
    );
  }
}
