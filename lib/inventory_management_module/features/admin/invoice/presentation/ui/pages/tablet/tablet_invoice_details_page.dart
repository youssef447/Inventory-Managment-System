import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../orders/domain/order_entity.dart';
import '../../widgets/common/invoice_details/invoice_details_body.dart';
import '../../widgets/common/invoice_details/invoice_products_table.dart';
part '../../widgets/tablet/tablet_invoice_header.dart';

//Youssef Ashraf
///Represents The Invoice Details Page in Tablet
class TabletInvoiceDetailsPage extends StatelessWidget {
  final OrderEntity invoice;
  const TabletInvoiceDetailsPage({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 51.w : 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MobileCustomAppbar(
                title: 'Invoice Details',
              ),
              verticalSpace(36),
              Container(
                //   width: context.isLandscapee ? 754.w : 654.w,
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 32.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabletInvoiceHeader(order: invoice),
                    verticalSpace(32),
                    InvoiceDetailsBody(order: invoice),
                    verticalSpace(32),
                    InvoiceProductsTable(products: invoice.productEntity)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
