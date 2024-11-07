import '../../../core/enums/requests_enums.dart';

abstract class RequestStatusConstants {
  static const List<RequestStatus> categories = [
    RequestStatus.approved,
    RequestStatus.pending,
    RequestStatus.cancelled,
    RequestStatus.rejected
  ];
}
