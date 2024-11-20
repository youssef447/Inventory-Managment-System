// by : Mohamed Ashraf
// date : 14/11/2024

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/requests_enums.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../home/presentation/ui/widgets/common/horizontal/rectangled_filter_card.dart';
import '../../../../domain/approval_entity.dart';
import '../../../controller/approval_controller.dart';
import '../../widget/common/approval_buttons.dart';

class TabletApprovalDetailsPage extends GetView<ApprovalController> {
  final int index;
  final List<ApprovalEntity> list;
  const TabletApprovalDetailsPage({super.key, required this.index, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isPhone ? 343.w : Get.width * 0.75,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        HapticFeedbackHelper.triggerHapticFeedback(
                          vibration: VibrateType.mediumImpact,
                          hapticFeedback: HapticFeedback.mediumImpact,
                        );
                        Get.back();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 22,
                        child: Icon(
                          Icons.add,
                          color: AppColors.icon,
                          size: 36,
                        ),
                      )),
                  horizontalSpace(8),
                  Text(
                    'Approval'.tr,
                    style: AppTextStyles.font24MediumBlackCairo,
                  ),
                  const Spacer(),
                  RectangledFilterCard(
                    width: 112.w,
                    image: AppAssets.download,
                    text: 'Download'.tr,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                ],
              ),
              verticalSpace(15),
              Image.asset(
                AppAssets.phone,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.fill,
              ),
              verticalSpace(15),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.approvalIdController,
                      label: 'Request ID'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.brandController,
                      label: 'Asset Name'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),

              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.categoryController,
                      label: 'Category'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.subcategoryController,
                      label: 'SubCategory'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),

              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.modelController,
                      label: 'Model'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.brandController,
                      label: 'Brand'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.priorityController,
                      label: 'Priority'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.brandController,
                      label: 'Brand'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.availabilityController,
                      label: 'Availability'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.quantityController,
                      label: 'Quantity'.tr,
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
                      controller: controller.expectedDeliveryDateController,
                      readOnly: false,
                      date: true,
                      label: 'Requested Date'.tr,
                      hintText: 'Requested Date'.tr,
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: LabeledFormField(
                      controller: controller.expectedReturnDateController,
                      readOnly: false,
                      date: true,
                      label: 'Return Date'.tr,
                      hintText: 'Return Date'.tr,
                    ),
                  ),
                  horizontalSpace(15),
                  const Spacer(),
                ],
              ),
              verticalSpace(24),
              LabeledFormField(
                controller: controller.additionalNoteController,
                expands: true,
                readOnly: false,
                label: 'Additional Notes'.tr,
                hintText: 'Additional Notes'.tr,
              ),
              verticalSpace(24),
              // AttachmentsSection(
              //   model: model,
              // ),
              verticalSpace(66),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: SizedBox(
                  width: Get.width * 0.3,
                  child: ApprovalButtons(
                    approvalId: list[index].approvalId,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
