import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../products/constants/ids.dart';
import '../../../../../../products/presentation/controller/products_controller.dart';
import '../../widget/mobile/mobile_assets_card.dart';

class MobileAssetsAdminPage extends StatelessWidget {
  const MobileAssetsAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
  return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
            child: AppCircleProgress(),
          )
              : controller.assets.isEmpty
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
                      Get.toNamed(
                          Routes.adminAssetDetails,
                          arguments: {
                            RouteArguments.asset: controller.assets[index],
                          }
                      );
                    },
                    child: MobileAssetsAdminCard(
                       index: index,
                    ),
                  );
                },
                itemCount: controller.assets.length,
              ),
            )
          ]);
        });
  }
}
