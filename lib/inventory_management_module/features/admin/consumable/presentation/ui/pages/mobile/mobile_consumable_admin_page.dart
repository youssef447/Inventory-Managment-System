import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../../../..//core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../products/constants/ids.dart';
import '../../../../../../products/presentation/controller/products_controller.dart';
import '../../widget/mobile/mobile_consumable_admin_card.dart';

class MobileConsumableAdminPage extends StatelessWidget {
  const MobileConsumableAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.consumables.isEmpty
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
                                context.navigateTo(
                                    Routes.adminConsumablesDetails,
                                    arguments: {
                                      RouteArguments.consumables:
                                          controller.consumables[index],
                                    });
                              },
                              child: MobileConsumableAdminCard(
                                index: index,
                              ),
                            );
                          },
                          itemCount: controller.consumables.length,
                        ),
                      )
                    ]);
        });
  }
}
