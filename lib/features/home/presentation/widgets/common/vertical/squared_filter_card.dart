import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/theme/app_colors.dart';

// Date: 8/8/2024
// By: Youssef Ashraf
// Last update: 8/8/2024
/// Objectives: This file is responsible for providing a default filter card widget that is used in the app.
class SquaredChipCard extends StatelessWidget {
  final String icon;
  final Color? color;
  final Color? borderColor;
  final void Function()? onTap;
  const SquaredChipCard({
    super.key,
    required this.icon,
    this.color,
    this.onTap,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37.h,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: context.isTablett ? 56.h : 40.h,
          width: context.isTablett ? 56.w : 40.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: SvgPicture.asset(
            icon,
            color: AppColors.icon,
            width: context.isTablett ? 23.w : 16.w,
            height: context.isTablett ? 23.h : 16.h,
          ),
        ),
      ),
    );
  }
}
