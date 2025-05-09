import 'package:flutter/material.dart';

enum DeclarationStatus {
  draft,
  sent;

  bool get canEdit => this == DeclarationStatus.draft;

  String get title {
    switch (this) {
      case DeclarationStatus.draft:
        return 'Nháp';
      case DeclarationStatus.sent:
        return 'Đã gửi';
    }
  }

  Color get color {
    switch (this) {
      case DeclarationStatus.draft:
        return Colors.blue;
      case DeclarationStatus.sent:
        return Colors.green;
    }
  }
}
