import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/generated/locales.g.dart';

enum DeclarationStatus {
  /// 0: Chưa kê khai
  notYet,

  /// 1: Lưu nháp
  draft,

  /// 2: Đã lưu
  saved,

  /// 3: Đã gửi
  sent,

  /// 4: Đang chờ xử lý
  pending,

  /// 5: Thất bại
  failed,

  /// 6: Thành công
  success;

  bool get canEdit =>
      this == DeclarationStatus.notYet ||
      this == DeclarationStatus.draft ||
      this == DeclarationStatus.saved;

  String get title {
    switch (this) {
      case DeclarationStatus.notYet:
        return LocaleKeys.declarationPeriod_statusNotYet.tr;
      case DeclarationStatus.draft:
        return LocaleKeys.declarationPeriod_statusDraft.tr;
      case DeclarationStatus.saved:
        return LocaleKeys.declarationPeriod_statusSaved.tr;
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
        return Colors.black;
      case DeclarationStatus.draft:
        return const Color(0xFFFE9705);
      case DeclarationStatus.saved:
        return const Color(0xFF00EFFF);
      case DeclarationStatus.sent:
        return const Color(0xFF409C37);
      case DeclarationStatus.pending:
        return Colors.black;
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
        return DeclarationStatus.saved;
      case 3:
        return DeclarationStatus.sent;
      case 4:
        return DeclarationStatus.pending;
      case 5:
        return DeclarationStatus.failed;
      case 6:
        return DeclarationStatus.success;
      default:
        return DeclarationStatus.notYet;
    }
  }

  Color get cardColor {
    switch (this) {
      case DeclarationStatus.notYet:
        return const Color(0xFFEDEDED);
      case DeclarationStatus.draft:
        return const Color(0xFFFFF1DF);
      case DeclarationStatus.saved:
        return const Color(0xFFE0FBFF);
      case DeclarationStatus.sent:
        return const Color(0xFFE9FFE6);
      case DeclarationStatus.pending:
        return const Color(0xFFEDEDED);
      case DeclarationStatus.failed:
        return const Color(0xFFFFE5E5);
      case DeclarationStatus.success:
        return const Color(0xFFD9F3FF);
    }
  }
}
