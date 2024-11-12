// Date: 7/11/2024
// By:Mohamed Ashraf

import 'package:inventory_management/core/constants/app_assets.dart';

import '../../requests/entities/attachment_entity.dart';

class ApprovalEntity {
  final String image = AppAssets.user;
  final String userName;
  final String approvalId;
  final DateTime requestDate;
  final String requestType;
  final String assetName;
  final String category;
  final String subcategory;
  final String model;
  final String brand;
  final int quantity;
  final int availability;
  final String priority;
  final DateTime expectedDelivery;
  final DateTime expectedReturn;
  final String? additionalNote;
  final String status;
  List<AttachmentEntity> attachments;

  ApprovalEntity(
      {required this.userName,
        required this.approvalId,
        required this.requestDate,
      required this.requestType,
      required this.assetName,
      required this.category,
      required this.subcategory,
      required this.model,
      required this.brand,
      required this.quantity,
      required this.availability,
      required this.priority,
      required this.expectedDelivery,
      required this.expectedReturn,
        required this.status,
       this.additionalNote,
       this.attachments = const [],
      });
}
