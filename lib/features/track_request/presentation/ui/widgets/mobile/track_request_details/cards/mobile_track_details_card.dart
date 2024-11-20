part of '../../../../pages/mobile/mobile_track_requests_details_page.dart';

class MobileTrackDetailsCard extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const MobileTrackDetailsCard({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultRichText(
            label: 'Request Type',
            value: model.requestType,
          ),
          DefaultRichText(
            label: 'Priority',
            value: model.priority,
          ),
          DefaultRichText(
            label: 'Request Delivery',
            value: DateTimeHelper.formatDate(model.dateReturn),
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
          verticalSpace(32),
          _BuildIconLabel(
            '${'Approval'.tr}: ',
            '${model.status} ${'Approval'.tr}',
            AppAssets.doc,
          ),
          verticalSpace(15),
          _BuildIconLabel(
            '${'Last Update'.tr}: ',
            DateTimeHelper.formatDate(
              isConsumable
                  ? model.consumablesEntity!.lastUpdate
                  : model.assetsEntity!.lastUpdate,
            ),
            AppAssets.calender,
          ),
          verticalSpace(15),
          _BuildIconLabel(
            '${'Expected Recieved'.tr}: ',
            DateTimeHelper.formatDate(model.expectedRecieved),
            AppAssets.calender,
          ),
          verticalSpace(32),
          const MobileApprovalCycle(),
        ],
      ),
    );
  }
}

class _BuildIconLabel extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  const _BuildIconLabel(this.label, this.value, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        horizontalSpace(3),
        RichText(
          text: TextSpan(
            text: label,
            style: AppTextStyles.font14SecondaryBlackCairoMedium,
            children: [
              TextSpan(
                text: value,
                style: AppTextStyles.font14BlackCairoMedium
                    .copyWith(color: value.split(' ')[0].getColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
