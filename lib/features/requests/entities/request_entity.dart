import 'attachment_entity.dart';

/// represents a request entity which is part of the inventory model.
class RequestEntity {
  int quantity;
  String requestId;
  String requestType;
  DateTime requestDate;
  String priority;
  String status;
  String maintenanceFrequency;
  String assetName;
  String category;
  String subCategory;
  String model;
  String brand;
  DateTime expectedRecieved;
  DateTime dateReturn;
  String? additionalNote;
  List<AttachmentEntity> attachments;

  RequestEntity({
    required this.requestId,
    required this.requestType,
    required this.requestDate,
    required this.priority,
    required this.maintenanceFrequency,
    required this.assetName,
    required this.category,
    required this.subCategory,
    required this.model,
    required this.brand,
    required this.expectedRecieved,
    required this.dateReturn,
    required this.quantity,
    required this.status,
    this.additionalNote,
    this.attachments = const [],
  });

  RequestEntity copyWith({
    String? requestId,
    String? requestType,
    DateTime? requestDate,
    String? priority,
    String? maintenanceFrequency,
    String? assetName,
    String? category,
    String? status,
    String? subCategory,
    String? model,
    String? brand,
    DateTime? expectedRecieved,
    DateTime? dateReturn,
    int? quantity,
    String? additionalNote,
    List<AttachmentEntity>? attachments,
  }) {
    return RequestEntity(
      requestId: requestId ?? this.requestId,
      status: status ?? this.status,
      requestType: requestType ?? this.requestType,
      requestDate: requestDate ?? this.requestDate,
      priority: priority ?? this.priority,
      maintenanceFrequency: maintenanceFrequency ?? this.maintenanceFrequency,
      assetName: assetName ?? this.assetName,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      expectedRecieved: expectedRecieved ?? this.expectedRecieved,
      dateReturn: dateReturn ?? this.dateReturn,
      quantity: quantity ?? this.quantity,
      additionalNote: additionalNote ?? this.additionalNote,
      attachments: attachments ?? this.attachments,
    );
  }
}
