class CreateDeclarationPeriodResponse {
  final String id;
  final String congTyId;
  final int maThuTuc;
  final int trangThai;
  final int nam;
  final int dot;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateTime;
  final bool isApp;
  final int? idRef;

  const CreateDeclarationPeriodResponse({
    required this.id,
    required this.congTyId,
    required this.maThuTuc,
    required this.trangThai,
    required this.nam,
    required this.dot,
    required this.selected,
    this.createTime,
    this.updateTime,
    required this.isApp,
    this.idRef,
  });

  factory CreateDeclarationPeriodResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeclarationPeriodResponse(
      id: json['id'] ?? '',
      congTyId: json['congTyId'] ?? '',
      maThuTuc: json['maThuTuc'] ?? 0,
      trangThai: json['trangThai'] ?? 0,
      nam: json['nam'] ?? 0,
      dot: json['dot'] ?? 0,
      selected: json['selected'] ?? false,
      createTime: DateTime.tryParse(json['createTime'] ?? ''),
      updateTime: DateTime.tryParse(json['updateTime'] ?? ''),
      isApp: json['isApp'] ?? false,
      idRef: json['idRef'],
    );
  }
}
