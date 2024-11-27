part of '../../../../pages/tablet/tablet_track_requests_page.dart';

//Youssef Ashraf
///Represents Vertical Tablet Request Card when pressing on Track Request button in home page
class VerticalTrackRequestCard extends StatelessWidget {
  final RequestEntity model;
  final bool isConsumable;

  const VerticalTrackRequestCard({
    super.key,
    required this.model,
    required this.isConsumable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 12.h,
        bottom: 8.h,
      ),
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
                fit: BoxFit.fill,
                width: 45.w,
                height: 60.h,
              ),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  isConsumable
                      ? model.consumablesEntity!.name
                      : model.assetsEntity!.assetName,
                  style: AppTextStyles.font16BlackCairoRegular,
                ),
              ),
            ],
          ),
          verticalSpace(10),
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
          verticalSpace(14),
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
