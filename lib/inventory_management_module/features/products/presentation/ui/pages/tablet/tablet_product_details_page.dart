import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../core/enums/requests_enums.dart';
import '../../../../../../features/products/presentation/ui/pages/tablet/add_product/add_consumable_page.dart';
import '../../../../../../features/products/presentation/ui/pages/tablet/add_product/add_asset_page.dart';
import '../../../../../../core/enums/stock_enums.dart';
import '../../../../../../core/extensions/extensions.dart';
import '../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../core/helpers/orientation_helper.dart';

import '../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../core/animations/size_animation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../core/widgets/buttons/rectangled_filter_card.dart';
import '../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../admin/home/presentation/ui/page/mobile/mobile_admin_home_page.dart';
import '../../../../domain/product_entity.dart';
import '../../../../enums/product_enums.dart';
import '../../../controller/products_controller.dart';
import '../../widgets/common/cards/horizontal_assigned_user_card.dart';
import '../../widgets/common/cards/vertical_assigned_user_card.dart';
import '../../widgets/common/cards/instock_card.dart';
import '../../widgets/common/dialogs/assign_filter_dialog.dart';
import 'edit/restocking_edit.dart';

part '../../widgets/tablet/product_details/assigned_and_stock_list.dart';

part '../../widgets/tablet/product_details/horizontal_product_details_card.dart';
part '../../widgets/tablet/product_details/vertical_product_details_card.dart';

class TabletProductDetailsPage extends StatelessWidget {
  final ProductEntity product;
  const TabletProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.isLandscapee ? 30.w : 20.w,
            vertical: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  titles: const ['Product', 'Product Details'],
                  titleNavigations: [
                    () => Navigator.of(context).pop(),
                  ],
                ),
                verticalSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RectangledFilterCard(
                      height: 30.h,
                      image: AppAssets.download,
                      text: 'Warranty',
                      textColor: AppColors.textButton,
                      color: AppColors.primary,
                      onTap: () {},
                    ),
                    horizontalSpace(6),
                    RectangledFilterCard(
                      height: 30.h,
                      image: AppAssets.download,
                      text: 'Specification',
                      textColor: AppColors.textButton,
                      color: AppColors.primary,
                      onTap: () {},
                    ),
                    horizontalSpace(6),
                    RectangledFilterCard(
                      height: 30.h,
                      image: AppAssets.download,
                      text: 'Restocking',
                      textColor: AppColors.textButton,
                      color: AppColors.primary,
                      onTap: () {
                        GetDialogHelper.generalDialog(
                            context: context, child: const RestockingEdit());
                      },
                    ),
                    horizontalSpace(6),
                    SizedBox(
                        height: 30.h,
                        child: RectangledFilterCard(
                          image: AppAssets.edit,
                          text: 'Edit',
                          textColor: AppColors.textButton,
                          color: AppColors.primary,
                          onTap: () {
                            GetDialogHelper.generalDialog(
                                context: context,
                                child: product.productType == ProductType.asset
                                    ? AddAssetPage(
                                        product: product,
                                        isEdit: true,
                                      )
                                    : AddConsumablePage(
                                        isEdit: true,
                                        product: product,
                                      ));
                          },
                        )),
                  ],
                ),
                verticalSpace(9),
                SizeAnimation(
                  child: OrientationHelper(
                    landScape: HorizontalProductDetailsCard(
                      product: product,
                    ),
                    portrait: VerticalProductDetailsCard(
                      product: product,
                    ),
                  ),
                ),
                verticalSpace(22),
                const TabletAssignedAndStockList(),
              ],
            ),
          ),
        )));
  }
}
