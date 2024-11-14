//Youssef Ashraf
///Constants of Requests Headers Wihch are used in DataTable
abstract class RequestsColumns {
  static const List<String> requestAssetColumns = [
    'Request ID',
    'Request Type',
    'Request Date',
    'Status',
    'Priority',
    'Maintenance Frequency',
    'Asset Name',
    'Category',
    'Subcategory',
    'Model',
    'Brand',
    'Expected Received',
    'Date Return',
    'Quantity',
  ];
  static const List<String> requestConsumableColumns = [
    'Request ID',
    'Request Type',
    'Request Date',
    'Status',
    'Priority',
    'Expected Delivery',
    'Consumable ID',
    'Name',
    'Category',
    'Subcategory',
    'Model',
    'Brand',
    'Quantity',
    'Unit Of Measurement',
    'Reorder Level',
    'Reorder Quantity',
    'Usage Frequency',
  ];
}
