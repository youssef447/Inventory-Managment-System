import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/enums/stock_enums.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../../core/widgets/attachments/attachment_card.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../../products/domain/product_entity.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/new_order_contrller.dart';
import '../../../controller/new_order_form_controller.dart';
part '../../widgets/mobile/new_order_form/product_details_card.dart';
part '../../widgets/mobile/new_order_form/product_order_form.dart';

class MobileNewOrderFormPage extends GetView<NewOrderFormController> {
  final List<ProductEntity> products;
  const MobileNewOrderFormPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Get.find<NewOrderController>().resetSelectedProducts();
      },
      child: Scaffold(
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
              ...List.generate(
                products.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index == products.length - 1 ? 0 : 30.h,
                    ),
                    child: Column(
                      children: [
                        MobileProductDetailsCard(product: products[index]),
                        verticalSpace(45),
                        GetBuilder<NewOrderFormController>(
                            id: OrderIds.newOrderForm,
                            builder: (controller) {
                              return Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    'Create Automatic IDs'.tr,
                                    style: AppTextStyles.font14BlackCairoMedium,
                                  ),
                                  DefaultSwitchButton(
                                      value:
                                          controller.createAutomaticIDs[index],
                                      onChanged: (v) {
                                        controller.toggleAutomaticIds(v, index);
                                      })
                                ],
                              );
                            }),
                        GetBuilder<NewOrderFormController>(
                            id: OrderIds.newOrderForm,
                            builder: (controller) {
                              return Column(
                                children: [
                                  controller.hideForm[index]
                                      ? Align(
                                          alignment:
                                              AlignmentDirectional.centerEnd,
                                          child: GestureDetector(
                                            onTap: () => controller
                                                .hideProductDetailsCard(index),
                                            child: Text(
                                              controller.hideForm[index]
                                                  ? 'Expand'.tr
                                                  : 'Hide'.tr,
                                              style: AppTextStyles
                                                  .font14BlackCairoMedium
                                                  .copyWith(
                                                      color: AppColors.blue),
                                            ),
                                          ),
                                        )
                                      : MobileProductOrderForm(index: index),
                                ],
                              );
                            }),
                      ],
                    ),
                  );
                },
              ),
              verticalSpace(8),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: RectangledFilterCard(
                  width: 145.w,
                  text: 'Submit'.tr,
                  color: AppColors.primary,
                  onTap: () {
                    controller.submitOrder(context);
                  },
                ),
              ),
            ]),
          ),
        )),
      ),
    );
  }
}
