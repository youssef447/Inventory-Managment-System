import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/enums/requests_enums.dart';
import 'package:inventory_management/core/extensions/extensions.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';
import 'package:inventory_management/core/theme/app_text_styles.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../constants/inventory_categories.dart';
import '../../../../controller/requests_controller.dart';

class HorizontalRequstsSummary extends GetView<RequestsController> {
  const HorizontalRequstsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: AppColors.card, borderRadius: BorderRadius.circular(2.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          RequestStatusConstants.categories.length,
          (index) {
            return Row(
              children: [
                CircleAvatar(
                  radius: 17.r,
                  backgroundColor:
                      RequestStatusConstants.categories[index].getName.getColor,
                  child: SvgPicture.asset(
                    RequestStatusConstants.categories[index].getAsset,
                  ),
                ),
                horizontalSpace(10),
                Text(
                  RequestStatusConstants.categories[index].getName.tr,
                  style: AppTextStyles.font16MediumDarkGreyCairo,
                ),
                horizontalSpace(30),
                //count of current status
                Text(
                  '05',
                  style: AppTextStyles.font22BlackBoldCairo,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
