import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../Assets/domain/entity/assets_entity.dart';
import '../../../controller/request_assets_controller.dart';
import '../../widgets/common/attachments/attachments_section.dart';
part '../../widgets/mobile/request_action_fields/repair_asset_fields.dart';
part '../../widgets/mobile/request_action_fields/request_asset_fields.dart';
part '../../widgets/mobile/request_action_fields/routine_maintenance_fields.dart';

class MobileRequestFormPage extends GetView<RequestAssetsController> {
  final AssetsEntity model;
  final RequestActions requestAction;
  const MobileRequestFormPage({
    super.key,
    required this.model,
    required this.requestAction,
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
                      title: '${'Request New'.tr} ${requestAction.getName.tr}'),
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
                    controller: controller.assetNameController,
                    label: 'Asset Name',
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
                    controller: controller.assetModelController,
                    label: 'Model',
                  ),
                  verticalSpace(15),
                  LabeledFormField(
                    controller: controller.brandController,
                    label: 'Brand',
                  ),
                  verticalSpace(24),
                  if (requestAction == RequestActions.requestAsset)
                    const MobileRequestAssetFields(),
                  if (requestAction == RequestActions.repairAsset)
                    const MobileRepairAssetFields(),
                  if (requestAction == RequestActions.routineMaintenance)
                    const MobileRotuineMaintenanceAssetFields(),
                  if (requestAction == RequestActions.returnAsset)
                    LabeledFormField(
                      controller: controller.returnDateController,
                      label: 'Return Date',
                      hintText: 'Return Date',
                      date: true,
                    ),
                  verticalSpace(24),
                  LabeledFormField(
                    controller: controller.additionalNotesController,
                    expands: true,
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
                      Navigator.pop(context);

                      controller.submitForApproval();
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
