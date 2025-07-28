import 'package:flutter/material.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/snack_bar_type.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/base_get_bts_dialog.dart';

abstract class AppNavigator {
  Future<T?>? toNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  Future<T?>? offNamed<T>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  void back<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  });

  Future<T?>? offAllNamed<T>(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  });

  Future<T?>? toNamedFactory<T>(
    String page, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  });

  Future<T?> showBottomSheet<T>(
    BaseGetBtsDialog bottomSheet, {
    RouteSettings? settings,
  });

  Future<T?> showDialog<T>(
    BaseGetBtsDialog dialog, {
    RouteSettings? settings,
  });

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarType type = SnackBarType.failure,
  });
}
