import '../../../../core/enums/orders_status.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../../products/domain/product_entity.dart';

class OrderEntity {
  int quantity;
  String orderId;

  DateTime orderDate;
  String priority;
  String? maintenanceFrequency;
  ProductEntity productEntity;
  DateTime expectedRecieved;
  DateTime dateReturn;
  String? additionalNote;
  AttachmentEntity? invoice;
  OrderStatus orderStatus;

  OrderEntity({
    required this.orderId,
    required this.productEntity,
    required this.orderDate,
    required this.priority,
    this.maintenanceFrequency,
    this.quantity = 2,
    this.invoice,
    this.orderStatus = OrderStatus.pending,
    required this.expectedRecieved,
    required this.dateReturn,
    this.additionalNote,
  });
}
