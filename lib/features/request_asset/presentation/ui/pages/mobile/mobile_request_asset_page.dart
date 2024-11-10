import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/request_assets_controller.dart';

class MobileRequestAssetsPage extends GetView<RequestAssetsController> {
  const MobileRequestAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestAssetsController>(
        id: RequestAssetsIds.requestAssetsPage,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : controller.assets.isEmpty
                  ? const NoDataGif()
                  : const SizedBox();
        });
  }
}
