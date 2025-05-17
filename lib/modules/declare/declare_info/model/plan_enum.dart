enum PlanEnum {
  TM,
  TD,
  TC,
  TH,
  AD,
  AT,
  ON,
  DC,
  DN,
  TT,
  TN,
  GC,
  GD,
  GH,
  KL,
  OF,
  SB,
  TS,
  GN,
  TU,
  TL,
  GL,
  CD,
  DL;

  /// Tăng lao động: TM, TD, TC, TH, AD, AT, ON
  static const increaseLaborPlans = <PlanEnum>[TM, TD, TC, TH, AD, AT, ON];

  /// Tăng lương: DC, DN, TT, TN
  static const increaseSalaryPlans = <PlanEnum>[DC, DN, TT, TN];

  /// Giảm lao động: GC, GD, GH, KL, OF, SB, TS
  static const decreaseLaborPlans = <PlanEnum>[GC, GD, GH, KL, OF, SB, TS];

  /// Giảm lương: DC, GN, TU
  static const decreaseSalaryPlans = <PlanEnum>[DC, GN, TU];

  /// Khác: TL, GL, CD, DC, DL
  static const otherPlans = <PlanEnum>[TL, GL, CD, DC, DL];

  String get title {
    switch (this) {
      case TM:
        return 'TM';
      case TD:
        return 'TD';
      case TC:
        return 'TC';
      case TH:
        return 'TH';
      case AD:
        return 'AD';
      case AT:
        return 'AT';
      case ON:
        return 'ON';
      case DC:
        return 'DC';
      case DN:
        return 'DN';
      case TT:
        return 'TT';
      case TN:
        return 'TN';
      case GC:
        return 'GC';
      case GD:
        return 'GD';
      case GH:
        return 'GH';
      case KL:
        return 'KL';
      case OF:
        return 'OF';
      case SB:
        return 'SB';
      case TS:
        return 'TS';
      case GN:
        return 'GN';
      case TU:
        return 'TU';
      case TL:
        return 'TL';
      case GL:
        return 'GL';
      case CD:
        return 'CD';
      case DL:
        return 'DL';
    }
  }
}
