import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../products/domain/product_entity.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/new_order_form_controller.dart';

class TabletNewOrderFormPage extends StatelessWidget {
  final List<ProductEntity> products;
  const TabletNewOrderFormPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<NewOrderFormController>(
            id: OrderIds.newOrderForm,
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12,
                ),
                child: SingleChildScrollView(child: Column()),
              );
            }),
      ),
    );
  }
}
