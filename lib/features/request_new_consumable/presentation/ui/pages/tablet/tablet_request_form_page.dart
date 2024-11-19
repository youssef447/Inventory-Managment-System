import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../../core/animations/up_down_animation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../consumables/domain/entity/consumables_entity.dart';
import '../../../controller/request_consumable_controller.dart';
import '../../widgets/common/attachments/attachments_section.dart';
part '../../widgets/tablet/request_form/discard_submit_buttons.dart';
part '../../widgets/tablet/request_actions_fields/request_consumable_fields.dart';
part '../../widgets/tablet/request_actions_fields/expiry_consumable_fields.dart';

class TabletRequestConsumableFormPage
    extends GetView<RequestConsumableController> {
  final ConsumablesEntity model;
  const TabletRequestConsumableFormPage({
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
          child: UpDownAnimation(
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
                          child: SvgPicture.asset(
                            context.isArabic
                                ? AppAssets.arrowForward
                                : AppAssets.arrowBack,
                            color: AppColors.text,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                        horizontalSpace(8),
                        Text(
                          '${'Request New'.tr} ${controller.requestAction.getName.tr}'
                              .tr,
                          style: AppTextStyles.font24MediumBlackCairo,
                        ),
                      ],
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
                    Row(
                      children: [
                        Expanded(
                          child: LabeledFormField(
                            controller: controller.reqIdController,
                            label: 'Request ID',
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            controller: controller.consumableNameController,
                            label: 'Consumable Name',
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
                            label: 'Category',
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            controller: controller.subCategoryController,
                            label: 'SubCategory',
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    Row(
                      children: [
                        Expanded(
                          child: LabeledFormField(
                            controller: controller.consumableModelController,
                            label: 'Model',
                          ),
                        ),
                        horizontalSpace(15),
                        Expanded(
                          child: LabeledFormField(
                            controller: controller.brandController,
                            label: 'Brand',
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(24),
                    if (controller.requestAction ==
                        RequestActions.requestConsumables)
                      const TabletRequestConsumableFields(),
                    if (controller.requestAction ==
                        RequestActions.expiredConsumables)
                      const TabletExpiryConsumableFields(),
                    if (controller.requestAction ==
                        RequestActions.returnConsumables)
                      Row(
                        children: [
                          Expanded(
                            child: LabeledFormField(
                              controller: controller.returnDateController,
                              readOnly: false,
                              date: true,
                              label: 'Return Date',
                              hintText: 'Return Date',
                            ),
                          ),
                          horizontalSpace(15),
                          const Spacer(),
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
                    verticalSpace(66),
                    const DiscardSubmitButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
