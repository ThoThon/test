import 'dart:async';

import 'package:flutter/foundation.dart';

abstract class UseCase<Input, Output> {
  const UseCase();

  FutureOr<Output> execute(
    Input input,
  );

  /// Cancel the use case if it's still running
  @mustCallSuper
  void cancel() {}
}

abstract class NoInputUseCase<Output> {
  const NoInputUseCase();

  FutureOr<Output> execute();

  /// Cancel the use case if it's still running
  @mustCallSuper
  void cancel() {}
}
