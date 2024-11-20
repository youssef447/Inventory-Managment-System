import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../consumables/domain/entity/consumables_entity.dart';
import '../../../controller/request_consumable_controller.dart';
import '../../widgets/common/attachments/attachments_section.dart';

//Youssef Ashraf
///Represents The Mobile New Request Consumable Form Page
class MobileRequestConsumableFormPage
    extends GetView<RequestConsumableController> {
  final ConsumablesEntity model;
  const MobileRequestConsumableFormPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PopScope(
          onPopInvoked: (didPop) {
            controller.resetResources();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MobileCustomAppbar(
                    title:
                        '${'Request New'.tr} ${controller.requestAction.getName.tr}',
                  ),
                  verticalSpace(15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.asset(
                      model.image,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(15),
                  LabeledFormField(
                    controller: controller.reqIdController,
                    label: 'Request ID',
                  ),
                  verticalSpace(15),
                  LabeledFormField(
                    controller: controller.consumableNameController,
                    label: 'Consumable Name',
                  ),
                  verticalSpace(24),
                  LabeledFormField(
                    controller: controller.categoryController,
                    label: 'Category',
                  ),
                  verticalSpace(15),
                  LabeledFormField(
                    controller: controller.subCategoryController,
                    label: 'SubCategory',
                  ),
                  verticalSpace(24),
                  LabeledFormField(
                    controller: controller.consumableModelController,
                    label: 'Model',
                  ),
                  verticalSpace(15),
                  LabeledFormField(
                    controller: controller.brandController,
                    label: 'Brand',
                  ),
                  verticalSpace(24),
                  if (controller.requestAction ==
                      RequestActions.expiredConsumables)
                    LabeledFormField(
                      controller: controller.pickUpDateController,
                      label: 'Pick Up Date',
                      date: true,
                      hintText: 'Pick Up Date',
                    ),
                  if (controller.requestAction ==
                      RequestActions.returnConsumables)
                    LabeledFormField(
                      controller: controller.returnDateController,
                      label: 'Return Date',
                      hintText: 'Return Date',
                      date: true,
                    ),
                  if (controller.requestAction ==
                      RequestActions.requestConsumables)
                    Column(
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
                                    RequestPriorityTypes
                                        .values[index].getName.tr,
                                    style: AppTextStyles
                                        .font14SecondaryBlackCairoMedium,
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
                          hintText: 'Expected Delivery',
                          label: 'Expected Delivery',
                        ),
                        verticalSpace(24),
                        LabeledFormField(
                          controller: controller.expectedReturnController,
                          date: true,
                          label: 'Expected Return',
                          hintText: 'Expected Return',
                        ),
                      ],
                    ),
                  verticalSpace(24),
                  LabeledFormField(
                    controller: controller.additionalNotesController,
                    expands: true,
                    readOnly: false,
                    label: 'Additional Notes',
                    hintText: 'Additional Notes',
                  ),
                  verticalSpace(24),
                  const AttachmentsSection(),
                  verticalSpace(20),
                  GestureDetector(
                    onTap: () {
                      HapticFeedbackHelper.triggerHapticFeedback(
                        vibration: VibrateType.mediumImpact,
                        hapticFeedback: HapticFeedback.mediumImpact,
                      );
                    },
                    child: Container(
                      height: 40.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        'Submit for Approval'.tr,
                        style: AppTextStyles.font16BlackCairoMedium
                            .copyWith(color: AppColors.textButton),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
