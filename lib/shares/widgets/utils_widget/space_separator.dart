List<T> addSeparator<T>({
  required Iterable<T> children,
  required T spacer,
}) {
  return children
      .expand((item) sync* {
        yield spacer;
        yield item;
      })
      .skip(1)
      .toList();
}
