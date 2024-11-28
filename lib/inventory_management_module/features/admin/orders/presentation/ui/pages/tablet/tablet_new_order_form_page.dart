import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/widgets/buttons/default_switch_button.dart';
import './../../../../../../../core/enums/stock_enums.dart';
import './../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/fields/labeled_dropDown_field.dart';
import '../../../../../../../core/widgets/fields/labled_form_field.dart';
import '../../../../../../products/domain/product_entity.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/new_order_form_controller.dart';
part '../../widgets/tablet/new_order_form/horizontal_product_details_card.dart';
part '../../widgets/tablet/new_order_form/vertical_product_details_card.dart';

part '../../widgets/tablet/new_order_form/product_order_form.dart';

class TabletNewOrderFormPage extends GetView<NewOrderFormController> {
  final List<ProductEntity> products;
  const TabletNewOrderFormPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isLandscapee ? 30.w : 20.w,
          vertical: 16.h,
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppBar(
              titles: const ['New Order', 'Order Form'],
              titleNavigations: [
                () {
                  Navigator.of(context).pop();
                }
              ],
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
                      OrientationHelper(
                        landScape: HorizontalProductDetailsCard(
                            product: products[index]),
                        portrait: VerticalProductDetailsCard(
                            product: products[index]),
                      ),
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
                                    value: controller.createAutomaticIDs[index],
                                    onChanged: (v) {
                                      controller.toggleAutomaticIds(v, index);
                                    })
                              ],
                            );
                          }),
                      GetBuilder<NewOrderFormController>(
                          id: OrderIds.newOrderForm,
                          builder: (controller) {
                            return controller.hideForm[index]
                                ? Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: GestureDetector(
                                      onTap: () => controller
                                          .hideProductDetailsCard(index),
                                      child: Text(
                                        controller.hideForm[index]
                                            ? 'Expand'.tr
                                            : 'Hide'.tr,
                                        style: AppTextStyles
                                            .font14BlackCairoMedium
                                            .copyWith(color: AppColors.blue),
                                      ),
                                    ),
                                  )
                                : TabletProductOrderForm(index: index);
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
    );
  }
}
