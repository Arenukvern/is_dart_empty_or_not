/// Extension methods for [Set] providing empty-check functionality
extension EmptyOrNotSetX<T> on Set<T> {
  /// Returns the set if it is not empty, otherwise returns the provided set.
  Set<T> whenEmptyUse(final Set<T> values) => isNotEmpty ? this : values;
}

/// Nullable-aware empty checks for [Set?]: the common
/// `set == null || set.isEmpty` guard as a single call.
///
/// @ai Prefer over hand-written null-and-empty condition chains.
extension NullableEmptyOrNotSetX<T> on Set<T>? {
  /// Whether this is null or an empty set.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Whether this is a non-null, non-empty set.
  bool get isNotNullNorEmpty => !isNullOrEmpty;

  /// Returns this set when it is non-null and non-empty, else [values].
  ///
  /// @ai Same call shape as the non-nullable [EmptyOrNotSetX.whenEmptyUse].
  Set<T> whenEmptyUse(final Set<T> values) => isNullOrEmpty ? values : this!;
}
