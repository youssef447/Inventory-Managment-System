import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../orders/domain/order_entity.dart';

//Youssef Ashraf
///Represents The Invoice Details Body in Tablet - Mobile Views
class InvoiceDetailsBody extends StatelessWidget {
  final OrderEntity order;

  const InvoiceDetailsBody({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.isTablett ? 200.w : null,
          decoration: BoxDecoration(
            color: AppTheme.isDark ?? false
                ? AppColors.background
                : const Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Date'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              verticalSpace(4),
              Text(
                DateTimeHelper.formatDate(
                  order.orderDate,
                ),
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.text,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(16),
              Text(
                'Expected Delivery'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              verticalSpace(4),
              Text(
                DateTimeHelper.formatDate(
                  order.expectedRecieved,
                ),
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.text,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(16),
              Text(
                'Recieved Date'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              verticalSpace(4),
              Text(
                DateTimeHelper.formatDate(
                  order.dateReturn,
                ),
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.text,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
            ],
          ),
        ),
        horizontalSpace(context.isTablett ? 28 : 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Supplier Details'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              verticalSpace(4),
              Text(
                order.productEntity[0].supplier.supplierName,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: AppColors.text,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(16),
              Text(
                ' ${order.productEntity[0].supplier.country}, ${order.productEntity[0].supplier.city}, ${order.productEntity[0].supplier.stateOrProvince}'
                    .tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              verticalSpace(4),
              Text(
                ' ${order.productEntity[0].supplier.phoneNumber} | ${order.productEntity[0].supplier.email}'
                    .tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.regular,
                ),
              ),
              DefaultRichText(
                label: 'Supplier ID',
                labelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.semiBold,
                ),
                value: order.productEntity[0].supplier.supplierId,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(4),
              DefaultRichText(
                label: 'Tax Number',
                labelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.semiBold,
                ),
                value: order.productEntity[0].supplier.taxNumber,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(24),
              Text(
                'Additonal Notes'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
              verticalSpace(4),
              Text(
                order.additionalNote ??
                    'loreammamamamamamammammamamammamamamammamamamamamammammaammamamamama',
                style: GoogleFonts.inter(
                  fontSize: context.isTablett ? 14.sp : 12.sp,
                  color: AppColors.text,
                  fontWeight: AppFontWeights.semiBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
