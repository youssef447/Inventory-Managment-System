///Class Overview The RequestEntity class represents a request entity which is part of the inventory model.
class RequestEntity {
  String requestId;
  String requestType;
  DateTime requestDate;
  String priority;
  String maintenanceFrequency;
  String assetName;
  String category;
  String subCategory;
  String model;
  String brand;
  DateTime expectedRecieved;
  DateTime dateReturn;
  int quantity;
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
  });

  RequestEntity copyWith({
    String? requestId,
    String? requestType,
    DateTime? requestDate,
    String? priority,
    String? maintenanceFrequency,
    String? assetName,
    String? category,
    String? subCategory,
    String? model,
    String? brand,
    DateTime? expectedRecieved,
    DateTime? dateReturn,
    int? quantity,
  }) {
    return RequestEntity(
      requestId: requestId ?? this.requestId,
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
    );
  }
}
