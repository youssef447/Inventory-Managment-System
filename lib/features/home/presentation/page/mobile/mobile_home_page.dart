import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../core/helpers/date_time_helper.dart';
import '../../../../../core/helpers/spacing_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font_weights.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../constants/ids.dart';
import '../../../constants/inventory_categories.dart';
import '../../../controller/home_controller.dart';
part '../../widgets/mobile/cards/category_filter_card.dart';
part '../../widgets/mobile/categories_filter_row/categories_filter_row.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        child: SafeArea(child: Center(child: Text('data'))),
      ),
    );
  }
}
