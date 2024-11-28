import '../../../../core/enums/orders_status.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../../products/domain/product_entity.dart';

class OrderEntity {
  int quantity;
  String orderId;

  DateTime requestDate;
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
    required this.requestDate,
    required this.priority,
    this.maintenanceFrequency,
    this.invoice,
    this.orderStatus = OrderStatus.pending,
    required this.expectedRecieved,
    required this.dateReturn,
    required this.quantity,
    this.additionalNote,
  });
}
