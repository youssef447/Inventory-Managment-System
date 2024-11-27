part of '../../../pages/mobile/mobile_admin_employee_details_page.dart';

class MobileAdminEmployeeDetailsCard extends StatelessWidget {
  final UserEntity userEntity;

  const MobileAdminEmployeeDetailsCard({super.key, required this.userEntity});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: NetworkImage(userEntity.profileImage),
            ),
            horizontalSpace(4),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${userEntity.firstName} ${userEntity.lastName}',
                            style: AppTextStyles.font18BlackCairoMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        horizontalSpace(4),
                        SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: SquaredChipCard(
                            icon: AppAssets.message,
                            onTap: () {},
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
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
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
