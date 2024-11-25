part of '../../../pages/tablet/tablet_request_form_page.dart';

class DiscardSubmitButtons extends GetView<RequestConsumableController> {
  const DiscardSubmitButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            HapticFeedbackHelper.triggerHapticFeedback(
              vibration: VibrateType.mediumImpact,
              hapticFeedback: HapticFeedback.mediumImpact,
            );
            Navigator.of(context).pop();
            controller.resetResources();
          },
          child: Container(
            width: 175.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: const Color(0xffCCCCCC),
            ),
            child: Text(
              'Discard'.tr,
              style: AppTextStyles.font16BlackCairoMedium
                  .copyWith(color: AppColors.textButton),
            ),
          ),
        ),
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
    );
  }
}
