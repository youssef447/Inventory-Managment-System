part of '../../../../pages/tablet/tablet_track_requests_details_page.dart';

//Youssef Ashraf
///Represents The Horizontal Tablet Track Request Details Card Header Wich contains Req Info and Aprroval Cycle
class HorizontalTrackDetailsCardHeader extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const HorizontalTrackDetailsCardHeader({
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
            ],
          ),
        ),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultRichText(
              label: isConsumable ? 'Asset ID' : 'Consumable ID',
              value: isConsumable
                  ? model.consumablesEntity!.consumableId
                  : model.assetsEntity!.assetId,
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
            DefaultRichText(
              label: 'Brand',
              value: isConsumable
                  ? model.consumablesEntity!.brand
                  : model.assetsEntity!.brand,
            ),
          ]),
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
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              AppAssets.qr,
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.system,
                ),
                horizontalSpace(4),
                Text(
                  'Download As PNG',
                  style: AppTextStyles.font14SecondaryBlackCairoRegular
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ],
            )
          ]),
        ),
      ],
    );
  }
}
