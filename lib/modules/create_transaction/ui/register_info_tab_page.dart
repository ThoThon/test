import 'dart:io';

import 'package:flutter/material.dart';
import 'package:v_bhxh/assets.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/core/values/dimens.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/base/model/input_text_form_field_model.dart';
import 'package:v_bhxh/shares/base/ui/ui.src.dart';
import 'package:v_bhxh/shares/shares.src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../create_transaction_src.dart';

part 'widgets/register_info_tab_widget.dart';

class RegisterInfoTabPage extends BaseGetWidget {
  RegisterInfoTabPage({super.key});

  @override
  TransactionControllerImpICare get controller => _controller;

  late final _controller = Get.put(TransactionControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }
}
