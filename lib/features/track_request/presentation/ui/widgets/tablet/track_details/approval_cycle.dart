part of '../../../pages/tablet/tablet_track_request_details_page.dart';

class ApprovalCycle extends StatelessWidget {
  const ApprovalCycle({
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
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 15.h,
          children: List.generate(
            ApproveCycle.approvalCycles.length,
            (index) => _BuildAvatarArrow(
              '${ApproveCycle.approvalCycles[index].firstName} ${ApproveCycle.approvalCycles[index].lastName}',
              ApproveCycle.approvalCycles[index].position,
              ApproveCycle.approvalCycles[index].profileImage,
              index,
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
    final isLast = index == ApproveCycle.approvalCycles.length - 1;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.green,
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
        if (!isLast)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SvgPicture.asset(
              AppAssets.greenArrow,
            ),
          ),
      ],
    );
  }
}
