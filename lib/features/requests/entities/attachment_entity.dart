import 'dart:io';
import 'dart:typed_data';

//Youssef Ashraf
class AttachmentEntity {
  String extension;
  String? fileName;
  String? link;

  double totalSize;
  int totalPages;
  File file;
  Uint8List? firstPageBytes;

  AttachmentEntity({
    this.totalSize = 0,
    this.totalPages = 0,
    this.extension = '',
    required this.file,
    this.link,
    this.fileName,
  }) {
    fileName = file.path.contains('\\')
        ? file.path.split('\\').last
        : file.path.split('/').last;
    extension = fileName!.split('.').last;
    totalSize = file.lengthSync() / (1024 * 1024);
  }

  AttachmentEntity copyWith({
    double? totalSize,
    int? totalPages,
    String? extension,
    File? file,
  }) {
    return AttachmentEntity(
      totalSize: totalSize ?? this.totalSize,
      file: file ?? this.file,
      totalPages: totalPages ?? this.totalPages,
      extension: extension ?? this.extension,
    );
  }
}
