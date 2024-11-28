// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../../../core/animations/size_animation.dart';
// import '../../../../../../../core/constants/app_assets.dart';
// import '../../../../../../../core/helpers/date_time_helper.dart';
// import '../../../../../../../core/helpers/spacing_helper.dart';
// import '../../../../../../../core/theme/app_colors.dart';
// import '../../../../../../../core/theme/app_text_styles.dart';
// import '../../../../../../../core/widgets/default_rich_text.dart';
// import '../../../../../domain/product_entity.dart';
// import '../../../../../enums/product_enums.dart';
//
// class InStockCard extends StatelessWidget {
//   final ProductEntity product;
//   const InStockCard({super.key, required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     final isConsumable = product.productType == ProductType.consumable;
//     return SizeAnimation(
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 8.w,
//           vertical: 8.h,
//         ),
//         decoration: BoxDecoration(color: AppColors.card),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(4.r),
//                   child: Image.asset(
//                     AppAssets.pphone,
//                     width: 45.w,
//                     height: 65.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 horizontalSpace(4),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       DefaultRichText(
//                         label: 'Storage Location',
//                         value: product.storage[0].locationName,
//                       ),
//                       DefaultRichText(
//                         label: 'Maintenance Schedule',
//                         value: DateTimeHelper.formatDate(isConsumable
//                             ? product.consumablesEntity!.maintenanceSchedule
//                             : product.assetEntity!.nextMaintenanceSchedule ??
//                                 DateTime.now()),
//                       ),
//                       DefaultRichText(
//                         label: 'Maintenance Frequency',
//                         value: isConsumable
//                             ? product.consumablesEntity!.maintenanceFrequency
//                             : product.assetEntity!.maintenanceFrequency ??
//                                 'Not Applicable',
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             verticalSpace(5),
//             Text(
//               isConsumable
//                   ? product.consumablesEntity!.name
//                   : product.assetEntity!.assetName,
//               style: AppTextStyles.font16BlackCairoRegular,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
