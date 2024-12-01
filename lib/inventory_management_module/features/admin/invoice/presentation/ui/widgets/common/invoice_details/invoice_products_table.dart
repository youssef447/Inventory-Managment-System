import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/theme/app_theme.dart';

//Youssef Ashraf
///Represents The Invoice Products Table in Tablet - Mobile Views
class InvoiceProductsTable extends StatelessWidget {
  const InvoiceProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizeAnimation(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            topRight: Radius.circular(8.r),
          ),
          child: DataTable(
            border: TableBorder(
              horizontalInside: BorderSide(
                width: 0,
                color: AppTheme.isDark ?? false
                    ? const Color(0xFF000000)
                    : AppColors.card,
              ),
            ),
            // columnSpacing: 45.w, //columnSpacing,
            headingRowColor: WidgetStatePropertyAll(AppColors.header),
            dataRowMinHeight: 46.h,
            dataRowMaxHeight: 46.h,
            headingRowHeight: 46.h,
            horizontalMargin: context.isLandscapee ? 29.w : 16.w,
            dividerThickness: 0,
            showCheckboxColumn: false,
            columns: ['1']
                .map(
                  (element) => DataColumn(
                    label: Text(
                      element.tr,
                      style: AppTextStyles.font16WhiteRegularCairo,
                    ),
                  ),
                )
                .toList(),
            rows: List.generate(
              1, //  controller.requestsOfConsumables.length,
              (index) => DataRow(
                  color: WidgetStatePropertyAll(
                    index % 2 == 0
                        ? AppColors.evenRowColor
                        : AppColors.oddRowColor,
                  ),
                  cells: [
                    DataCell(
                      Text(
                        '',
                        style: AppTextStyles.font16BlackRegularCairo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
