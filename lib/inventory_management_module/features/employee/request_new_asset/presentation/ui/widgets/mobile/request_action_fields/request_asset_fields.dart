part of '../../../pages/mobile/mobile_request_form_page.dart';

class MobileRequestAssetFields extends GetView<RequestAssetsController> {
  const MobileRequestAssetFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledFormField(
          controller: controller.availabilityController,
          label: 'Availability',
        ),
        verticalSpace(15),
        LabeledFormField(
          controller: controller.quantityController,
          label: 'Quantity',
        ),
        verticalSpace(24),
        Text(
          'Priority'.tr,
          style: AppTextStyles.font16BlackCairoMedium,
        ),
        verticalSpace(8),
        Obx(
          () => AppDropdown(
            showDropdownIcon: true,
            onChanged: (value) {
              controller.updatePriority(value);
            },
            hintText: 'Priority',
            height: 44.h,
            value: controller.priorityValue.value,
            textButton: controller.priorityValue.value?.getName,
            items: List.generate(
              controller.priorities.length,
              (index) {
                return DropdownMenuItem(
                  value: controller.priorities[index],
                  child: Text(
                    controller.priorities[index].getName.tr,
                    style: AppTextStyles.font14SecondaryBlackCairoMedium,
                  ),
                );
              },
            ),
          ),
        ),
        verticalSpace(15),
        LabeledFormField(
          controller: controller.expectedDeliveryController,
          date: true,
          label: 'Expected Delivery',
          hintText: 'Expected Delivery',
          backGroundColor: AppColors.field,
        ),
        verticalSpace(24),
        LabeledFormField(
          controller: controller.expectedReturnController,
          date: true,
          label: 'Expected Return',
          hintText: 'Expected Return',
          backGroundColor: AppColors.field,
        ),
      ],
    );
  }
}
