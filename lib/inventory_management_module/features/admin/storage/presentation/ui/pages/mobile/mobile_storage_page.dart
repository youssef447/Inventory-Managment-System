import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../features/admin/storage/domain/storage_location_entity.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/storage_ids.dart';
import '../../../controller/storage_controller.dart';
import '../../../controller/storage_form_controller.dart';
part '../../widgets/mobile/mobile_storage_card.dart';

//Youssef Ashraf
///Default Storage Tab in Mobile View
class MobileStoragePage extends StatelessWidget {
  const MobileStoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StorageController>(
      id: StorageIds.storagePage,
      builder: (controller) {
        return controller.loading
            ? const SliverFillRemaining(
                child: AppCircleProgress(),
              )
            : controller.storages.isEmpty
                ? const SliverFillRemaining(
                    child: NoDataGif(),
                  )
                : SliverList.separated(
                    separatorBuilder: (_, __) => verticalSpace(16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.lazyPut(
                            () => StorageFormController()
                              ..setStorageData(controller.storages[index])
                              ..isEditable = false,
                          );

                          context.navigateTo(
                            Routes.storageForm,
                            arguments: {
                              RouteArguments.storage: controller.storages[index]
                            },
                          );
                        },
                        child: MobileStorageCard(
                          storage: controller.storages[index],
                        ),
                      );
                    },
                    itemCount: controller.storages.length,
                  );
      },
    );
  }
}
