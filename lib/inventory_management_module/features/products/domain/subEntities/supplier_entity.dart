import 'contract_details_entity.dart';

class SupplierEntity {
  String supplierName;
  String supplierId;
  String country;
  String stateOrProvince;
  String city;
  String postalCode;
  ContractdetailsEntity contractDetails;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  SupplierEntity({
    required this.supplierName,
    required this.supplierId,
    required this.country,
    required this.stateOrProvince,
    required this.city,
    required this.postalCode,
    required this.contractDetails,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });
}
