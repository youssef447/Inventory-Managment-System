part of '../../pages/tablet/tablet_invoice_details_page.dart';

class TabletInvoiceHeader extends StatelessWidget {
  final OrderEntity order;
  const TabletInvoiceHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.logo, height: 100.h, width: 128.w),
        horizontalSpace(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'Order Done By'.tr}: ',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
            verticalSpace(6),
            Text(
              '${order.user.firstName} ${order.user.lastName}',
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
            verticalSpace(6),
            DefaultRichText(
              label: 'Job Title',
              labelStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.medium,
              ),
              value: order.user.jobTitle,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.medium,
              ),
            ),
            verticalSpace(6),
            DefaultRichText(
              label: 'Department',
              labelStyle: AppTextStyles.font12SecondaryBlackCairoMedium,
              value: order.user.department.getName,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.medium,
              ),
            ),
            verticalSpace(6),
            DefaultRichText(
              label: 'Phone Number',
              labelStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.semiBold,
              ),
              value: order.user.phoneNumber,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
            verticalSpace(6),
            DefaultRichText(
              label: 'Email',
              labelStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.semiBold,
              ),
              value: order.user.email,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppColors.secondaryBlack,
                fontWeight: AppFontWeights.semiBold,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.field,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                child: Text(
                  order.orderId,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: AppColors.black,
                    fontWeight: AppFontWeights.semiBold,
                  ),
                ),
              ),
              verticalSpace(50),
              Text(
                'Total Amount'.tr,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: AppColors.secondaryBlack,
                  fontWeight: AppFontWeights.medium,
                ),
              ),
              verticalSpace(8),
              Text(
                '\$ ${DateTimeHelper.formatMoneyDouble(
                  order.totalAmount,
                )}',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: AppColors.black,
                  fontWeight: AppFontWeights.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
