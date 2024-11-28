part of '../../../pages/mobile/mobile_new_order_form_page.dart';

class ProductOrderForm extends StatelessWidget {
  const ProductOrderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewOrderFormController>(
        id: OrderIds.newOrderForm,
        builder: (controller) {
          return Column(
            children: [
              Text(
                'Order Details'.tr,
                style: AppTextStyles.font20BlackCairoMedium,
              ),
              verticalSpace(17),
              LabeledFormField(
                controller: controller.orderIDController,
                label: 'Order ID',
              ),
              LabeledFormField(
                controller: controller.quantityController,
                label: 'Quantity',
              ),
              LabeledFormField(
                controller: controller.unitCostController,
                label: 'Unit Cost',
              ),
              LabeledDropdownField(
                value: 1,
                controller: controller.currencyController,
                label: 'Currency',
                onChanged: (value) {},
                items: List.generate(
                  Currncies.values.length,
                  (index) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: Currncies.values[index],
                      child: Text(
                        Currncies.values[index].getName.tr,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
              ),
              LabeledDropdownField(
                value: 1,
                controller: controller.supplierController,
                label: 'Supplier',
                onChanged: (value) {},
                items: List.generate(
                  Currncies.values.length,
                  (index) {
                    return DropdownMenuItem(
                      alignment: AlignmentDirectional.centerStart,
                      value: Currncies.values[index],
                      child: Text(
                        Currncies.values[index].getName.tr,
                        style: AppTextStyles.font14SecondaryBlackCairoMedium,
                      ),
                    );
                  },
                ),
              ),
              LabeledFormField(
                controller: controller.orderValueController,
                label: 'Order Value',
              ),
            ],
          );
        });
  }
}
