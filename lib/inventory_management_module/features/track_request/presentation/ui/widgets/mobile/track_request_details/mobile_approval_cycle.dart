part of '../../../pages/mobile/mobile_track_requests_details_page.dart';

class MobileApprovalCycle extends StatelessWidget {
  const MobileApprovalCycle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.buildings),
            horizontalSpace(8),
            Text('${'Approval Cycle'.tr}:',
                style: AppTextStyles.font14BlackCairoMedium),
          ],
        ),
        verticalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            ApproveCycle.approvalCycles.length,
            (index) => Padding(
              padding: index != ApproveCycle.approvalCycles.length - 1
                  ? EdgeInsets.only(bottom: 17.h)
                  : EdgeInsets.zero,
              child: _BuildAvatarArrow(
                '${ApproveCycle.approvalCycles[index].firstName} ${ApproveCycle.approvalCycles[index].lastName}',
                ApproveCycle.approvalCycles[index].position,
                ApproveCycle.approvalCycles[index].profileImage,
                index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BuildAvatarArrow extends StatelessWidget {
  final String name;
  final String postion;
  final String profileImage;
  final int index;
  const _BuildAvatarArrow(
      this.name, this.postion, this.profileImage, this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index != 0)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.line,
                color: index == 1 ? AppColors.black : AppColors.green,
              ),
              SvgPicture.asset(
                index == 1 ? AppAssets.blackArrow : AppAssets.greenArrow,
              ),
            ],
          ),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: index == 1 ? AppColors.warming : AppColors.green,
          child: CircleAvatar(
            radius: 16.r,
            backgroundImage: NetworkImage(profileImage),
          ),
        ),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyles.font14BlackCairoMedium,
            ),
            Text(
              postion,
              style: AppTextStyles.font12SecondaryBlackCairoMedium,
            ),
          ],
        ),
      ],
    );
  }
}
