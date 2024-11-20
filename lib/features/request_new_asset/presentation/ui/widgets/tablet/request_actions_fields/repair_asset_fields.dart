part of '../../../pages/tablet/tablet_request_form_page.dart';

class TabletRepairAssetFields extends GetView<RequestAssetsController> {
  const TabletRepairAssetFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        IssueTypes.values.length,
                        (index) {
                          return DropdownMenuItem(
                            value: IssueTypes.values[index],
                            child: Text(
                              IssueTypes.values[index].getName.tr,
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
          ],
        ),
        verticalSpace(24),
        Row(
          children: [
            Expanded(
              child: LabeledFormField(
                controller: controller.repairDateController,
                date: true,
                label: 'Repair Date',
                hintText: 'Repair Date',
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
