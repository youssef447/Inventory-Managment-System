import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../requests/entities/request_entity.dart';
import '../../../../../../constants/ids_constants.dart';
import '../../../../../controller/inquiry_chat_controller.dart';
import '../bubble/inquiry_message_bubble.dart';
import '../message_headers/my_message_header.dart';
import '../message_headers/other_meassge_header.dart';
import '../new_message_field/new_message_field.dart';

//Youssef Ashraf
///Represent the Inquiry Chat Card in Track Request Details Screen
class InquiryChatCard extends StatelessWidget {
  final RequestEntity model;
  const InquiryChatCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InquiryChatController>(
        id: TrackRequestIds.inquiryChat,
        builder: (controller) {
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
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model.inquiryMessages.length,
                    itemBuilder: (context, index) {
                      final messageEntity = model.inquiryMessages[index];
                      return Column(children: [
                        Container(
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
                              children: [
                                messageEntity.isMe
                                    // my message
                                    ? MyMessageHeader(
                                        userEntity: messageEntity.userEntity)
                                    : OtherMessageHeader(
                                        userEntity: messageEntity.userEntity),
                                verticalSpace(8),
                                InquiryMessageBubble(
                                  messageEntity: messageEntity,
                                ),
                              ],
                            ))
                      ]);
                    },
                  ),
                  NewMessageField(
                    model,
                  ),
                ],
              ));
        });
  }
}
