import '../../../core/enums/requests_enums.dart';

abstract class RequestStatusConstants {
  static const List<RequestStatus> requestsStatus = [
    RequestStatus.approved,
    RequestStatus.pending,
    RequestStatus.cancelled,
    RequestStatus.rejected
  ];
}
