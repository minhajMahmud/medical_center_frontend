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
import 'InventoryCategory.dart' as _i2;
import 'InventoryItemInfo.dart' as _i3;
import 'PrescribedItem.dart' as _i4;
import 'StaffInfo.dart' as _i5;
import 'admin_dashboard_overview.dart' as _i6;
import 'admin_profile.dart' as _i7;
import 'ambulance_contact.dart' as _i8;
import 'appointment_request_item.dart' as _i9;
import 'audit_entry.dart' as _i10;
import 'dashboard_analytics.dart' as _i11;
import 'dispense_history_entry.dart' as _i12;
import 'dispense_item_detail.dart' as _i13;
import 'dispense_request.dart' as _i14;
import 'dispensed_item_input.dart' as _i15;
import 'dispensed_item_summary.dart' as _i16;
import 'dispenser_profile_r.dart' as _i17;
import 'doctor_home_data.dart' as _i18;
import 'doctor_home_recent_item.dart' as _i19;
import 'doctor_home_reviewed_report.dart' as _i20;
import 'doctor_profile.dart' as _i21;
import 'external_report_file.dart' as _i22;
import 'greeting.dart' as _i23;
import 'inventory_audit_log.dart' as _i24;
import 'inventory_transaction.dart' as _i25;
import 'lab_analytics_category_count.dart' as _i26;
import 'lab_analytics_daily_point.dart' as _i27;
import 'lab_analytics_shift_stat.dart' as _i28;
import 'lab_analytics_snapshot.dart' as _i29;
import 'lab_analytics_test_count.dart' as _i30;
import 'lab_payment_item.dart' as _i31;
import 'lab_ten_history.dart' as _i32;
import 'lab_today.dart' as _i33;
import 'login_response.dart' as _i34;
import 'medicine_alternative.dart' as _i35;
import 'medicine_details.dart' as _i36;
import 'notification.dart' as _i37;
import 'onduty_staff.dart' as _i38;
import 'otp_challenge_response.dart' as _i39;
import 'patient_external_report.dart' as _i40;
import 'patient_record_list.dart' as _i41;
import 'patient_record_prescribed_item.dart' as _i42;
import 'patient_record_prescription_details.dart' as _i43;
import 'patient_reponse.dart' as _i44;
import 'patient_report.dart' as _i45;
import 'patient_return_tests.dart' as _i46;
import 'prescription.dart' as _i47;
import 'prescription_detail.dart' as _i48;
import 'prescription_list.dart' as _i49;
import 'report_lab_test_range.dart' as _i50;
import 'report_medicine_stock_range.dart' as _i51;
import 'report_monthly.dart' as _i52;
import 'report_prescription.dart' as _i53;
import 'report_stock.dart' as _i54;
import 'report_top_medicine.dart' as _i55;
import 'roster_data.dart' as _i56;
import 'roster_lists.dart' as _i57;
import 'roster_user_role.dart' as _i58;
import 'shift_type.dart' as _i59;
import 'staff_profile.dart' as _i60;
import 'test_result_create_upload.dart' as _i61;
import 'user_list_item.dart' as _i62;
import 'package:backend_client/src/protocol/user_list_item.dart' as _i63;
import 'package:backend_client/src/protocol/roster_data.dart' as _i64;
import 'package:backend_client/src/protocol/roster_lists.dart' as _i65;
import 'package:backend_client/src/protocol/audit_entry.dart' as _i66;
import 'package:backend_client/src/protocol/InventoryCategory.dart' as _i67;
import 'package:backend_client/src/protocol/InventoryItemInfo.dart' as _i68;
import 'package:backend_client/src/protocol/inventory_transaction.dart' as _i69;
import 'package:backend_client/src/protocol/inventory_audit_log.dart' as _i70;
import 'package:backend_client/src/protocol/report_top_medicine.dart' as _i71;
import 'package:backend_client/src/protocol/report_medicine_stock_range.dart'
    as _i72;
import 'package:backend_client/src/protocol/report_lab_test_range.dart' as _i73;
import 'package:backend_client/src/protocol/prescription.dart' as _i74;
import 'package:backend_client/src/protocol/dispense_request.dart' as _i75;
import 'package:backend_client/src/protocol/dispense_history_entry.dart'
    as _i76;
import 'package:backend_client/src/protocol/PrescribedItem.dart' as _i77;
import 'package:backend_client/src/protocol/patient_external_report.dart'
    as _i78;
import 'package:backend_client/src/protocol/patient_record_list.dart' as _i79;
import 'package:backend_client/src/protocol/appointment_request_item.dart'
    as _i80;
import 'package:backend_client/src/protocol/patient_return_tests.dart' as _i81;
import 'package:backend_client/src/protocol/lab_payment_item.dart' as _i82;
import 'package:backend_client/src/protocol/test_result_create_upload.dart'
    as _i83;
