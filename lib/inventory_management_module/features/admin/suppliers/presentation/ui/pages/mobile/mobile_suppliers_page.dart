import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/business_type.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/suppliers_ids.dart';
import '../../../../domain/supplier_entity.dart';
import '../../../controller/supplier_form_controller.dart';
import '../../../controller/suppliers_controller.dart';
part '../../widgets/mobile/mobile_supplier_card.dart';

//Youssef Ashraf
///Represents The Suppliers Tab in Mobile View
class MobileSuppliersPage extends StatelessWidget {
  const MobileSuppliersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuppliersController>(
      id: SuppliersIds.suppliersPage,
      builder: (controller) {
        return controller.loading
            ? const SliverFillRemaining(
                child: AppCircleProgress(),
              )
            : controller.suppliers.isEmpty
                ? const SliverFillRemaining(
                    child: NoDataGif(),
                  )
                : SliverList.separated(
                    separatorBuilder: (_, __) => verticalSpace(16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.lazyPut(
                            () => SupplierFormController()
                              ..setSupplierData(controller.suppliers[index])
                              ..isEditable = false,
                          );

                          context.navigateTo(Routes.supplierForm, arguments: {
                            RouteArguments.supplier: controller.suppliers[index]
                          });
                        },
                        child: MobileSuppliersCard(
                          supplier: controller.suppliers[index],
                        ),
                      );
                    },
                    itemCount: controller.suppliers.length,
                  );
      },
    );
  }
}
