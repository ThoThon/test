import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class UpdateUnitInfoRequest extends Equatable implements Entity {
  final String organizationId;
  final String organizationName;
  final String registeredAddress;
  final String address;
  final String contactEmail;
  final String signerName;
  final String receiverPhone;
  final String jobTitle;
  final String objectType;
  final String declarerName;
  final int salary;
  final int paymentMethod;
  final String resultReceivingMethod;

  const UpdateUnitInfoRequest({
    required this.organizationId,
    required this.organizationName,
    required this.registeredAddress,
    required this.address,
    required this.contactEmail,
    required this.signerName,
    required this.receiverPhone,
    required this.jobTitle,
    required this.objectType,
    required this.declarerName,
    required this.salary,
    required this.paymentMethod,
    required this.resultReceivingMethod,
  });

  @override
  List<Object?> get props => [
        organizationId,
        organizationName,
        registeredAddress,
        address,
        contactEmail,
        signerName,
        receiverPhone,
        jobTitle,
        objectType,
        declarerName,
        salary,
        paymentMethod,
        resultReceivingMethod,
      ];
}
