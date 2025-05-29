import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

enum DeclarationStatus {
  /// 0: Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã gửi
  sent,

  /// 3: Đang chờ xử lý
  pending,

  /// 4: Thất bại
  failed,

  /// 5: Thành công
  success;

  bool get canEdit =>
      this == DeclarationStatus.notYet || this == DeclarationStatus.draft;

  String get title {
    switch (this) {
      case DeclarationStatus.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case DeclarationStatus.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case DeclarationStatus.sent:
        return LocaleKeys.declarationPeriod_statusSent.tr;
      case DeclarationStatus.pending:
        return LocaleKeys.declarationPeriod_statusPending.tr;
      case DeclarationStatus.failed:
        return LocaleKeys.declarationPeriod_statusFailed.tr;
      case DeclarationStatus.success:
        return LocaleKeys.declarationPeriod_statusSuccess.tr;
    }
  }

  Color get color {
    switch (this) {
      case DeclarationStatus.notYet:
        return const Color(0xFFB7B7B7);
      case DeclarationStatus.draft:
        return const Color(0xFFFFCB09);
      case DeclarationStatus.sent:
        return Colors.green;
      case DeclarationStatus.pending:
        return const Color(0xFFB7B7B7);
      case DeclarationStatus.failed:
        return Colors.red;
      case DeclarationStatus.success:
        return const Color(0xFF00BFFF);
    }
  }

  static DeclarationStatus fromInt(int? value) {
    switch (value) {
      case 0:
        return DeclarationStatus.notYet;
      case 1:
        return DeclarationStatus.draft;
      case 2:
        return DeclarationStatus.sent;
      case 3:
        return DeclarationStatus.pending;
      case 4:
        return DeclarationStatus.failed;
      case 5:
        return DeclarationStatus.success;
      default:
        return DeclarationStatus.notYet;
    }
  }
}
