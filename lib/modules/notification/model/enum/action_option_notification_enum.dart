import '../../../src.dart';

enum ActionOptionNotificationEnum {
  // Xóa thông báo
  deleteNoti,

  // Bật/Tắt thông báo
  onOffNoti;

  String get title {
    switch (this) {
      case ActionOptionNotificationEnum.deleteNoti:
        return "Xóa thông báo";
      case ActionOptionNotificationEnum.onOffNoti:
        return "Bật/Tắt thông báo";
    }
  }

  IconData get icon {
    switch (this) {
      case ActionOptionNotificationEnum.deleteNoti:
        return Icons.autorenew;
      case ActionOptionNotificationEnum.onOffNoti:
        return Icons.delete;
    }
  }
}
