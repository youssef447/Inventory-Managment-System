part of '../../../pages/mobile/mobile_request_form_page.dart';

class MobileRepairAssetFields extends GetView<RequestAssetsController> {
  const MobileRepairAssetFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        verticalSpace(24),
        Text(
          'Issue Type'.tr,
          style: AppTextStyles.font16BlackCairoMedium,
        ),
        verticalSpace(8),
        Obx(
          () => AppDropdown(
            showDropdownIcon: true,
            onChanged: (value) {
              controller.updateIssueType(value);
            },
            hintText: 'Issue Type',
            height: 44.h,
            value: controller.issueTypeValue.value,
            textButton: controller.issueTypeValue.value?.getName,
            items: List.generate(
              controller.issueTypes.length,
              (index) {
                return DropdownMenuItem(
                  value: controller.issueTypes[index],
                  child: Text(
                    controller.issueTypes[index].getName.tr,
                    style: AppTextStyles.font14SecondaryBlackCairoMedium,
                  ),
                );
              },
            ),
          ),
        ),
        verticalSpace(24),
        LabeledFormField(
          controller: controller.repairDateController,
          date: true,
          label: 'Repair Date',
          hintText: 'Repair Date',
        ),
      ],
    );
  }
}
