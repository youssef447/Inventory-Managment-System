part of '../../../../pages/tablet/tablet_track_requests_details_page.dart';

//Youssef Ashraf
///Represnts Tablet Track Request Details Card Wich contains Req Info and Aprroval Cycle
class TabletTrackDeatailsCard extends StatelessWidget {
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
          OrientationHelper(
            landScape: HorizontalTrackDetailsCardHeader(
              model: model,
              isConsumable: isConsumable,
            ),
            portrait: VerticalTrackDetailsCardHeader(
              model: model,
              isConsumable: isConsumable,
            ),
          ),
          verticalSpace(38),
          Row(
            mainAxisAlignment: context.isLandscapee
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              _BuildIconLabel(
                'Expected Recieved',
                DateTimeHelper.formatDate(model.expectedRecieved),
                AppAssets.calender,
              ),
              if (context.isLandscapee) horizontalSpace(78),
              _BuildIconLabel(
                'Expected Return',
                DateTimeHelper.formatDate(model.dateReturn),
                AppAssets.doc,
              ),
              if (context.isLandscapee) horizontalSpace(78),
              _BuildIconLabel(
                'Priority',
                model.priority.tr,
                AppAssets.system,
              ),
            ],
          ),
          verticalSpace(38),
          if (!context.isLandscapee)
            Row(
              children: [
                const Expanded(child: ApprovalCycle()),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.qr,
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          SvgPicture.asset(AppAssets.system),
                          horizontalSpace(4),
                          Text(
                            'Download As PNG',
                            style: AppTextStyles
                                .font14SecondaryBlackCairoRegular
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ],
                      )
                    ]),
              ],
            ),
          if (context.isLandscapee) const ApprovalCycle(),
          if (model.status == RequestStatus.cancelled &&
              model.reasonsOfCanccellation != null)
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
              ),
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
          verticalSpace(38),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: RequestedApprovalButtons(
                    requestEntity: model,
                  ),
                ),
              ),
            ],
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
