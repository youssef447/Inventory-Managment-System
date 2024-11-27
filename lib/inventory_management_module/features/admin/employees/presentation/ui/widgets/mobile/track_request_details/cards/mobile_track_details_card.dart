part of '../../../../pages/mobile/mobile_track_requests_details_page.dart';

//Youssef Ashraf
///Represnts Mobile Track Request Details Card Wich contains Req Info and Aprroval Cycle
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
            value: model.requestType.getName,
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
          const MobileApprovalCycle(),
          if (model.status == RequestStatus.cancelled &&
              model.reasonsOfCanccellation != null)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 8.h,
                children: [
                  SvgPicture.asset(AppAssets.status),
                  Text(
                    '${'Reasons Of Canccellation'.tr}: ',
                    style: AppTextStyles.font14BlackCairoMedium.copyWith(
                      color: AppColors.red,
                    ),
                  ),
                  Text(model.reasonsOfCanccellation!,
                      style: AppTextStyles.font14BlackCairoMedium),
                ],
              ),
            ),
          verticalSpace(32),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: RequestedApprovalButtons(
              requestEntity: model,
            ),
          ),
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
        SvgPicture.asset(icon, height: 16.h, width: 16.w),
        horizontalSpace(3),
        DefaultRichText(
          label: label,
          valueColor: value.getColor,
          value: value,
        ),
      ],
    );
  }
}
