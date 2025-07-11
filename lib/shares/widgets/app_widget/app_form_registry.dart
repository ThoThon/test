import 'package:flutter_form_registry/flutter_form_registry.dart';

class AppFormRegistry extends FormRegistryWidget {
  /// `defaultAlignment`: Set bằng 0.1 để form field hiển thị ở giữa
  const AppFormRegistry({
    super.key,
    super.autoScrollToFirstInvalid = true,
    super.defaultAlignment = 0.1,
    super.defaultDuration = const Duration(milliseconds: 500),
    required super.child,
  });
}
