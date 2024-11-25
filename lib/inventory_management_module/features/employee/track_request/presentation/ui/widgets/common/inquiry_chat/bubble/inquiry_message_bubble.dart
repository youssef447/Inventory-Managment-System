import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../../core/widgets/attachments/attachment_card.dart';
import '../../../../../../../requests/entities/message_entity.dart';

class InquiryMessageBubble extends StatelessWidget {
  final MessageEntity messageEntity;
  const InquiryMessageBubble({
    super.key,
    required this.messageEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isPhone ? 8.w : 14.w,
        vertical: 16.h,
      ),
      alignment: messageEntity.isMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: messageEntity.isMe
                ? [
                    Text(
                      DateTimeHelper.formatDateWithTime(
                        messageEntity.sentDate,
                      ),
                      style: AppTextStyles.font12SecondaryBlackCairoMedium,
                    ),
                    const Spacer(),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${messageEntity.userEntity.firstName} ${messageEntity.userEntity.lastName}',
                              style: context.isPhone
                                  ? AppTextStyles.font14BlackCairoMedium
                                  : AppTextStyles.font16BlackCairoMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              messageEntity.userEntity.jobTitle,
                              style: context.isPhone
                                  ? AppTextStyles
                                      .font12SecondaryBlackCairoMedium
                                  : AppTextStyles
                                      .font16SecondaryBlackCairoMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(messageEntity.userEntity.profileImage),
                      radius: context.isPhone ? 16.r : 24.r,
                    ),
                  ]
                : [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(messageEntity.userEntity.profileImage),
                      radius: context.isPhone ? 16.r : 24.r,
                    ),
                    horizontalSpace(8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${messageEntity.userEntity.firstName} ${messageEntity.userEntity.lastName}',
                            style: context.isPhone
                                ? AppTextStyles.font14BlackCairoMedium
                                : AppTextStyles.font16BlackCairoMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            messageEntity.userEntity.jobTitle,
                            style: context.isPhone
                                ? AppTextStyles.font12SecondaryBlackCairoMedium
                                : AppTextStyles.font16SecondaryBlackCairoMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(8),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          DateTimeHelper.formatDateWithTime(
                            messageEntity.sentDate,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        ),
                      ),
                    ),
                  ],
          ),
          verticalSpace(8),
          Align(
            alignment: messageEntity.isMe
                ? AlignmentDirectional.centerEnd
                : AlignmentDirectional.centerStart,
            child: Container(
              // width: double.infinity,

              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: messageEntity.attachment != null
                  ? AttachmentCard(
                      model: messageEntity.attachment!,
                      showDownload: !messageEntity.isMe,
                    )
                  : Text(
                      messageEntity.message!,
                      style: context.isPhone
                          ? AppTextStyles.font12BlackCairo
                          : AppTextStyles.font14BlackCairoMedium,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
