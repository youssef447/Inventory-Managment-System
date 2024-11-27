import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/admin_categories.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_font_weights.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../controller/admin_controller.dart';
import '../../widgets/tablet/button/home_row_buton.dart';
import '../../widgets/mobile/button/mobile_add_button.dart';
part '../../widgets/mobile/cards/category_filter_card.dart';
part '../../widgets/mobile/categories_filter_row/categories_filter_row.dart';
part '../../widgets/mobile/search_filter/mobile_search_filter.dart';

class MobileAdminHomePage extends GetView<AdminController> {
  const MobileAdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Obx(
            () {
              final index = controller.currentCategoryIndex.value;
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: CustomAppBar()),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  const SliverToBoxAdapter(child: HomeAdminRowButton()),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  const SliverToBoxAdapter(
                    child: MobileCategoriesFilterRow(),
                  ),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  const SliverToBoxAdapter(child: MobileSearchFilter()),
                  const SliverToBoxAdapter(child: MobileAddButton()),
                  SliverToBoxAdapter(child: verticalSpace(20)),
                  controller.mobileAdminTabs[index],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
