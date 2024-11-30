import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../constants/suppliers_ids.dart';
import '../../../../domain/supplier_entity.dart';
import '../../../controller/supplier_form_controller.dart';
part '../../widgets/mobile/mobile_supplier_form.dart';

//Youssef Ashraf
///Represents The Suppliers Form Page in Mobile View
class MobileSupplierFormPage extends StatelessWidget {
  final SupplierEntity? supplier;

  const MobileSupplierFormPage({super.key, this.supplier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12,
          ),
          child: SingleChildScrollView(
              child: Column(children: [
            MobileCustomAppbar(
              title: 'Order Form'.tr,
            ),
            verticalSpace(12),
            GetBuilder<SupplierFormController>(
                id: SuppliersIds.supplierForm,
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Create Automatic IDs'.tr,
                            style: AppTextStyles.font14BlackCairoMedium,
                          ),
                          DefaultSwitchButton(
                              value: controller.automaticIds,
                              onChanged: (v) {
                                controller.toggleAutomaticIds(
                                  v,
                                );
                              })
                        ],
                      ),
                      verticalSpace(11),
                      const MobileSupplierForm(),
                    ],
                  );
                }),
            verticalSpace(8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: RectangledFilterCard(
                width: 145.w,
                text: 'Submit'.tr,
                color: AppColors.primary,
                onTap: () {},
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
