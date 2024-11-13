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
import '../../../../../Assets/domain/entity/assets_entity.dart';
import '../../../controller/request_assets_controller.dart';
import '../../widgets/attachments/attachments_section.dart';
part '../../widgets/tablet/request_form/discard_submit_buttons.dart';
part '../../widgets/tablet/request_actions_fields/request_asset_fields.dart';
part '../../widgets/tablet/request_actions_fields/repair_asset_fields.dart';
part '../../widgets/tablet/request_actions_fields/routine_maintenance_fields.dart';

class TabletRequestFormPage extends GetView<RequestAssetsController> {
  final AssetsEntity model;
  const TabletRequestFormPage({
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
                          'Request New Asset'.tr,
                          style: AppTextStyles.font24MediumBlackCairo,
                        ),
                      ],
                    ),
                    verticalSpace(15),
                    Image.asset(
                      model.image,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
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
                            controller: controller.assetNameController,
                            label: 'Asset Name',
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
                            controller: controller.assetModelController,
                            label: 'Asset Model',
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
                    if (controller.requestAction == RequestActions.requestAsset)
                      const TabletRequestAssetFields(),
                    if (controller.requestAction == RequestActions.repairAsset)
                      const TabletRepairAssetFields(),
                    if (controller.requestAction ==
                        RequestActions.routineMaintenance)
                      const TabletRoutineMaintenanceFields(),
                    if (controller.requestAction == RequestActions.returnAsset)
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
                    AttachmentsSection(
                      model: model,
                    ),
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
