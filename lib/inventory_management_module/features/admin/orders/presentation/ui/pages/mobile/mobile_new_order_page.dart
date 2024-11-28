import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../../../products/domain/product_entity.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/new_order_contrller.dart';
part '../../widgets/mobile/new_order/mobile_product_card.dart';
part '../../widgets/mobile/new_order/products_search_filrer.dart';

class MobileNewOrderPage extends StatelessWidget {
  const MobileNewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<NewOrderController>(
            id: OrderIds.newOrderPage,
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12,
                ),
                child: CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                    child: MobileCustomAppbar(
                      title: 'New Order',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(12),
                  ),
                  controller.loading
                      ? const SliverFillRemaining(
                          child: AppCircleProgress(),
                        )
                      : controller.availableProducts.isEmpty
                          ? const SliverFillRemaining(child: NoDataGif())
                          : SliverMainAxisGroup(
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: RectangledFilterCard(
                                      color: AppColors.primary,
                                      text: 'New Product',
                                      width: 142.w,
                                      image: AppAssets.add,
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: verticalSpace(12),
                                ),
                                SliverToBoxAdapter(
                                  child: Text(
                                    'Product Information'.tr,
                                    style: AppTextStyles.font14BlackCairoMedium,
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: verticalSpace(6),
                                ),
                                const SliverToBoxAdapter(
                                  child: MobileProductSearchFilter(),
                                ),
                                SliverToBoxAdapter(
                                  child: verticalSpace(12),
                                ),
                                SliverList.separated(
                                  separatorBuilder: (_, __) =>
                                      verticalSpace(16),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        /*    context.navigateTo(Routes.productDetails,
                                            arguments: {
                                              RouteArguments.product:
                                                  controller.products[index],
                                            }); */
                                      },
                                      child: MobileProductCard(
                                        checked:
                                            controller.selectedProducts[index],
                                        onCheckBoxChanged: (value) {
                                          controller.selectOrderProduct(
                                              index, value ?? false);
                                        },
                                        product:
                                            controller.availableProducts[index],
                                      ),
                                    );
                                  },
                                  itemCount:
                                      controller.availableProducts.length,
                                ),
                                if (controller.selectedProducts.any(
                                  (element) => element,
                                ))
                                  SliverToBoxAdapter(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 12.h),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: RectangledFilterCard(
                                          width: 145.w,
                                          text: 'Next'.tr,
                                          color: AppColors.primary,
                                          onTap: () {
                                            context.navigateTo(
                                                Routes.newOrderForm,
                                                arguments: {
                                                  RouteArguments.product:
                                                      controller
                                                          .getSelectedProducts(),
                                                });
                                          },
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                ]),
              );
            }),
      ),
    );
  }
}
