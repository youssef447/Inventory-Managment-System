part of '../../../../pages/tablet/tablet_track_requests_details_page.dart';

class VerticalTrackDetailsCardHeader extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const VerticalTrackDetailsCardHeader({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultRichText(
                label: 'Request ID',
                value: model.requestId,
              ),
              DefaultRichText(
                label: 'Request Type',
                value: model.requestType.getName,
              ),
              DefaultRichText(
                label: 'Request Date',
                value: DateTimeHelper.formatDate(model.requestDate),
              ),
              DefaultRichText(
                label: 'Quantity',
                value: DateTimeHelper.formatInt(model.quantity),
              ),
              DefaultRichText(
                label: 'Category',
                value: isConsumable
                    ? model.consumablesEntity!.category
                    : model.assetsEntity!.category,
              ),
              DefaultRichText(
                label: 'Subcategory',
                value: isConsumable
                    ? model.consumablesEntity!.subcategory
                    : model.assetsEntity!.subcategory,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultRichText(
                label: 'Model',
                value: isConsumable
                    ? model.consumablesEntity!.model
                    : model.assetsEntity!.model,
              ),
              DefaultRichText(
                label: 'Brand',
                value: isConsumable
                    ? model.consumablesEntity!.brand
                    : model.assetsEntity!.brand,
              ),
              if (!isConsumable) ...[
                DefaultRichText(
                  label: 'Maintenance Frequency',
                  value: model.assetsEntity!.maintenanceFrequency ??
                      'Not Applicable',
                  valueColor:
                      model.assetsEntity!.maintenanceFrequency?.getColor,
                ),
                DefaultRichText(
                  label: 'Expected Lifetime',
                  value: DateTimeHelper.formatDate(
                      model.assetsEntity!.expectedLifeTime ?? DateTime.now()),
                  valueColor:
                      model.assetsEntity!.maintenanceFrequency?.getColor,
                ),
              ],
              if (isConsumable) ...[
                verticalSpace(2),
                DefaultRichText(
                  label: 'Unit Of Measurement',
                  value: model.consumablesEntity!.unitOfMeasurement.getName,
                ),
                verticalSpace(2),
                DefaultRichText(
                  label: 'Expiration Date',
                  value: DateTimeHelper.formatDate(
                    model.consumablesEntity!.expirationDate ?? DateTime.now(),
                  ),
                ),
              ],
              DefaultRichText(
                label: 'Supplier Name',
                value: isConsumable
                    ? model.consumablesEntity!.supplier.supplierName
                    : model.assetsEntity!.supplier.supplierName,
                style: AppTextStyles.font12BlackMediumCairo.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
