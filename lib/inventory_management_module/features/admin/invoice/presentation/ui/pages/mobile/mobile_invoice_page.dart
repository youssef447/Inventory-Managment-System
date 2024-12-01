import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids.dart';
import '../../../controller/invoices_controller.dart';
import '../../widgets/common/invoice_page/invoice_card.dart';
import '../../widgets/common/invoice_page/search_filter.dart';
//Youssef Ashraf
///Represents The Invoices Page in Mobile View

class MobileInvoicesPage extends StatelessWidget {
  const MobileInvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: GetBuilder<InvoicesController>(
              id: InvoicesIds.invoicesPage,
              builder: (controller) {
                return CustomScrollView(
                  slivers: [
                    controller.loading
                        ? const SliverFillRemaining(
                            child: AppCircleProgress(),
                          )
                        : controller.invoices.isEmpty
                            ? SliverFillRemaining(
                                child: Column(
                                  children: [
                                    MobileCustomAppbar(
                                      title: 'Invoices'.tr,
                                    ),
                                    const Expanded(child: NoDataGif()),
                                  ],
                                ),
                              )
                            : SliverMainAxisGroup(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: MobileCustomAppbar(
                                      title: 'Invoices'.tr,
                                    ),
                                  ),
                                  SliverToBoxAdapter(child: verticalSpace(12)),
                                  const SliverToBoxAdapter(
                                    child: InvoicesSearchFilter(),
                                  ),
                                  SliverToBoxAdapter(child: verticalSpace(12)),
                                  SliverPadding(
                                    padding: EdgeInsets.only(
                                      bottom: 12.h,
                                    ),
                                    sliver: SliverList.separated(
                                      separatorBuilder: (_, __) =>
                                          verticalSpace(16),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            context.navigateTo(
                                                Routes.invoiceDetails,
                                                arguments: {
                                                  RouteArguments.invoice:
                                                      controller
                                                          .invoices[index],
                                                });
                                          },
                                          child: InvoiceCard(
                                            invoice: controller.invoices[index],
                                          ),
                                        );
                                      },
                                      itemCount: controller.invoices.length,
                                    ),
                                  ),
                                ],
                              ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
