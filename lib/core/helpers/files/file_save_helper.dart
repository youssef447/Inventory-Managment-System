import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../constants/app_assets.dart';
import '../../extensions/extensions.dart';
import '../../widgets/dialog/default_dialog.dart';
import '../get_dialog_helper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_selector/file_selector.dart';

//Youssef Ashraf
//Date: 10/11/2024
///Helper the provides Download for a specificfile
abstract class FileSaveHelper {
  static void saveFile(File file) async {
    try {
      late String path;

      if (Get.context!.isDesktop) {
        getSaveLocation(
          suggestedName: file.uri.pathSegments
              .last, // Use the original file name as suggestion
        ).then(
          (value) async {
            if (value != null) {
              path = value.path;
              await file.copy(path);
              GetDialogHelper.generalDialog(
                child: DefaultDialog(
                  width: Get.context!.isPhone ? 343.w : 411.w,
                  showButtons: false,
                  lottieAsset: AppAssets.success,
                  title: 'Saved'.tr,
                  subTitle: 'File Has Been Saved Successfully'.tr,
                ),
                context: Get.context!,
              );
            }
          },
        );
      } else {
        if (Platform.isAndroid || Platform.isIOS) {
          var status = await Permission.storage.request();
          if (!status.isGranted) {
            return;
          }
        }
        getApplicationDocumentsDirectory().then((value) async {
          path = '${value.path}/ ${file.uri.pathSegments.last}';
          final file2 = File(path);
          await file2.copy(path);
          GetDialogHelper.generalDialog(
            child: DefaultDialog(
              width: Get.context!.isPhone ? 343.w : 411.w,
              showButtons: false,
              lottieAsset: AppAssets.success,
              title: 'Saved'.tr,
              subTitle: 'File Has Been Saved Successfully'.tr,
            ),
            context: Get.context!,
          );
        });
      }
    } catch (e) {
      GetDialogHelper.generalDialog(
        child: const DefaultDialog(
          title: 'Error',
          subTitle: 'Couldn\'t Save File, Please Try Again.',
          icon: AppAssets.canceled,
          showButtons: false,
        ),
        context: Get.context!,
      );
    }
  }
}
