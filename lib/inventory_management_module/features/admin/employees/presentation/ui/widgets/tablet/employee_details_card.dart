part of '../../pages/tablet/tablet_admin_employee_details_page.dart';

class TabletEmployeeDetailsCard extends StatelessWidget {
  final UserEntity userEntity;
  const TabletEmployeeDetailsCard({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(
              8.r,
            )),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(userEntity.profileImage),
            ),
            horizontalSpace(14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userEntity.firstName} ${userEntity.lastName}',
                      style: AppTextStyles.font18BlackCairoMedium,
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultRichText(
                              label: 'Job Title',
                              value: userEntity.jobTitle,
                              icon: AppAssets.bag,
                            ),
                            DefaultRichText(
                              label: 'Department',
                              value: userEntity.department.getName,
                              icon: AppAssets.transmission,
                            ),
                          ],
                        ),
                        horizontalSpace(50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultRichText(
                              label: 'Phone Number',
                              value: userEntity.phoneNumber,
                              icon: AppAssets.call,
                            ),
                            DefaultRichText(
                              label: 'Email',
                              value: userEntity.email,
                              icon: AppAssets.sms,
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (context.isLandscapee)
                          RectangledFilterCard(
                            image: AppAssets.message,
                            text: 'Message',
                            onTap: () {},
                            color: AppColors.primary,
                            iconHeight: 24.h,
                            iconWidth: 24.w,
                          ),
                        if (!context.isLandscapee)
                          Expanded(
                            child: SquaredChipCard(
                              icon: AppAssets.message,
                              onTap: () {},
                              color: AppColors.primary,
                            ),
                          ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
