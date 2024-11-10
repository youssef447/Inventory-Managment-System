import 'dart:io';
import 'package:mime/mime.dart';

import '../constants/app_assets.dart';

//Youssef Ashraf
//Date: 10/11/2024
///Helper the provide the file type based on the file extension and the asset icon accordingly
abstract class FileTypeHelper {
  static String getFileType(File file) {
    // Get the MIME type based on the file extension
    final mimeType = lookupMimeType(
      file.path,
    );

    // Check file type based on MIME type prefix
    if (mimeType == null) {
      return 'unknown';
    } else if (mimeType.startsWith('video/')) {
      return 'video';
    } else if (mimeType.startsWith('image/')) {
      return 'image';
    } else if (mimeType == 'application/pdf') {
      return 'pdf';
    } else if (mimeType == 'application/vnd.ms-powerpoint' ||
        mimeType ==
            'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
      return 'powerpoint';
    } else if (mimeType == 'text/plain') {
      return 'text';
    }

    return 'unknown';
  }

  String getExstensionImage(File file) {
    final fileType = getFileType(file);
    if (fileType == 'video') {
      return AppAssets.video;
    }
    if (fileType == 'image') {
      return AppAssets.gallery;
    }
    if (fileType == 'pdf') {
      return AppAssets.pdf;
    }
    if (fileType == 'powerpoint') {
      return AppAssets.powerpoint;
    }
    if (fileType == 'text') {
      return AppAssets.text;
    }
    return AppAssets.unknown;
  }
}
