import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity_src.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';

class AppControllerCl extends BaseGetClController {
  final accountInfo = Rxn<AccountInfo>();
  final declarationTypes = <DeclarationType>{}.obs;
  final ethnics = <Ethnic>{}.obs;
  final nations = <Nation>{}.obs;
  final provinces = <Province>{}.obs;
  final relationships = <Relationship>{}.obs;
  final positions = <Position>{}.obs;
  final birthTypes = <BirthType>{}.obs;
  final receiveResults = <ReceiveResult>{}.obs;

  /// Số lượng thông báo chưa đọc
  final totalUnread = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _configSystemUI();
  }

  void _configSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Đảm bảo status bar và navigation bar trong suốt
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Colors.transparent, // Thanh điều hướng trong suốt
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent, // Thanh trạng thái trong suốt
        statusBarIconBrightness: Brightness.dark, // Icon màu đen
      ),
    );
  }
}
