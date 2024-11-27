import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/enums/stock_enums.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../core/animations/size_animation.dart';

import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../core/widgets/fields/app_form_field.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';

import '../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../admin/home/presentation/ui/page/mobile/mobile_admin_home_page.dart';
import '../../../../../employee/home/presentation/ui/widgets/common/vertical/squared_filter_card.dart';
import '../../../../domain/product_entity.dart';
import '../../../../enums/product_enums.dart';
import '../../../controller/products_controller.dart';
import '../../widgets/common/cards/vertical_assigned_user_card.dart';
import '../../widgets/common/cards/instock_card.dart';
part '../../widgets/mobile/product_details/product_details_card.dart';
part '../../widgets/mobile/product_details/assigned_and_stock_list.dart';

class MobileProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const MobileProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpace(16),
          ),
          SliverToBoxAdapter(
            child: MobileCustomAppbar(
              title: 'Product Details'.tr,
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(12),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: RectangledFilterCard(
                    height: 30.h,
                    image: AppAssets.download,
                    text: 'Warranty',
                    textColor: AppColors.textButton,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                ),
                horizontalSpace(6),
                Expanded(
                  child: RectangledFilterCard(
                    height: 30.h,
                    image: AppAssets.download,
                    text: 'Specification',
                    textColor: AppColors.textButton,
                    color: AppColors.primary,
                    onTap: () {},
                  ),
                ),
                horizontalSpace(6),
                Expanded(
                  child: RectangledFilterCard(
                    height: 30.h,
                    image: AppAssets.download,
                    text: 'Restocking',
                    textColor: AppColors.textButton,
                    color: AppColors.primary,
                    onTap: () {
                      GetDialogHelper.generalDialog(
                        context: context,
                        child:  Container(width: 200,height: 300,)
                      );
                    },
                  ),
                ),
                horizontalSpace(6),
                SizedBox(
                    height: 30.h,
                    child: const SquaredChipCard(
                      icon: AppAssets.edit,
                    )),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(9),
          ),
          SliverToBoxAdapter(
            child: SizeAnimation(
              child: MobileProductDetailsCard(
                product: product,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(22),
          ),
          const MobileAssignedAndStockList(),
        ],
      ),
    )));
  }
}
