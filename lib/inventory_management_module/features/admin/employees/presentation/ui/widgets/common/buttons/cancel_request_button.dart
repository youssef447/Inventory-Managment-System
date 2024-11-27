import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../../employee/track_request/presentation/ui/widgets/common/dialogs/reason_of_rejection_dialog.dart';
import '../../../../controller/employee_details_controller.dart';

class CancelRequestButton extends GetView<EmployeeDetailsController> {
  final String requestId;
  const CancelRequestButton({
    super.key,
    required this.requestId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedbackHelper.triggerHapticFeedback(
          vibration: VibrateType.mediumImpact,
          hapticFeedback: HapticFeedback.mediumImpact,
        );
        GetDialogHelper.generalDialog(
          context: context,
          child: DefaultDialog(
            width: context.isPhone ? 343.w : 411.w,
            showButtons: true,
            icon: AppAssets.canceled,
            title: 'Cancelation Request'.tr,
            subTitle: 'Are You sure You Want to Cancel this Request ?'.tr,
            onConfirm: () {
              Navigator.of(context).pop();
              GetDialogHelper.generalDialog(
                context: context,
                child: ReasonOfRejectionDialog(requestId: requestId),
              );
            },
          ),
        );
      },
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.red,
          ),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.red,
              radius: 12.r,
              child: SvgPicture.asset(
                AppAssets.canceled,
                width: 11.w,
                height: 11.h,
              ),
            ),
            horizontalSpace(8),
            Text(
              'Cancelation'.tr,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: AppFontWeights.medium,
                color: AppColors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
