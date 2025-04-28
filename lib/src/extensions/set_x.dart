/// Extension methods for [Set] providing empty-check functionality
extension EmptyOrNotSetX<T> on Set<T> {
  /// Returns the set if it is not empty, otherwise returns the provided set.
  Set<T> whenEmptyUse(final Set<T> values) => isNotEmpty ? this : values;
}
