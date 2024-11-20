part of '../../../pages/tablet/tablet_request_form_page.dart';

class TabletRequestConsumableFields
    extends GetView<RequestConsumableController> {
  const TabletRequestConsumableFields({super.key});

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
                controller: controller.stockRemainingController,
                label: 'Stock Remaining',
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
                        RequestPriorityTypes.values.length,
                        (index) {
                          return DropdownMenuItem(
                            value: RequestPriorityTypes.values[index],
                            child: Text(
                              RequestPriorityTypes.values[index].getName.tr,
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
              child: LabeledFormField(
                controller: controller.expectedDeliveryController,
                date: true,
                label: 'Expected Delivery',
                hintText: 'Expected Delivery',
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
