part of '../../../../pages/tablet/tablet_track_request_details_page.dart';

//Youssef Ashraf
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
                '${'Expected Recieved'.tr}: ',
                DateTimeHelper.formatDate(model.expectedRecieved),
                AppAssets.calender,
              ),
              _BuildIconLabel(
                '${'Approval'.tr}: ',
                model.status.tr,
                AppAssets.doc,
              ),
              _BuildIconLabel(
                '${'Last Update'.tr}: ',
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
            child: GestureDetector(
              onTap: () {
                HapticFeedbackHelper.triggerHapticFeedback(
                  vibration: VibrateType.mediumImpact,
                  hapticFeedback: HapticFeedback.mediumImpact,
                );
                GetDialogHelper.generalDialog(
                  child: DefaultDialog(
                    width: context.isPhone ? 343.w : 411.w,
                    showButtons: true,
                    icon: AppAssets.canceled,
                    title: 'Cancelation Request'.tr,
                    subTitle:
                        'Are You sure You Want to Cancel this Request ?'.tr,
                    onConfirm: () {
                      controller.cancelRequest(model.requestId);
                    },
                  ),
                  context: context,
                );
              },
              child: const CancelRequestButton(),
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
                    .copyWith(color: value.getColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
