import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../core/theme/app_colors.dart';
import 'inquiry_message_bubble.dart';

class InquiryChatCard extends StatelessWidget {
  const InquiryChatCard({super.key});

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
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InquiryMessageBubble();
          },
        ));
  }
}
