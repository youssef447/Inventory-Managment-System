import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../animations/size_animation.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';

//Youssef Ashraf
///Default Table Style
class DefaultDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final double? columnSpacing;
  const DefaultDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.columnSpacing,
  });

  @override
  Widget build(BuildContext context) {
    var isLandScape = context.isLandscape;

    return SizeAnimation(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
              horizontalMargin: isLandScape ? 29.w : 16.w,
              dividerThickness: 0,
              showCheckboxColumn: false,
              columns: columns,
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }
}
