import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../products/domain/product_entity.dart';
import '../../../../../../../products/enums/product_enums.dart';
import '../../../../controller/invoices_controller.dart';

//Youssef Ashraf
///Represents The Invoice Products Table in Tablet - Mobile Views
class InvoiceProductsTable extends GetView<InvoicesController> {
  final List<ProductEntity> products;

  const InvoiceProductsTable({super.key, required this.products});

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
            showBottomBorder: true,
            border: TableBorder(
              horizontalInside: BorderSide(
                width: 1,
                color: AppTheme.isDark ?? false
                    ? const Color(0xFF000000)
                    : AppColors.card,
              ),
            ),
            // columnSpacing: 45.w, //columnSpacing,
            headingRowColor: WidgetStatePropertyAll(
              AppTheme.isDark ?? false
                  ? AppColors.background
                  : const Color(0xffFAFAFA),
            ),
            dataRowMinHeight: 46.h,
            dataRowMaxHeight: 46.h,
            headingRowHeight: 46.h,
            horizontalMargin: context.isLandscapee ? 29.w : 16.w,
            dividerThickness: 0,
            showCheckboxColumn: false,
            columns: controller.invoiceTableHeaders
                .map(
                  (element) => DataColumn(
                    label: Text(
                      element.tr,
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.secondaryBlack,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                  ),
                )
                .toList(),
            rows: List.generate(
              products.length,
              (index) => DataRow(
                  color: const WidgetStatePropertyAll(
                    Colors.transparent,
                  ),
                  cells: [
                    DataCell(
                      Text(
                        DateTimeHelper.formatInt(index + 1),
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.text,
                          fontWeight: AppFontWeights.medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataCell(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].productType == ProductType.asset
                                ? products[index].assetEntity!.assetName
                                : products[index].consumablesEntity!.name,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.text,
                              fontWeight: AppFontWeights.medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            products[index].description,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.secondaryBlack,
                              fontWeight: AppFontWeights.medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateTimeHelper.formatInt(
                              products[index].totalQuantity,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.text,
                              fontWeight: AppFontWeights.medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Unit(s)'.tr,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              color: AppColors.secondaryBlack,
                              fontWeight: AppFontWeights.medium,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    DataCell(
                      Text(
                        DateTimeHelper.formatDouble(products[index].unitCost),
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.text,
                          fontWeight: AppFontWeights.medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataCell(
                      Text(
                        DateTimeHelper.formatDouble(products[index].vat),
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.text,
                          fontWeight: AppFontWeights.medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataCell(
                      Text(
                        DateTimeHelper.formatDouble(products[index].amount),
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.text,
                          fontWeight: AppFontWeights.medium,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataCell(
                      Text(
                        DateTimeHelper.formatDouble(
                            products[index].finalAmount),
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: AppColors.text,
                          fontWeight: AppFontWeights.medium,
                        ),
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
