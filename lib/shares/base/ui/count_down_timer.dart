import 'dart:async';

import '../../../modules/src.dart';

/// Tạo độ lệch thời gian để chắc chắn khi count down xong thì BE đã xử lý xong
///
/// Ví dụ count down 30s thì mobile cần 30 * 1000ms + 50ms = 31.5s mới kết thúc

const _timerInterval = Duration(milliseconds: 1000);

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    required this.start,
    this.onFinish,
  });

  /// Start time in seconds
  final int start;
  final VoidCallback? onFinish;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? _timer;
  late int _start = widget.start;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(
      _timerInterval,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          widget.onFinish?.call();
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SDSBuildText(
      "${_start}s",
      style: AppTextStyle.font36Bo.copyWith(color: AppColors.primaryColor),
    );
  }
}