import 'package:backend_client/src/protocol/lab_ten_history.dart' as _i84;
import 'package:backend_client/src/protocol/notification.dart' as _i85;
import 'package:backend_client/src/protocol/patient_report.dart' as _i86;
import 'package:backend_client/src/protocol/prescription_list.dart' as _i87;
import 'package:backend_client/src/protocol/StaffInfo.dart' as _i88;
import 'package:backend_client/src/protocol/ambulance_contact.dart' as _i89;
import 'package:backend_client/src/protocol/onduty_staff.dart' as _i90;
export 'InventoryCategory.dart';
export 'InventoryItemInfo.dart';
export 'PrescribedItem.dart';
export 'StaffInfo.dart';
export 'admin_dashboard_overview.dart';
export 'admin_profile.dart';
export 'ambulance_contact.dart';
export 'appointment_request_item.dart';
export 'audit_entry.dart';
export 'dashboard_analytics.dart';
export 'dispense_history_entry.dart';
export 'dispense_item_detail.dart';
export 'dispense_request.dart';
export 'dispensed_item_input.dart';
export 'dispensed_item_summary.dart';
export 'dispenser_profile_r.dart';
export 'doctor_home_data.dart';
export 'doctor_home_recent_item.dart';
export 'doctor_home_reviewed_report.dart';
export 'doctor_profile.dart';
export 'external_report_file.dart';
export 'greeting.dart';
export 'inventory_audit_log.dart';
export 'inventory_transaction.dart';
export 'lab_analytics_category_count.dart';
export 'lab_analytics_daily_point.dart';
export 'lab_analytics_shift_stat.dart';
export 'lab_analytics_snapshot.dart';
export 'lab_analytics_test_count.dart';
export 'lab_payment_item.dart';
export 'lab_ten_history.dart';
export 'lab_today.dart';
export 'login_response.dart';
export 'medicine_alternative.dart';
export 'medicine_details.dart';
export 'notification.dart';
export 'onduty_staff.dart';
export 'otp_challenge_response.dart';
export 'patient_external_report.dart';
export 'patient_record_list.dart';
export 'patient_record_prescribed_item.dart';
export 'patient_record_prescription_details.dart';
export 'patient_reponse.dart';
export 'patient_report.dart';
export 'patient_return_tests.dart';
export 'prescription.dart';
export 'prescription_detail.dart';
export 'prescription_list.dart';
export 'report_lab_test_range.dart';
export 'report_medicine_stock_range.dart';
export 'report_monthly.dart';
export 'report_prescription.dart';
export 'report_stock.dart';
export 'report_top_medicine.dart';
export 'roster_data.dart';
export 'roster_lists.dart';
export 'roster_user_role.dart';
export 'shift_type.dart';
export 'staff_profile.dart';
export 'test_result_create_upload.dart';
export 'user_list_item.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.InventoryCategory) {
      return _i2.InventoryCategory.fromJson(data) as T;
    }
    if (t == _i3.InventoryItemInfo) {
      return _i3.InventoryItemInfo.fromJson(data) as T;
    }
    if (t == _i4.PrescribedItem) {
      return _i4.PrescribedItem.fromJson(data) as T;
    }
    if (t == _i5.StaffInfo) {
      return _i5.StaffInfo.fromJson(data) as T;
    }
    if (t == _i6.AdminDashboardOverview) {
      return _i6.AdminDashboardOverview.fromJson(data) as T;
    }
    if (t == _i7.AdminProfileRespond) {
      return _i7.AdminProfileRespond.fromJson(data) as T;
    }
    if (t == _i8.AmbulanceContact) {
      return _i8.AmbulanceContact.fromJson(data) as T;
    }
    if (t == _i9.AppointmentRequestItem) {
      return _i9.AppointmentRequestItem.fromJson(data) as T;
    }
    if (t == _i10.AuditEntry) {
      return _i10.AuditEntry.fromJson(data) as T;
    }
    if (t == _i11.DashboardAnalytics) {
      return _i11.DashboardAnalytics.fromJson(data) as T;
    }
    if (t == _i12.DispenseHistoryEntry) {
      return _i12.DispenseHistoryEntry.fromJson(data) as T;
    }
    if (t == _i13.DispenseItemDetail) {
      return _i13.DispenseItemDetail.fromJson(data) as T;
    }
    if (t == _i14.DispenseItemRequest) {
      return _i14.DispenseItemRequest.fromJson(data) as T;
    }
    if (t == _i15.DispensedItemInput) {
      return _i15.DispensedItemInput.fromJson(data) as T;
    }
    if (t == _i16.DispensedItemSummary) {
      return _i16.DispensedItemSummary.fromJson(data) as T;
    }
    if (t == _i17.DispenserProfileR) {
      return _i17.DispenserProfileR.fromJson(data) as T;
    }
    if (t == _i18.DoctorHomeData) {
      return _i18.DoctorHomeData.fromJson(data) as T;
    }
    if (t == _i19.DoctorHomeRecentItem) {
      return _i19.DoctorHomeRecentItem.fromJson(data) as T;
    }
    if (t == _i20.DoctorHomeReviewedReport) {
      return _i20.DoctorHomeReviewedReport.fromJson(data) as T;
    }
    if (t == _i21.DoctorProfile) {
      return _i21.DoctorProfile.fromJson(data) as T;
    }
    if (t == _i22.ExternalReportFile) {
      return _i22.ExternalReportFile.fromJson(data) as T;
    }
    if (t == _i23.Greeting) {
      return _i23.Greeting.fromJson(data) as T;
    }
    if (t == _i24.InventoryAuditLog) {
      return _i24.InventoryAuditLog.fromJson(data) as T;
    }
    if (t == _i25.InventoryTransactionInfo) {
      return _i25.InventoryTransactionInfo.fromJson(data) as T;
    }
    if (t == _i26.LabAnalyticsCategoryCount) {
      return _i26.LabAnalyticsCategoryCount.fromJson(data) as T;
    }
    if (t == _i27.LabAnalyticsDailyPoint) {
      return _i27.LabAnalyticsDailyPoint.fromJson(data) as T;
    }
    if (t == _i28.LabAnalyticsShiftStat) {
      return _i28.LabAnalyticsShiftStat.fromJson(data) as T;
    }
    if (t == _i29.LabAnalyticsSnapshot) {
      return _i29.LabAnalyticsSnapshot.fromJson(data) as T;
    }
    if (t == _i30.LabAnalyticsTestCount) {
      return _i30.LabAnalyticsTestCount.fromJson(data) as T;
    }
    if (t == _i31.LabPaymentItem) {
      return _i31.LabPaymentItem.fromJson(data) as T;
    }
    if (t == _i32.LabTenHistory) {
      return _i32.LabTenHistory.fromJson(data) as T;
    }
    if (t == _i33.LabToday) {
      return _i33.LabToday.fromJson(data) as T;
    }
    if (t == _i34.LoginResponse) {
      return _i34.LoginResponse.fromJson(data) as T;
    }
    if (t == _i35.MedicineAlternative) {
      return _i35.MedicineAlternative.fromJson(data) as T;
    }
    if (t == _i36.MedicineDetail) {
      return _i36.MedicineDetail.fromJson(data) as T;
    }
    if (t == _i37.NotificationInfo) {
      return _i37.NotificationInfo.fromJson(data) as T;
    }
    if (t == _i38.OndutyStaff) {
      return _i38.OndutyStaff.fromJson(data) as T;
    }
    if (t == _i39.OtpChallengeResponse) {
      return _i39.OtpChallengeResponse.fromJson(data) as T;
    }
    if (t == _i40.PatientExternalReport) {
      return _i40.PatientExternalReport.fromJson(data) as T;
    }
    if (t == _i41.PatientPrescriptionListItem) {
      return _i41.PatientPrescriptionListItem.fromJson(data) as T;
    }
    if (t == _i42.PatientPrescribedItem) {
      return _i42.PatientPrescribedItem.fromJson(data) as T;
    }
    if (t == _i43.PatientPrescriptionDetails) {
      return _i43.PatientPrescriptionDetails.fromJson(data) as T;
    }
    if (t == _i44.PatientProfile) {
      return _i44.PatientProfile.fromJson(data) as T;
    }
    if (t == _i45.PatientReportDto) {
      return _i45.PatientReportDto.fromJson(data) as T;
    }
    if (t == _i46.LabTests) {
      return _i46.LabTests.fromJson(data) as T;
    }
    if (t == _i47.Prescription) {
      return _i47.Prescription.fromJson(data) as T;
    }
    if (t == _i48.PrescriptionDetail) {
      return _i48.PrescriptionDetail.fromJson(data) as T;
    }
    if (t == _i49.PrescriptionList) {
      return _i49.PrescriptionList.fromJson(data) as T;
    }
    if (t == _i50.LabTestRangeRow) {
      return _i50.LabTestRangeRow.fromJson(data) as T;
    }
    if (t == _i51.MedicineStockRangeRow) {
      return _i51.MedicineStockRangeRow.fromJson(data) as T;
    }
    if (t == _i52.MonthlyBreakdown) {
      return _i52.MonthlyBreakdown.fromJson(data) as T;
    }
    if (t == _i53.PrescriptionStats) {
      return _i53.PrescriptionStats.fromJson(data) as T;
    }
    if (t == _i54.StockReport) {
      return _i54.StockReport.fromJson(data) as T;
    }
    if (t == _i55.TopMedicine) {
      return _i55.TopMedicine.fromJson(data) as T;
    }
    if (t == _i56.Roster) {
      return _i56.Roster.fromJson(data) as T;
    }
    if (t == _i57.Rosterlists) {
      return _i57.Rosterlists.fromJson(data) as T;
    }
    if (t == _i58.RosterUserRole) {
      return _i58.RosterUserRole.fromJson(data) as T;
    }
    if (t == _i59.ShiftType) {
      return _i59.ShiftType.fromJson(data) as T;
    }
    if (t == _i60.StaffProfileDto) {
      return _i60.StaffProfileDto.fromJson(data) as T;
    }
    if (t == _i61.TestResult) {
      return _i61.TestResult.fromJson(data) as T;
    }
    if (t == _i62.UserListItem) {
      return _i62.UserListItem.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.InventoryCategory?>()) {
      return (data != null ? _i2.InventoryCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.InventoryItemInfo?>()) {
      return (data != null ? _i3.InventoryItemInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PrescribedItem?>()) {
      return (data != null ? _i4.PrescribedItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.StaffInfo?>()) {
      return (data != null ? _i5.StaffInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AdminDashboardOverview?>()) {
      return (data != null ? _i6.AdminDashboardOverview.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.AdminProfileRespond?>()) {
      return (data != null ? _i7.AdminProfileRespond.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.AmbulanceContact?>()) {
      return (data != null ? _i8.AmbulanceContact.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AppointmentRequestItem?>()) {
      return (data != null ? _i9.AppointmentRequestItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.AuditEntry?>()) {
      return (data != null ? _i10.AuditEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DashboardAnalytics?>()) {
      return (data != null ? _i11.DashboardAnalytics.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.DispenseHistoryEntry?>()) {
      return (data != null ? _i12.DispenseHistoryEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.DispenseItemDetail?>()) {
      return (data != null ? _i13.DispenseItemDetail.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.DispenseItemRequest?>()) {
      return (data != null ? _i14.DispenseItemRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.DispensedItemInput?>()) {
      return (data != null ? _i15.DispensedItemInput.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.DispensedItemSummary?>()) {
      return (data != null ? _i16.DispensedItemSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.DispenserProfileR?>()) {
      return (data != null ? _i17.DispenserProfileR.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DoctorHomeData?>()) {
      return (data != null ? _i18.DoctorHomeData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DoctorHomeRecentItem?>()) {
      return (data != null ? _i19.DoctorHomeRecentItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.DoctorHomeReviewedReport?>()) {
      return (data != null
              ? _i20.DoctorHomeReviewedReport.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i21.DoctorProfile?>()) {
      return (data != null ? _i21.DoctorProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.ExternalReportFile?>()) {
      return (data != null ? _i22.ExternalReportFile.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i23.Greeting?>()) {
      return (data != null ? _i23.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.InventoryAuditLog?>()) {
      return (data != null ? _i24.InventoryAuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.InventoryTransactionInfo?>()) {
      return (data != null
              ? _i25.InventoryTransactionInfo.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i26.LabAnalyticsCategoryCount?>()) {
      return (data != null
              ? _i26.LabAnalyticsCategoryCount.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i27.LabAnalyticsDailyPoint?>()) {
      return (data != null ? _i27.LabAnalyticsDailyPoint.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.LabAnalyticsShiftStat?>()) {
      return (data != null ? _i28.LabAnalyticsShiftStat.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.LabAnalyticsSnapshot?>()) {
      return (data != null ? _i29.LabAnalyticsSnapshot.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.LabAnalyticsTestCount?>()) {
      return (data != null ? _i30.LabAnalyticsTestCount.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.LabPaymentItem?>()) {
      return (data != null ? _i31.LabPaymentItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.LabTenHistory?>()) {
      return (data != null ? _i32.LabTenHistory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.LabToday?>()) {
      return (data != null ? _i33.LabToday.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.LoginResponse?>()) {
      return (data != null ? _i34.LoginResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.MedicineAlternative?>()) {
      return (data != null ? _i35.MedicineAlternative.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.MedicineDetail?>()) {
      return (data != null ? _i36.MedicineDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.NotificationInfo?>()) {
      return (data != null ? _i37.NotificationInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.OndutyStaff?>()) {
      return (data != null ? _i38.OndutyStaff.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.OtpChallengeResponse?>()) {
      return (data != null ? _i39.OtpChallengeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.PatientExternalReport?>()) {
      return (data != null ? _i40.PatientExternalReport.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.PatientPrescriptionListItem?>()) {
      return (data != null
              ? _i41.PatientPrescriptionListItem.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i42.PatientPrescribedItem?>()) {
      return (data != null ? _i42.PatientPrescribedItem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.PatientPrescriptionDetails?>()) {
      return (data != null
              ? _i43.PatientPrescriptionDetails.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i44.PatientProfile?>()) {
      return (data != null ? _i44.PatientProfile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.PatientReportDto?>()) {
      return (data != null ? _i45.PatientReportDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.LabTests?>()) {
      return (data != null ? _i46.LabTests.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.Prescription?>()) {
      return (data != null ? _i47.Prescription.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.PrescriptionDetail?>()) {
      return (data != null ? _i48.PrescriptionDetail.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.PrescriptionList?>()) {
      return (data != null ? _i49.PrescriptionList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.LabTestRangeRow?>()) {
      return (data != null ? _i50.LabTestRangeRow.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.MedicineStockRangeRow?>()) {
      return (data != null ? _i51.MedicineStockRangeRow.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.MonthlyBreakdown?>()) {
      return (data != null ? _i52.MonthlyBreakdown.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.PrescriptionStats?>()) {
      return (data != null ? _i53.PrescriptionStats.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.StockReport?>()) {
      return (data != null ? _i54.StockReport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.TopMedicine?>()) {
      return (data != null ? _i55.TopMedicine.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.Roster?>()) {
      return (data != null ? _i56.Roster.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.Rosterlists?>()) {
      return (data != null ? _i57.Rosterlists.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.RosterUserRole?>()) {
      return (data != null ? _i58.RosterUserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.ShiftType?>()) {
      return (data != null ? _i59.ShiftType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.StaffProfileDto?>()) {
      return (data != null ? _i60.StaffProfileDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.TestResult?>()) {
      return (data != null ? _i61.TestResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.UserListItem?>()) {
      return (data != null ? _i62.UserListItem.fromJson(data) : null) as T;
    }
    if (t == List<_i52.MonthlyBreakdown>) {
      return (data as List)
              .map((e) => deserialize<_i52.MonthlyBreakdown>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.TopMedicine>) {
      return (data as List)
              .map((e) => deserialize<_i55.TopMedicine>(e))
              .toList()
          as T;
    }
    if (t == List<_i54.StockReport>) {
      return (data as List)
              .map((e) => deserialize<_i54.StockReport>(e))
              .toList()
          as T;
    }
    if (t == List<_i16.DispensedItemSummary>) {
      return (data as List)
              .map((e) => deserialize<_i16.DispensedItemSummary>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.DoctorHomeRecentItem>) {
      return (data as List)
              .map((e) => deserialize<_i19.DoctorHomeRecentItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i20.DoctorHomeReviewedReport>) {
      return (data as List)
              .map((e) => deserialize<_i20.DoctorHomeReviewedReport>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.LabAnalyticsDailyPoint>) {
      return (data as List)
              .map((e) => deserialize<_i27.LabAnalyticsDailyPoint>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.LabAnalyticsTestCount>) {
      return (data as List)
              .map((e) => deserialize<_i30.LabAnalyticsTestCount>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.LabAnalyticsCategoryCount>) {
      return (data as List)
              .map((e) => deserialize<_i26.LabAnalyticsCategoryCount>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.LabAnalyticsShiftStat>) {
      return (data as List)
              .map((e) => deserialize<_i28.LabAnalyticsShiftStat>(e))
              .toList()
          as T;
    }
    if (t == List<_i42.PatientPrescribedItem>) {
      return (data as List)
              .map((e) => deserialize<_i42.PatientPrescribedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i4.PrescribedItem>) {
      return (data as List)
              .map((e) => deserialize<_i4.PrescribedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i63.UserListItem>) {
      return (data as List)
              .map((e) => deserialize<_i63.UserListItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.Roster>) {
      return (data as List).map((e) => deserialize<_i64.Roster>(e)).toList()
          as T;
    }
    if (t == List<_i65.Rosterlists>) {
      return (data as List)
              .map((e) => deserialize<_i65.Rosterlists>(e))
              .toList()
          as T;
    }
    if (t == List<_i66.AuditEntry>) {
      return (data as List).map((e) => deserialize<_i66.AuditEntry>(e)).toList()
          as T;
    }
    if (t == List<_i67.InventoryCategory>) {
      return (data as List)
              .map((e) => deserialize<_i67.InventoryCategory>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.InventoryItemInfo>) {
      return (data as List)
              .map((e) => deserialize<_i68.InventoryItemInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.InventoryTransactionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i69.InventoryTransactionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i70.InventoryAuditLog>) {
      return (data as List)
              .map((e) => deserialize<_i70.InventoryAuditLog>(e))
              .toList()
          as T;
    }
    if (t == List<_i71.TopMedicine>) {
      return (data as List)
              .map((e) => deserialize<_i71.TopMedicine>(e))
              .toList()
          as T;
    }
    if (t == List<_i72.MedicineStockRangeRow>) {
      return (data as List)
              .map((e) => deserialize<_i72.MedicineStockRangeRow>(e))
              .toList()
          as T;
    }
    if (t == List<DateTime>) {
      return (data as List).map((e) => deserialize<DateTime>(e)).toList() as T;
    }
    if (t == List<_i73.LabTestRangeRow>) {
      return (data as List)
              .map((e) => deserialize<_i73.LabTestRangeRow>(e))
              .toList()
          as T;
    }
    if (t == List<_i74.Prescription>) {
      return (data as List)
              .map((e) => deserialize<_i74.Prescription>(e))
              .toList()
          as T;
    }
    if (t == List<_i75.DispenseItemRequest>) {
      return (data as List)
              .map((e) => deserialize<_i75.DispenseItemRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i76.DispenseHistoryEntry>) {
      return (data as List)
              .map((e) => deserialize<_i76.DispenseHistoryEntry>(e))
              .toList()
          as T;
    }
    if (t == Map<String, String?>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String?>(v)),
          )
          as T;
    }
    if (t == List<_i77.PrescribedItem>) {
      return (data as List)
              .map((e) => deserialize<_i77.PrescribedItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i78.PatientExternalReport>) {
      return (data as List)
              .map((e) => deserialize<_i78.PatientExternalReport>(e))
              .toList()
          as T;
    }
    if (t == List<_i79.PatientPrescriptionListItem>) {
      return (data as List)
              .map((e) => deserialize<_i79.PatientPrescriptionListItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i80.AppointmentRequestItem>) {
      return (data as List)
              .map((e) => deserialize<_i80.AppointmentRequestItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i81.LabTests>) {
      return (data as List).map((e) => deserialize<_i81.LabTests>(e)).toList()
          as T;
    }
    if (t == List<_i82.LabPaymentItem>) {
      return (data as List)
              .map((e) => deserialize<_i82.LabPaymentItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i83.TestResult>) {
      return (data as List).map((e) => deserialize<_i83.TestResult>(e)).toList()
          as T;
    }
    if (t == List<_i84.LabTenHistory>) {
      return (data as List)
              .map((e) => deserialize<_i84.LabTenHistory>(e))
              .toList()
          as T;
    }
    if (t == List<_i85.NotificationInfo>) {
      return (data as List)
              .map((e) => deserialize<_i85.NotificationInfo>(e))
              .toList()
          as T;
    }
    if (t == Map<String, int>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<int>(v)),
          )
          as T;
    }
    if (t == List<_i86.PatientReportDto>) {
      return (data as List)
              .map((e) => deserialize<_i86.PatientReportDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i87.PrescriptionList>) {
      return (data as List)
              .map((e) => deserialize<_i87.PrescriptionList>(e))
              .toList()
          as T;
    }
    if (t == List<_i88.StaffInfo>) {
      return (data as List).map((e) => deserialize<_i88.StaffInfo>(e)).toList()
          as T;
    }
    if (t == List<_i89.AmbulanceContact>) {
      return (data as List)
              .map((e) => deserialize<_i89.AmbulanceContact>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.OndutyStaff>) {
      return (data as List)
              .map((e) => deserialize<_i90.OndutyStaff>(e))
              .toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.InventoryCategory => 'InventoryCategory',
      _i3.InventoryItemInfo => 'InventoryItemInfo',
      _i4.PrescribedItem => 'PrescribedItem',
      _i5.StaffInfo => 'StaffInfo',
      _i6.AdminDashboardOverview => 'AdminDashboardOverview',
      _i7.AdminProfileRespond => 'AdminProfileRespond',
      _i8.AmbulanceContact => 'AmbulanceContact',
      _i9.AppointmentRequestItem => 'AppointmentRequestItem',
      _i10.AuditEntry => 'AuditEntry',
      _i11.DashboardAnalytics => 'DashboardAnalytics',
      _i12.DispenseHistoryEntry => 'DispenseHistoryEntry',
      _i13.DispenseItemDetail => 'DispenseItemDetail',
      _i14.DispenseItemRequest => 'DispenseItemRequest',
      _i15.DispensedItemInput => 'DispensedItemInput',
      _i16.DispensedItemSummary => 'DispensedItemSummary',
      _i17.DispenserProfileR => 'DispenserProfileR',
      _i18.DoctorHomeData => 'DoctorHomeData',
      _i19.DoctorHomeRecentItem => 'DoctorHomeRecentItem',
      _i20.DoctorHomeReviewedReport => 'DoctorHomeReviewedReport',
      _i21.DoctorProfile => 'DoctorProfile',
      _i22.ExternalReportFile => 'ExternalReportFile',
      _i23.Greeting => 'Greeting',
      _i24.InventoryAuditLog => 'InventoryAuditLog',
      _i25.InventoryTransactionInfo => 'InventoryTransactionInfo',
      _i26.LabAnalyticsCategoryCount => 'LabAnalyticsCategoryCount',
      _i27.LabAnalyticsDailyPoint => 'LabAnalyticsDailyPoint',
      _i28.LabAnalyticsShiftStat => 'LabAnalyticsShiftStat',
      _i29.LabAnalyticsSnapshot => 'LabAnalyticsSnapshot',
      _i30.LabAnalyticsTestCount => 'LabAnalyticsTestCount',
      _i31.LabPaymentItem => 'LabPaymentItem',
      _i32.LabTenHistory => 'LabTenHistory',
      _i33.LabToday => 'LabToday',
      _i34.LoginResponse => 'LoginResponse',
      _i35.MedicineAlternative => 'MedicineAlternative',
      _i36.MedicineDetail => 'MedicineDetail',
      _i37.NotificationInfo => 'NotificationInfo',
      _i38.OndutyStaff => 'OndutyStaff',
      _i39.OtpChallengeResponse => 'OtpChallengeResponse',
      _i40.PatientExternalReport => 'PatientExternalReport',
      _i41.PatientPrescriptionListItem => 'PatientPrescriptionListItem',
      _i42.PatientPrescribedItem => 'PatientPrescribedItem',
      _i43.PatientPrescriptionDetails => 'PatientPrescriptionDetails',
      _i44.PatientProfile => 'PatientProfile',
      _i45.PatientReportDto => 'PatientReportDto',
      _i46.LabTests => 'LabTests',
      _i47.Prescription => 'Prescription',
      _i48.PrescriptionDetail => 'PrescriptionDetail',
      _i49.PrescriptionList => 'PrescriptionList',
      _i50.LabTestRangeRow => 'LabTestRangeRow',
      _i51.MedicineStockRangeRow => 'MedicineStockRangeRow',
      _i52.MonthlyBreakdown => 'MonthlyBreakdown',
      _i53.PrescriptionStats => 'PrescriptionStats',
      _i54.StockReport => 'StockReport',
      _i55.TopMedicine => 'TopMedicine',
      _i56.Roster => 'Roster',
      _i57.Rosterlists => 'Rosterlists',
      _i58.RosterUserRole => 'RosterUserRole',
      _i59.ShiftType => 'ShiftType',
      _i60.StaffProfileDto => 'StaffProfileDto',
      _i61.TestResult => 'TestResult',
      _i62.UserListItem => 'UserListItem',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('backend.', '');
    }

    switch (data) {
      case _i2.InventoryCategory():
        return 'InventoryCategory';
      case _i3.InventoryItemInfo():
        return 'InventoryItemInfo';
      case _i4.PrescribedItem():
        return 'PrescribedItem';
      case _i5.StaffInfo():
        return 'StaffInfo';
      case _i6.AdminDashboardOverview():
        return 'AdminDashboardOverview';
      case _i7.AdminProfileRespond():
        return 'AdminProfileRespond';
      case _i8.AmbulanceContact():
        return 'AmbulanceContact';
      case _i9.AppointmentRequestItem():
        return 'AppointmentRequestItem';
      case _i10.AuditEntry():
        return 'AuditEntry';
      case _i11.DashboardAnalytics():
        return 'DashboardAnalytics';
      case _i12.DispenseHistoryEntry():
        return 'DispenseHistoryEntry';
      case _i13.DispenseItemDetail():
        return 'DispenseItemDetail';
      case _i14.DispenseItemRequest():
        return 'DispenseItemRequest';
      case _i15.DispensedItemInput():
        return 'DispensedItemInput';
      case _i16.DispensedItemSummary():
        return 'DispensedItemSummary';
      case _i17.DispenserProfileR():
        return 'DispenserProfileR';
      case _i18.DoctorHomeData():
        return 'DoctorHomeData';
      case _i19.DoctorHomeRecentItem():
        return 'DoctorHomeRecentItem';
      case _i20.DoctorHomeReviewedReport():
        return 'DoctorHomeReviewedReport';
      case _i21.DoctorProfile():
        return 'DoctorProfile';
      case _i22.ExternalReportFile():
        return 'ExternalReportFile';
      case _i23.Greeting():
        return 'Greeting';
      case _i24.InventoryAuditLog():
        return 'InventoryAuditLog';
      case _i25.InventoryTransactionInfo():
        return 'InventoryTransactionInfo';
      case _i26.LabAnalyticsCategoryCount():
        return 'LabAnalyticsCategoryCount';
      case _i27.LabAnalyticsDailyPoint():
        return 'LabAnalyticsDailyPoint';
      case _i28.LabAnalyticsShiftStat():
        return 'LabAnalyticsShiftStat';
      case _i29.LabAnalyticsSnapshot():
        return 'LabAnalyticsSnapshot';
      case _i30.LabAnalyticsTestCount():
        return 'LabAnalyticsTestCount';
      case _i31.LabPaymentItem():
        return 'LabPaymentItem';
      case _i32.LabTenHistory():
        return 'LabTenHistory';
      case _i33.LabToday():
        return 'LabToday';
      case _i34.LoginResponse():
        return 'LoginResponse';
      case _i35.MedicineAlternative():
        return 'MedicineAlternative';
      case _i36.MedicineDetail():
        return 'MedicineDetail';
      case _i37.NotificationInfo():
        return 'NotificationInfo';
      case _i38.OndutyStaff():
        return 'OndutyStaff';
      case _i39.OtpChallengeResponse():
        return 'OtpChallengeResponse';
      case _i40.PatientExternalReport():
        return 'PatientExternalReport';
      case _i41.PatientPrescriptionListItem():
        return 'PatientPrescriptionListItem';
      case _i42.PatientPrescribedItem():
        return 'PatientPrescribedItem';
      case _i43.PatientPrescriptionDetails():
        return 'PatientPrescriptionDetails';
      case _i44.PatientProfile():
        return 'PatientProfile';
      case _i45.PatientReportDto():
        return 'PatientReportDto';
      case _i46.LabTests():
        return 'LabTests';
      case _i47.Prescription():
        return 'Prescription';
      case _i48.PrescriptionDetail():
        return 'PrescriptionDetail';
      case _i49.PrescriptionList():
        return 'PrescriptionList';
      case _i50.LabTestRangeRow():
        return 'LabTestRangeRow';
      case _i51.MedicineStockRangeRow():
        return 'MedicineStockRangeRow';
      case _i52.MonthlyBreakdown():
        return 'MonthlyBreakdown';
      case _i53.PrescriptionStats():
        return 'PrescriptionStats';
      case _i54.StockReport():
        return 'StockReport';
      case _i55.TopMedicine():
        return 'TopMedicine';
      case _i56.Roster():
        return 'Roster';
      case _i57.Rosterlists():
        return 'Rosterlists';
      case _i58.RosterUserRole():
        return 'RosterUserRole';
      case _i59.ShiftType():
        return 'ShiftType';
      case _i60.StaffProfileDto():
        return 'StaffProfileDto';
      case _i61.TestResult():
        return 'TestResult';
      case _i62.UserListItem():
        return 'UserListItem';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'InventoryCategory') {
      return deserialize<_i2.InventoryCategory>(data['data']);
    }
    if (dataClassName == 'InventoryItemInfo') {
      return deserialize<_i3.InventoryItemInfo>(data['data']);
    }
    if (dataClassName == 'PrescribedItem') {
      return deserialize<_i4.PrescribedItem>(data['data']);
    }
    if (dataClassName == 'StaffInfo') {
      return deserialize<_i5.StaffInfo>(data['data']);
    }
    if (dataClassName == 'AdminDashboardOverview') {
      return deserialize<_i6.AdminDashboardOverview>(data['data']);
    }
    if (dataClassName == 'AdminProfileRespond') {
      return deserialize<_i7.AdminProfileRespond>(data['data']);
    }
    if (dataClassName == 'AmbulanceContact') {
      return deserialize<_i8.AmbulanceContact>(data['data']);
    }
    if (dataClassName == 'AppointmentRequestItem') {
      return deserialize<_i9.AppointmentRequestItem>(data['data']);
    }
    if (dataClassName == 'AuditEntry') {
      return deserialize<_i10.AuditEntry>(data['data']);
    }
    if (dataClassName == 'DashboardAnalytics') {
      return deserialize<_i11.DashboardAnalytics>(data['data']);
    }
    if (dataClassName == 'DispenseHistoryEntry') {
      return deserialize<_i12.DispenseHistoryEntry>(data['data']);
    }
    if (dataClassName == 'DispenseItemDetail') {
      return deserialize<_i13.DispenseItemDetail>(data['data']);
    }
    if (dataClassName == 'DispenseItemRequest') {
      return deserialize<_i14.DispenseItemRequest>(data['data']);
    }
    if (dataClassName == 'DispensedItemInput') {
      return deserialize<_i15.DispensedItemInput>(data['data']);
    }
    if (dataClassName == 'DispensedItemSummary') {
      return deserialize<_i16.DispensedItemSummary>(data['data']);
    }
    if (dataClassName == 'DispenserProfileR') {
      return deserialize<_i17.DispenserProfileR>(data['data']);
    }
    if (dataClassName == 'DoctorHomeData') {
      return deserialize<_i18.DoctorHomeData>(data['data']);
    }
    if (dataClassName == 'DoctorHomeRecentItem') {
      return deserialize<_i19.DoctorHomeRecentItem>(data['data']);
    }
    if (dataClassName == 'DoctorHomeReviewedReport') {
      return deserialize<_i20.DoctorHomeReviewedReport>(data['data']);
    }
    if (dataClassName == 'DoctorProfile') {
      return deserialize<_i21.DoctorProfile>(data['data']);
    }
    if (dataClassName == 'ExternalReportFile') {
      return deserialize<_i22.ExternalReportFile>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i23.Greeting>(data['data']);
    }
    if (dataClassName == 'InventoryAuditLog') {
      return deserialize<_i24.InventoryAuditLog>(data['data']);
    }
    if (dataClassName == 'InventoryTransactionInfo') {
      return deserialize<_i25.InventoryTransactionInfo>(data['data']);
    }
    if (dataClassName == 'LabAnalyticsCategoryCount') {
      return deserialize<_i26.LabAnalyticsCategoryCount>(data['data']);
    }
    if (dataClassName == 'LabAnalyticsDailyPoint') {
      return deserialize<_i27.LabAnalyticsDailyPoint>(data['data']);
    }
    if (dataClassName == 'LabAnalyticsShiftStat') {
      return deserialize<_i28.LabAnalyticsShiftStat>(data['data']);
    }
    if (dataClassName == 'LabAnalyticsSnapshot') {
      return deserialize<_i29.LabAnalyticsSnapshot>(data['data']);
    }
    if (dataClassName == 'LabAnalyticsTestCount') {
      return deserialize<_i30.LabAnalyticsTestCount>(data['data']);
    }
    if (dataClassName == 'LabPaymentItem') {
      return deserialize<_i31.LabPaymentItem>(data['data']);
    }
    if (dataClassName == 'LabTenHistory') {
      return deserialize<_i32.LabTenHistory>(data['data']);
    }
    if (dataClassName == 'LabToday') {
      return deserialize<_i33.LabToday>(data['data']);
    }
    if (dataClassName == 'LoginResponse') {
      return deserialize<_i34.LoginResponse>(data['data']);
    }
    if (dataClassName == 'MedicineAlternative') {
      return deserialize<_i35.MedicineAlternative>(data['data']);
    }
    if (dataClassName == 'MedicineDetail') {
      return deserialize<_i36.MedicineDetail>(data['data']);
    }
    if (dataClassName == 'NotificationInfo') {
      return deserialize<_i37.NotificationInfo>(data['data']);
    }
    if (dataClassName == 'OndutyStaff') {
      return deserialize<_i38.OndutyStaff>(data['data']);
    }
    if (dataClassName == 'OtpChallengeResponse') {
      return deserialize<_i39.OtpChallengeResponse>(data['data']);
    }
    if (dataClassName == 'PatientExternalReport') {
      return deserialize<_i40.PatientExternalReport>(data['data']);
    }
    if (dataClassName == 'PatientPrescriptionListItem') {
      return deserialize<_i41.PatientPrescriptionListItem>(data['data']);
    }
    if (dataClassName == 'PatientPrescribedItem') {
      return deserialize<_i42.PatientPrescribedItem>(data['data']);
    }
    if (dataClassName == 'PatientPrescriptionDetails') {
      return deserialize<_i43.PatientPrescriptionDetails>(data['data']);
    }
    if (dataClassName == 'PatientProfile') {
      return deserialize<_i44.PatientProfile>(data['data']);
    }
    if (dataClassName == 'PatientReportDto') {
      return deserialize<_i45.PatientReportDto>(data['data']);
    }
    if (dataClassName == 'LabTests') {
      return deserialize<_i46.LabTests>(data['data']);
    }
    if (dataClassName == 'Prescription') {
      return deserialize<_i47.Prescription>(data['data']);
    }
    if (dataClassName == 'PrescriptionDetail') {
      return deserialize<_i48.PrescriptionDetail>(data['data']);
    }
    if (dataClassName == 'PrescriptionList') {
      return deserialize<_i49.PrescriptionList>(data['data']);
    }
    if (dataClassName == 'LabTestRangeRow') {
      return deserialize<_i50.LabTestRangeRow>(data['data']);
    }
    if (dataClassName == 'MedicineStockRangeRow') {
      return deserialize<_i51.MedicineStockRangeRow>(data['data']);
    }
    if (dataClassName == 'MonthlyBreakdown') {
      return deserialize<_i52.MonthlyBreakdown>(data['data']);
    }
    if (dataClassName == 'PrescriptionStats') {
      return deserialize<_i53.PrescriptionStats>(data['data']);
    }
    if (dataClassName == 'StockReport') {
      return deserialize<_i54.StockReport>(data['data']);
    }
    if (dataClassName == 'TopMedicine') {
      return deserialize<_i55.TopMedicine>(data['data']);
    }
    if (dataClassName == 'Roster') {
      return deserialize<_i56.Roster>(data['data']);
    }
    if (dataClassName == 'Rosterlists') {
      return deserialize<_i57.Rosterlists>(data['data']);
    }
    if (dataClassName == 'RosterUserRole') {
      return deserialize<_i58.RosterUserRole>(data['data']);
    }
    if (dataClassName == 'ShiftType') {
      return deserialize<_i59.ShiftType>(data['data']);
    }
    if (dataClassName == 'StaffProfileDto') {
      return deserialize<_i60.StaffProfileDto>(data['data']);
    }
    if (dataClassName == 'TestResult') {
      return deserialize<_i61.TestResult>(data['data']);
    }
    if (dataClassName == 'UserListItem') {
      return deserialize<_i62.UserListItem>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
