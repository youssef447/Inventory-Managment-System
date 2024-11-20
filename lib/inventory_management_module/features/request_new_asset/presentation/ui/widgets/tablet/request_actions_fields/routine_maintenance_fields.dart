part of '../../../pages/tablet/tablet_request_form_page.dart';

class TabletRoutineMaintenanceFields extends GetView<RequestAssetsController> {
  const TabletRoutineMaintenanceFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                          style: AppTextStyles.font14SecondaryBlackCairoMedium,
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
            controller: controller.maintenanceDateController,
            date: true,
            hintText: 'Maintenance Date',
            label: 'Maintenance Date',
          ),
        ),
      ],
    );
  }
}
