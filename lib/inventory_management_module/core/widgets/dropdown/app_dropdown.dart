// Date: 2/10/2024
// By: Nada Mohammed , Youssef Ashraf
// Last update: 2/10/2024

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/extensions/extensions.dart';

import '../../constants/app_assets.dart';
import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.onChanged,
    required this.items,
    required this.textButton,
    this.hintText,
    this.value,
    this.color,
    this.customSpacing,
    this.menuWidth,
    this.width,
    this.height,
    this.textColor,
    this.style,
    this.textAlign,
    this.image,
    this.iconColor,
    this.splashColorOn = true,
    this.showDropdownIcon = true,
  });

  final Function(dynamic) onChanged;
  final List<DropdownMenuItem> items;
  final String? textButton;
  final String? hintText;
  final dynamic value;
  final Color? color;
  final TextStyle? style;
  final Widget? customSpacing;
  final bool splashColorOn;
  final bool showDropdownIcon;
  final Color? textColor;
  final double? height, width, menuWidth;
  final TextAlign? textAlign;
  final String? image;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: splashColorOn ? AppColors.primary : Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          customButton: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: color ?? AppColors.field,
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Row(
                mainAxisAlignment: image != null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  image == null
                      ? width != null
                          ? Flexible(child: _buildDropdownText())
                          : _buildDropdownText()
                      : textButton == null
                          ? SvgPicture.asset(
                              image!,
                              color: iconColor ?? AppColors.icon,
                              width: 24.w,
                              height: 24.h,
                            )
                          : Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: SvgPicture.asset(
                                      image!,
                                      color: iconColor ?? AppColors.icon,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ),
                                  horizontalSpace(5),
                                  Flexible(
                                      flex: 2, child: _buildDropdownText()),
                                ],
                              ),
                            ),
                  customSpacing ?? const SizedBox(),
                  showDropdownIcon
                      ? Row(
                          children: [
                            if (width == null)
                              horizontalSpace(!context.isTablett ? 8.w : 16.w),
                            SvgPicture.asset(
                              AppAssets.arrowDown,
                              color: color == AppColors.primary
                                  ? AppColors.icon
                                  : AppColors.text,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
          value: value,
          dropdownStyleData: DropdownStyleData(
            width: menuWidth,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.card,
            ),
          ),
          hint: Text(
            hintText ?? (textButton == null ? '' : 'Choose here'.tr),
            style: AppTextStyles.font14BlackCairoMedium,
            overflow: TextOverflow.ellipsis,
          ),
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Text _buildDropdownText() {
    return Text(
      textAlign: textAlign,
      textButton ?? hintText ?? '',
      maxLines: 1,
      style: style ??
          (value != null || textButton != null
              ? AppTextStyles.font14BlackCairoRegular.copyWith(color: textColor)
              : (style ?? AppTextStyles.font14SecondaryBlackCairoRegular)),
      overflow: TextOverflow.ellipsis,
    );
  }
}
