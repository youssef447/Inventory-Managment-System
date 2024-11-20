// Date: 7/11/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for building a common custom app bar between several pages.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';

import '../../constants/app_assets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  final List<String>? titles;
  final List<Function()>? titleNavigations;

  const CustomAppBar({
    super.key,
    this.titles,
    this.titleNavigations,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablett;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 8.w),
          child: titles == null
              ? Text(
                  'Inventory Management'.tr,
                  style: isTablet
                      ? AppTextStyles.font28BlackSemiBoldCairo
                      : AppTextStyles.font26BlackSemiBoldCairo,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.until(
                          (route) => route.isFirst,
                        );
                      },
                      child: Text(
                        'Inventory Management'.tr,
                        style: isTablet
                            ? AppTextStyles.font28BlackSemiBoldCairo
                            : AppTextStyles.font26BlackSemiBoldCairo,
                      ),
                    ),
                    horizontalSpace(8),
                    SvgPicture.asset(
                      context.isArabic
                          ? AppAssets.arrowBack
                          : AppAssets.arrowForward,
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.text,
                    ),
                  ],
                ),
        ),
        if (titles != null)
          ...List.generate(
            titles!.length,
            (index) {
              if (index == titles!.length - 1) {
                return Text(
                  titles![index].tr,
                  style: isTablet
                      ? AppTextStyles.font28BlackSemiBoldCairo
                      : AppTextStyles.font26BlackSemiBoldCairo,
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: titleNavigations?[index],
                      child: Text(
                        titles![index].tr,
                        style: isTablet
                            ? AppTextStyles.font28BlackSemiBoldCairo
                            : AppTextStyles.font26BlackSemiBoldCairo,
                      ),
                    ),
                    horizontalSpace(8),
                    SvgPicture.asset(
                      context.isArabic
                          ? AppAssets.arrowBack
                          : AppAssets.arrowForward,
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.text,
                    ),
                    horizontalSpace(8),
                  ],
                );
              }
            },
          ),
      ],
    );
  }
}
