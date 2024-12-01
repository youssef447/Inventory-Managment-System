import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids.dart';
import '../../../controller/invoices_controller.dart';
import '../../widgets/common/invoice_page/invoice_card.dart';
import '../../widgets/common/invoice_page/search_filter.dart';

//Youssef Ashraf
///Represents The Invoices Page in Tablet View
class TabletInvoicesPage extends StatelessWidget {
  const TabletInvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 30.w : 16.w,
            vertical: 16.h,
          ),
          child: GetBuilder<InvoicesController>(
              id: InvoicesIds.invoicesPage,
              builder: (controller) {
                return controller.loading
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            titles: const ['Invoices'],
                            titleNavigations: [
                              () => Navigator.of(context).pop(),
                            ],
                          ),
                          const Expanded(
                            child: AppCircleProgress(),
                          ),
                        ],
                      )
                    : controller.invoices.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(16),
                              CustomAppBar(
                                titles: const ['Invoices'],
                                titleNavigations: [
                                  () => Navigator.of(context).pop(),
                                ],
                              ),
                              const Expanded(
                                child: NoDataGif(),
                              ),
                            ],
                          )
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomAppBar(
                                  titles: const ['Invoices'],
                                  titleNavigations: [
                                    () => Navigator.of(context).pop(),
                                  ],
                                ),
                                verticalSpace(12),
                                const InvoicesSearchFilter(),
                                verticalSpace(12),
                                StaggeredGrid.count(
                                  crossAxisCount: Get.width > 1200 ? 3 : 2,
                                  mainAxisSpacing: 15.h,
                                  crossAxisSpacing:
                                      context.isLandscapee ? 20.w : 16.w,
                                  children: List.generate(
                                    controller.invoices.length,
                                    (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.navigateTo(
                                              Routes.invoiceDetails,
                                              arguments: {
                                                RouteArguments.invoice:
                                                    controller.invoices[index],
                                              });
                                        },
                                        child: InvoiceCard(
                                          invoice: controller.invoices[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                verticalSpace(12),
                              ],
                            ),
                          );
              }),
        ),
      ),
    );
  }
}
