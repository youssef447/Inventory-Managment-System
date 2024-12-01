import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';

import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_font_weights.dart';

//Youssef Ashraf
///Represents The Invoice Summary in Tablet - Mobile Views
class InvoiceSummary extends StatelessWidget {
  const InvoiceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: SizedBox(
        width: 250.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total HT',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.secondaryBlack,
                        fontWeight: AppFontWeights.regular,
                      ),
                    ),
                    Text(
                      'Total Disbursements',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.secondaryBlack,
                        fontWeight: AppFontWeights.regular,
                      ),
                    ),
                    Text(
                      'Total VAT',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.secondaryBlack,
                        fontWeight: AppFontWeights.regular,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTimeHelper.formatMoneyDouble(3000),
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                    Text(
                      DateTimeHelper.formatMoneyDouble(3000),
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                    Text(
                      DateTimeHelper.formatMoneyDouble(3000),
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: AppColors.black,
                        fontWeight: AppFontWeights.medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: AppColors.inverseBase,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price'.tr,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
                Text(
                  DateTimeHelper.formatMoneyDouble(3000),
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    fontWeight: AppFontWeights.medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
