import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management/core/theme/app_font_weights.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../controller/track_requests_controller.dart';

class CancelRequestButton extends GetView<TrackRequestController> {
  const CancelRequestButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
