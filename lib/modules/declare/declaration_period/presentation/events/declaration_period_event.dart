import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/periods_scroll_stargery.dart';

sealed class DeclarationPeriodEvent {
  const DeclarationPeriodEvent();
}

class RefreshDeclarationPeriodEvent extends DeclarationPeriodEvent {
  const RefreshDeclarationPeriodEvent({
    this.scrollStrategy = PeriodsScrollStrategy.none,
  });

  final PeriodsScrollStrategy scrollStrategy;
}
