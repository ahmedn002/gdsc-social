extension InsertBetweenEachElement<T> on Iterable<T> {
  Iterable<T> insertBetweenEachElement(T element) sync* {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return;
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
