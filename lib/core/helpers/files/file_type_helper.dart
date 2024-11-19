import 'dart:io';
import 'package:mime/mime.dart';

import '../../constants/app_assets.dart';
import '../../enums/file_type_enums.dart';

//Youssef Ashraf
//Date: 10/11/2024
///Helper the provide the file type based on the file extension and the asset icon accordingly
abstract class FileTypeHelper {
  static FileType _getFileType(File file) {
    // Get the MIME type based on the file extension
    final mimeType = lookupMimeType(
      file.path,
    );

    // Check file type based on MIME type prefix
    if (mimeType == null) {
      return FileType.unknown;
    } else if (mimeType.startsWith('video/')) {
      return FileType.video;
    } else if (mimeType.startsWith('image/')) {
      return FileType.image;
    } else if (mimeType == 'application/pdf') {
      return FileType.pdf;
    } else if (mimeType == 'application/vnd.ms-powerpoint' ||
        mimeType ==
            'application/vnd.openxmlformats-officedocument.presentationml.presentation') {
      return FileType.powerpoint;
    } else if (mimeType == 'text/plain') {
      return FileType.text;
    }

    return FileType.unknown;
  }

  static String getExstensionImage(File file) {
    final fileType = _getFileType(file);
    if (fileType == FileType.video) {
      return AppAssets.video;
    }
    if (fileType == FileType.image) {
      return AppAssets.gallery;
    }
    if (fileType == FileType.pdf) {
      return AppAssets.pdf;
    }
    if (fileType == FileType.powerpoint) {
      return AppAssets.powerpoint;
    }
    if (fileType == FileType.text) {
      return AppAssets.text;
    }
    return AppAssets.unknown;
  }
}
