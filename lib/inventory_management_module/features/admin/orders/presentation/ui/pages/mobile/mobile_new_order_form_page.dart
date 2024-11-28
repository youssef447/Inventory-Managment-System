import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';

import '../../../../../../../core/enums/currencies.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../../products/domain/product_entity.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/new_order_form_controller.dart';
part '../../widgets/mobile/new_order_form/product_details_card.dart';
part '../../widgets/mobile/new_order_form/product_order_form.dart';

class MobileNewOrderFormPage extends StatelessWidget {
  final List<ProductEntity> products;
  const MobileNewOrderFormPage({super.key, required this.products});

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
          child: Column(
            children: List.generate(
              products.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: index == products.length - 1 ? 0 : 30.h),
                );
              },
            ),
          ),
        ),
      )),
    );
  }
}
