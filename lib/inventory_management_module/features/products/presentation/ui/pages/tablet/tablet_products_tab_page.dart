import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../../../../../core/enums/stock_enums.dart';
import '../../../../../../core/extensions/extensions.dart';

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
part '../../widgets/tablet/product/tablet_product_card.dart';

class TabletProductsTabPage extends GetView<ProductsController> {
  const TabletProductsTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const Expanded(
                  child: AppCircleProgress(),
                )
              : controller.products.isEmpty
                  ? const Expanded(
                      child: NoDataGif(),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            verticalSpace(21),
                            StaggeredGrid.count(
                              crossAxisCount: Get.width > 1200 ? 3 : 2,
                              mainAxisSpacing: 15.h,
                              crossAxisSpacing:
                                  context.isLandscapee ? 20.w : 16.w,
                              children: List.generate(
                                controller.products.length,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.navigateTo(Routes.productDetails,
                                          arguments: {
                                            RouteArguments.product:
                                                controller.products[index],
                                          });
                                    },
                                    child: TabletProductCard(
                                      product: controller.products[index],
                                      isConsumable: controller
                                              .products[index].productType ==
                                          ProductType.consumable,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
        });
  }
}
