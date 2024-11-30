part of '../../../pages/tablet/tablet_request_form_page.dart';

class TabletRequestAssetFields extends GetView<RequestAssetsController> {
  const TabletRequestAssetFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                controller: controller.availabilityController,
                label: 'Availability',
              ),
            ),
            horizontalSpace(15),
            Expanded(
              child: LabeledFormField(
                controller: controller.quantityController,
                label: 'Quantity',
              ),
            ),
          ],
        ),
        verticalSpace(24),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ),
            horizontalSpace(15),
            Expanded(
              child: LabeledFormField(
                controller: controller.expectedDeliveryController,
                date: true,
                label: 'Expected Delivery',
                hintText: 'Expected Delivery',
                backGroundColor: AppColors.field,
              ),
            ),
          ],
        ),
        verticalSpace(24),
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                controller: controller.expectedReturnController,
                date: true,
                label: 'Expected Return',
                hintText: 'Expected Return',
                backGroundColor: AppColors.field,
              ),
            ),
            horizontalSpace(15),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
