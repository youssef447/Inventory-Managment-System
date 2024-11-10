// Date: 7/11/2024
// By:Mohamed Ashraf

class ConsumablesEntity {
  final String consumableId;
  final String name;
  final String category;
  final String subcategory;
  final String model;
  final String brand;
  final DateTime dateReceived;
  final String quantity;
  final String unitOfMeasurement;
  final String usageFrequency;
  final DateTime? expirationDate;
  final String status;

  ConsumablesEntity(
      {required this.consumableId,
      required this.name,
      required this.category,
      required this.subcategory,
      required this.model,
      required this.brand,
      required this.dateReceived,
      required this.quantity,
      required this.unitOfMeasurement,
      required this.usageFrequency,
      this.expirationDate,
      required this.status});
}
