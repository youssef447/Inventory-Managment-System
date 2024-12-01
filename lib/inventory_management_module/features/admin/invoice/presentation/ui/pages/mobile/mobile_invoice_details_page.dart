import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/enums/departments.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';

import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../orders/domain/order_entity.dart';
import '../../widgets/common/dialogs/send_invoice_dialog.dart';
import '../../widgets/common/invoice_details/invoice_details_body.dart';
import '../../widgets/common/invoice_details/invoice_products_table.dart';
import '../../widgets/common/invoice_details/invoice_summary.dart';
part '../../widgets/mobile/mobile_invoice_header.dart';

//Youssef Ashraf
///Represents The Invoice Details Page in Mobile
class MobileInvoiceDetailsPage extends StatelessWidget {
  final OrderEntity invoice;
  const MobileInvoiceDetailsPage({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MobileCustomAppbar(
                  title: 'Invoice Details',
                ),
                verticalSpace(20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.w,
                    vertical: 9.h,
                  ),
                  child: Column(
                    children: [
                      MobiletInvoiceHeader(
                        order: invoice,
                      ),
                      verticalSpace(30),
                      InvoiceDetailsBody(
                        order: invoice,
                      ),
                      verticalSpace(30),
                      InvoiceProductsTable(products: invoice.productEntity),
                      verticalSpace(20),
                      const InvoiceSummary(),
                      verticalSpace(30),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: RectangledFilterCard(
                          width: 145.w,
                          image: AppAssets.send,
                          text: 'Send Invoice'.tr,
                          color: AppColors.primary,
                          onTap: () {
                            GetDialogHelper.generalDialog(
                              child: const SendInvoiceDialog(),
                              context: context,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
