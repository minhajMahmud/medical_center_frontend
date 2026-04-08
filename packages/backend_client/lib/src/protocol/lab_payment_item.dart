/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class LabPaymentItem implements _i1.SerializableModel {
  LabPaymentItem._({
    required this.resultId,
    required this.testId,
    required this.serialNo,
    required this.patientName,
    required this.mobileNumber,
    required this.patientType,
    required this.testName,
    required this.amount,
    required this.createdAt,
    required this.isUploaded,
    this.submittedAt,
    required this.paymentStatus,
    this.paymentMethod,
    this.transactionId,
    this.paidAt,
    this.patientNotifiedAt,
  });

  factory LabPaymentItem({
    required int resultId,
    required int testId,
    required String serialNo,
    required String patientName,
    required String mobileNumber,
    required String patientType,
    required String testName,
    required double amount,
    required DateTime createdAt,
    required bool isUploaded,
    DateTime? submittedAt,
    required String paymentStatus,
    String? paymentMethod,
    String? transactionId,
    DateTime? paidAt,
    DateTime? patientNotifiedAt,
  }) = _LabPaymentItemImpl;

  factory LabPaymentItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return LabPaymentItem(
      resultId: jsonSerialization['resultId'] as int,
      testId: jsonSerialization['testId'] as int,
      serialNo: jsonSerialization['serialNo'] as String,
      patientName: jsonSerialization['patientName'] as String,
      mobileNumber: jsonSerialization['mobileNumber'] as String,
      patientType: jsonSerialization['patientType'] as String,
      testName: jsonSerialization['testName'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      isUploaded: jsonSerialization['isUploaded'] as bool,
      submittedAt: jsonSerialization['submittedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['submittedAt'],
            ),
      paymentStatus: jsonSerialization['paymentStatus'] as String,
      paymentMethod: jsonSerialization['paymentMethod'] as String?,
      transactionId: jsonSerialization['transactionId'] as String?,
      paidAt: jsonSerialization['paidAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['paidAt']),
      patientNotifiedAt: jsonSerialization['patientNotifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['patientNotifiedAt'],
            ),
    );
  }

  int resultId;

  int testId;

  String serialNo;

  String patientName;

  String mobileNumber;

  String patientType;

  String testName;

  double amount;

  DateTime createdAt;

  bool isUploaded;

  DateTime? submittedAt;

  String paymentStatus;

  String? paymentMethod;

  String? transactionId;

  DateTime? paidAt;

  DateTime? patientNotifiedAt;

  /// Returns a shallow copy of this [LabPaymentItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LabPaymentItem copyWith({
    int? resultId,
    int? testId,
    String? serialNo,
    String? patientName,
    String? mobileNumber,
    String? patientType,
    String? testName,
    double? amount,
    DateTime? createdAt,
    bool? isUploaded,
    DateTime? submittedAt,
    String? paymentStatus,
    String? paymentMethod,
    String? transactionId,
    DateTime? paidAt,
    DateTime? patientNotifiedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LabPaymentItem',
      'resultId': resultId,
      'testId': testId,
      'serialNo': serialNo,
      'patientName': patientName,
      'mobileNumber': mobileNumber,
      'patientType': patientType,
      'testName': testName,
      'amount': amount,
      'createdAt': createdAt.toJson(),
      'isUploaded': isUploaded,
      if (submittedAt != null) 'submittedAt': submittedAt?.toJson(),
      'paymentStatus': paymentStatus,
      if (paymentMethod != null) 'paymentMethod': paymentMethod,
      if (transactionId != null) 'transactionId': transactionId,
      if (paidAt != null) 'paidAt': paidAt?.toJson(),
      if (patientNotifiedAt != null)
        'patientNotifiedAt': patientNotifiedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LabPaymentItemImpl extends LabPaymentItem {
  _LabPaymentItemImpl({
    required int resultId,
    required int testId,
    required String serialNo,
    required String patientName,
    required String mobileNumber,
    required String patientType,
    required String testName,
    required double amount,
    required DateTime createdAt,
    required bool isUploaded,
    DateTime? submittedAt,
    required String paymentStatus,
    String? paymentMethod,
    String? transactionId,
    DateTime? paidAt,
    DateTime? patientNotifiedAt,
  }) : super._(
         resultId: resultId,
         testId: testId,
         serialNo: serialNo,
         patientName: patientName,
         mobileNumber: mobileNumber,
         patientType: patientType,
         testName: testName,
         amount: amount,
         createdAt: createdAt,
         isUploaded: isUploaded,
         submittedAt: submittedAt,
         paymentStatus: paymentStatus,
         paymentMethod: paymentMethod,
         transactionId: transactionId,
         paidAt: paidAt,
         patientNotifiedAt: patientNotifiedAt,
       );

  /// Returns a shallow copy of this [LabPaymentItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LabPaymentItem copyWith({
    int? resultId,
    int? testId,
    String? serialNo,
    String? patientName,
    String? mobileNumber,
    String? patientType,
    String? testName,
    double? amount,
    DateTime? createdAt,
    bool? isUploaded,
    Object? submittedAt = _Undefined,
    String? paymentStatus,
    Object? paymentMethod = _Undefined,
    Object? transactionId = _Undefined,
    Object? paidAt = _Undefined,
    Object? patientNotifiedAt = _Undefined,
  }) {
    return LabPaymentItem(
      resultId: resultId ?? this.resultId,
      testId: testId ?? this.testId,
      serialNo: serialNo ?? this.serialNo,
      patientName: patientName ?? this.patientName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      patientType: patientType ?? this.patientType,
      testName: testName ?? this.testName,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      isUploaded: isUploaded ?? this.isUploaded,
      submittedAt: submittedAt is DateTime? ? submittedAt : this.submittedAt,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentMethod: paymentMethod is String?
          ? paymentMethod
          : this.paymentMethod,
      transactionId: transactionId is String?
          ? transactionId
          : this.transactionId,
      paidAt: paidAt is DateTime? ? paidAt : this.paidAt,
      patientNotifiedAt: patientNotifiedAt is DateTime?
          ? patientNotifiedAt
          : this.patientNotifiedAt,
    );
  }
}
