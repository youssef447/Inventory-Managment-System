import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../Assets/domain/entity/assets_entity.dart';
import '../../../controller/request_assets_controller.dart';
import '../../widgets/attachments/attachments_section.dart';

class MobileRequestNewAssetPage extends GetView<RequestAssetsController> {
  final AssetsEntity model;
  const MobileRequestNewAssetPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          onPopInvoked: (didPop) {
            controller.resetResources();
          },
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
                      style: AppTextStyles.font16BlackMediumCairo,
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
                LabeledFormField(
                  controller: controller.reqIdController,
                  label: 'Request ID',
                ),
                verticalSpace(16),
                AttachmentsSection(
                  model: model,
                ),
                verticalSpace(16),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedbackHelper.triggerHapticFeedback(
                        vibration: VibrateType.mediumImpact,
                        hapticFeedback: HapticFeedback.mediumImpact,
                      );
                    },
                    child: Container(
                      height: 35.h,
                      width: context.isTablett ? 69.h : double.infinity,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
