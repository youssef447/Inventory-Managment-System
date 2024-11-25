part of '../../../../pages/mobile/mobile_track_requests_page.dart';

//Youssef Ashraf
///Represents Mobile Request Card when pressing on Track Request button in home page
class MobileTrackRequestCard extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const MobileTrackRequestCard({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                isConsumable
                    ? model.consumablesEntity!.image
                    : model.assetsEntity!.image,
                width: 65.w,
                height: 65.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          isConsumable
                              ? model.consumablesEntity!.name
                              : model.assetsEntity!.assetName,
                          style: AppTextStyles.font14BlackCairoRegular,
                        ),
                        const Spacer(),
                        DefaultRichText(
                          label: 'Request Date',
                          value: DateTimeHelper.formatDate(model.requestDate),
                        ),
                      ],
                    ),
                    verticalSpace(3),
                    DefaultRichText(
                      label: 'Request ID',
                      value: model.requestId,
                    ),
                    DefaultRichText(
                      label: 'Model',
                      value: isConsumable
                          ? model.consumablesEntity!.model
                          : model.assetsEntity!.model,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: DefaultRichText(
              label: 'Last Update',
              value: DateTimeHelper.formatDate(
                isConsumable
                    ? model.consumablesEntity!.lastUpdate
                    : model.assetsEntity!.lastUpdate,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
