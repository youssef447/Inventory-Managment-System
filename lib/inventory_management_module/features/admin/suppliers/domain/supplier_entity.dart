import '../../../../core/enums/business_type.dart';
import '../../../products/domain/subEntities/contract_details_entity.dart';

class SupplierEntity {
  String supplierName;
  String supplierId;
  String country;
  String stateOrProvince;
  String city;
  String postalCode;
  ContractdetailsEntity contractDetails;
  String firstName;
  String middleName;
  String lastName;
  String phoneNumber;
  BusinessType businessType = BusinessType.serviceProvicer;
  String catalogOfProduct = '';
  String title = 'Designer';
  String additionalNotes = '';
  String email;
  String taxNumber = '1111';
  SupplierEntity(
      {required this.supplierName,
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
      this.middleName = 'Ahmed'});
}
