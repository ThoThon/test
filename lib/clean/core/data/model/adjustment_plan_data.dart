class AdjustmentPlanData {
  final String? id;
  final String? name;

  const AdjustmentPlanData({
    this.id,
    this.name,
  });

  factory AdjustmentPlanData.fromJson(Map<String, dynamic> json) {
    return AdjustmentPlanData(
      id: json['maPhuongAn'],
      name: json['tenPhuongAn'],
    );
  }
}
