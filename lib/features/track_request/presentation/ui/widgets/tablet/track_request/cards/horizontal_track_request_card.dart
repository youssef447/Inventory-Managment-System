part of '../../../../pages/tablet/tablet_track_requests_page.dart';

//Youssef Ashraf
///Represents Horizontal Tablet Request Card when pressing on Track Request button in home page
class HorizontalTrackRequestCard extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const HorizontalTrackRequestCard({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
                width: 45.w,
                height: 60.h,
                fit: BoxFit.fill,
              ),
              horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isConsumable
                          ? model.consumablesEntity!.name
                          : model.assetsEntity!.assetName,
                      style: AppTextStyles.font16BlackCairoRegular,
                    ),
                    verticalSpace(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultRichText(
                          label: 'Request ID',
                          value: model.requestId,
                        ),
                        horizontalSpace(4),
                        Flexible(
                          child: DefaultRichText(
                            label: 'Request Type',
                            value: model.requestType,
                          ),
                        ),
                      ],
                    ),
                    DefaultRichText(
                      label: 'Request Date',
                      value: DateTimeHelper.formatDate(model.requestDate),
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
          )
        ],
      ),
    );
  }
}
