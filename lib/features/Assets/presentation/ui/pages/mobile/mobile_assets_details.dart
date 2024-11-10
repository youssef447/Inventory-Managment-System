import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../controller/assets_controller.dart';

class MobileAssetsDetails extends GetView<AssetsController> {
  const MobileAssetsDetails({super.key, required this.index,});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: ()=> Get.back(),
                  child:const Icon(Icons.arrow_back_ios),
                ),
                Text('Asset Details'.tr,style: AppTextStyles.font26BlackSemiBoldCairo,),
              ],
            ),
            verticalSpace(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.image,
                  width: 65.w,
                  height: 65.h,
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     controller.assetsList[index].brand +  controller.assetsList[index].model,
                      style: AppTextStyles.font16TextMediumCairo,
                    ),

                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
