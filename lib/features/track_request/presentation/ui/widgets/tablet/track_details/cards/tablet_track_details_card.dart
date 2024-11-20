part of '../../../../pages/tablet/tablet_track_request_details_page.dart';

//Youssef Ashraf
///Represnts Tablet Track Request Details Card Wich contains Req Info and Aprroval Cycle
class TabletTrackDeatailsCard extends GetView<TrackRequestController> {
  final RequestEntity model;
  final bool isConsumable;
  const TabletTrackDeatailsCard({
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
          TrackDetailsCardHeader(
            model: model,
            isConsumable: isConsumable,
          ),
          verticalSpace(38),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BuildIconLabel(
                'Expected Recieved',
                DateTimeHelper.formatDate(model.expectedRecieved),
                AppAssets.calender,
              ),
              _BuildIconLabel(
                'Approval',
                model.status,
                AppAssets.doc,
              ),
              _BuildIconLabel(
                'Last Update',
                DateTimeHelper.formatDate(
                  isConsumable
                      ? model.consumablesEntity!.lastUpdate
                      : model.assetsEntity!.lastUpdate,
                ),
                AppAssets.calender,
              ),
            ],
          ),
          verticalSpace(38),
          const ApprovalCycle(),
          verticalSpace(38),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CancelRequestButton(requestId: model.requestId),
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
        SvgPicture.asset(icon, height: 24.h, width: 24.w),
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
