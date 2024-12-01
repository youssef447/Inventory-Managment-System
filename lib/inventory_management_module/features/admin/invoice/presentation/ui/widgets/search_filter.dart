import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../..//core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../..//features/employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../../../core/enums/sort_options.dart';
import '../../../../../../core/extensions/extensions.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../../../core/widgets/fields/app_form_field.dart';
import '../../controller/invoices_controller.dart';

///Youssef Ashraf

///Represents The Invoices Search Filter in Tablet - Mobile Views
class InvoicesSearchFilter extends GetView<InvoicesController> {
  const InvoicesSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: SizedBox(
              height: 37.h,
              child: AppTextFormField(
                backGroundColor: AppTheme.isDark ?? false
                    ? AppColors.field
                    : AppColors.white,
                maxLines: 1,
                hintText: 'Search Here...'.tr,
                collapsed: true,
                hintStyle: AppTextStyles.font16SecondaryBlackCairoMedium,
                controller: controller.searchController,
                onChanged: (value) {},
                contentPadding: context.isTablett
                    ? EdgeInsets.symmetric(
                        vertical: 2.h,
                      )
                    : null,
                prefixIcon: SvgPicture.asset(
                  AppAssets.search,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ),
        ),
        horizontalSpace(10),
        if (context.isTablett)
          RectangledFilterCard(
            text: 'Filter',
            onTap: () {},
            color: AppColors.card,
            image: AppAssets.filter,
          ),
        if (!context.isTablett)
          SquaredChipCard(
            onTap: () {},
            color: AppColors.card,
            icon: AppAssets.filter,
          ),
        horizontalSpace(9),
        AppDropdown(
          showDropdownIcon: false,
          iconColor: AppColors.black,
          width: context.isLandscapee ? 100.w : 55.w,
          image: AppAssets.sort,
          style: AppTextStyles.font14BlackRegularCairo,
          color: AppColors.card,
          height: 40.h,
          onChanged: (value) {},
          items: List.generate(
            MinimumMaximumSortOptions.values.length,
            (index) {
              return DropdownMenuItem(
                alignment: AlignmentDirectional.centerStart,
                value: MinimumMaximumSortOptions.values[index],
                child: Text(
                  SortOptions.values[index].getName.tr,
                  style: AppTextStyles.font14SecondaryBlackCairoMedium,
                ),
              );
            },
          ),
          textButton: context.isLandscapee ? 'Sort'.tr : null,
        )
      ],
    );
  }
}
