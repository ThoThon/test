import 'package:flutter/material.dart';

enum DeclarationStatus {
  /// Chưa kê khai
  notYet,

  /// Lưu nháp
  draft,

  /// Đã gửi
  sent;

  bool get canEdit => this == DeclarationStatus.draft;

  String get title {
    switch (this) {
      case DeclarationStatus.notYet:
        return 'Chưa kê khai';
      case DeclarationStatus.draft:
        return 'Lưu nháp';
      case DeclarationStatus.sent:
        return 'Đã gửi';
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
      default:
        return DeclarationStatus.notYet;
    }
  }
}
