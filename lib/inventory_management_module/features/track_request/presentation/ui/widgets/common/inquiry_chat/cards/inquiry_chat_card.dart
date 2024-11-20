import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../requests/entities/request_entity.dart';
import '../../../../../../constants/ids_constants.dart';
import '../../../../../controller/track_requests_controller.dart';
import '../bubble/inquiry_message_bubble.dart';
import '../new_message_field/new_message_field.dart';

class InquiryChatCard extends StatelessWidget {
  final RequestEntity model;
  const InquiryChatCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackRequestController>(
        id: TrackRequestIds.inquiryDetails,
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
                      return InquiryMessageBubble(
                        messageEntity: model.inquiryMessages[index],
                      );
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
