import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/enums/stock_enums.dart';

import '../../../../../../core/animations/size_animation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/route_arguments.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids.dart';
import '../../../../domain/product_entity.dart';
import '../../../../enums/product_enums.dart';
import '../../../controller/products_controller.dart';
part '../../widgets/mobile/product/mobile_product_card.dart';

class MobileProductsTabPage extends StatelessWidget {
  const MobileProductsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.products.isEmpty
                  ? const SliverFillRemaining(
                      child: NoDataGif(),
                    )
                  : SliverMainAxisGroup(slivers: [
                      SliverToBoxAdapter(child: verticalSpace(10)),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          bottom: 12.h,
                        ),
                        sliver: SliverList.separated(
                          separatorBuilder: (_, __) => verticalSpace(16),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.navigateTo(Routes.productDetails,
                                    arguments: {
                                      RouteArguments.product:
                                          controller.products[index],
                                    });
                              },
                              child: MobileProductCard(
                                product: controller.products[index],
                                isConsumable:
                                    controller.products[index].productType ==
                                        ProductType.consumable,
                              ),
                            );
                          },
                          itemCount: controller.products.length,
                        ),
                      )
                    ]);
        });
  }
}
