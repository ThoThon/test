import 'package:flutter/material.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/shares/base/ui/sds_build_text.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

class CompleteDeclareInfoWidget extends StatelessWidget {
  const CompleteDeclareInfoWidget({
    super.key,
    this.onTapDeposit,
    this.onTapAddStaff,
  });

  /// Bấm huyển ký
  final VoidCallback? onTapDeposit;

  /// Thêm tiếp nhân sự
  final VoidCallback? onTapAddStaff;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        UtilWidget.sizedBox16,
        const Divider(height: 1),
        _buildButton(
          title: 'Chuyển ký',
          textColor: Colors.green,
          onTap: () {
            ShowDialog.dismissDialog();
            onTapDeposit?.call();
          },
        ),
        const Divider(height: 1),
        _buildButton(
          title: 'Thêm tiếp nhân sự',
          textColor: AppColors.primaryColor,
          onTap: () {
            ShowDialog.dismissDialog();
            onTapAddStaff?.call();
          },
        ),
        const Divider(height: 1),
        _buildButton(
          title: 'Hủy',
          onTap: () {
            ShowDialog.dismissDialog();
          },
        ),
      ],
    );
  }

  Widget _buildButton({
    required String title,
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
      alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: AppDimens.defaultPadding,
        ),
        child: SDSBuildText(
          title,
          style: AppTextStyle.font16Bo.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
