import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../../core/widgets/attachments/attachment_card.dart';
import '../../../../../../../requests/entities/message_entity.dart';
import '../../../../../controller/inquiry_chat_controller.dart';

//Youssef Ashraf
///Default Message Bubble for any message
class InquiryMessageBubble extends GetView<InquiryChatController> {
  final MessageEntity messageEntity;
  const InquiryMessageBubble({
    super.key,
    required this.messageEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: messageEntity.isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: messageEntity.isMe
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.centerStart,
          child: Builder(builder: (context) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: () {
                final RenderBox bubbleBox =
                    context.findRenderObject() as RenderBox;
                final Offset position = bubbleBox.globalToLocal(Offset.zero);
                controller.showMessageActions(
                  position: position,
                  messageEntity: messageEntity,
                  context: context,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: messageEntity.attachment != null
                      ? Colors.transparent
                      : AppColors.background,
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
            );
          }),
        ),
        verticalSpace(8),
        Text(
          DateTimeHelper.formatDateWithTime(
            messageEntity.sentDate,
          ),
          style: AppTextStyles.font10SecondaryBlackCairoMedium,
        ),
      ],
    );
  }
}
