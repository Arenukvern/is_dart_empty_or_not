/// Extension methods for [Set] providing empty-check functionality
extension EmptyOrNotSetX<T> on Set<T> {
  /// Returns the set if it is not empty, otherwise returns the provided set.
  Set<T> whenEmptyUse(final Set<T> values) => isNotEmpty ? this : values;

  /// Returns this set when it is not empty, null otherwise.
  ///
  /// @ai Use to normalize empty optional sets to null.
  Set<T>? get whenEmptyOrNull => isEmpty ? null : this;
}

/// Nullable-aware empty checks for [Set?]: the common
/// Type-promotion caveat: Dart does not promote through extension getters —
/// keep the explicit null-and-empty form when the value is used after the
/// guard.
///
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

  /// Returns this set when it is non-null and non-empty, null otherwise.
  ///
  /// @ai Same call shape as the non-nullable
  /// [EmptyOrNotSetX.whenEmptyOrNull].
  Set<T>? get whenEmptyOrNull => isNullOrEmpty ? null : this;
}
