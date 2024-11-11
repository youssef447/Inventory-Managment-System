// Date: 2/10/2024
// By: Nada Mohammed , Youssef Ashraf
// Last update: 2/10/2024

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
              borderRadius: BorderRadius.circular(4.r),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  image == null
                      ? Expanded(child: _buildDropdownText())
                      : Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                image!,
                                color: AppColors.icon,
                              ),
                              horizontalSpace(5),
                              Flexible(
                                child: _buildDropdownText(),
                              ),
                            ],
                          ),
                        ),
                  customSpacing ?? const SizedBox(),
                  showDropdownIcon
                      ? SvgPicture.asset(
                          AppAssets.arrowDown,
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
            hintText ?? 'Choose here'.tr,
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
      textButton ?? hintText ?? 'Choose here'.tr,
      style: value != null
          ? AppTextStyles.font14BlackCairoRegular.copyWith(color: textColor)
          : (style ?? AppTextStyles.font14SecondaryBlackCairoRegular),
      overflow: TextOverflow.ellipsis,
    );
  }
}
