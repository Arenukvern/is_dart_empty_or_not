/// Extension methods for [List] to provide additional functionality.
///
/// This extension adds useful methods for manipulating lists, enhancing their
/// capabilities for various use cases.
///
/// @ai Use this extension to simplify operations on lists in your code.
extension EmptyOrNotListX<E> on List<E> {
  /// Returns the list if it is not empty, otherwise returns the provided list.
  ///
  /// [values] The list to return if the current list is empty.
  ///
  /// @ai Use this method to provide a fallback list when the current list is
  /// empty.
  List<E> whenEmptyUse(final List<E> values) => isNotEmpty ? this : values;

  /// Returns this list when it is not empty, null otherwise — the
  /// `values.isEmpty ? null : values` normalize-to-null in one call.
  ///
  /// @ai Use to normalize empty optional lists to null, e.g. config fields
  /// where an empty list and an absent list mean the same thing.
  List<E>? get whenEmptyOrNull => isEmpty ? null : this;
}

/// Nullable-aware empty checks for [List?]: the common
/// Type-promotion caveat: Dart does not promote through extension getters —
/// keep the explicit null-and-empty form when the value is used after the
/// guard.
///
/// `list == null || list.isEmpty` guard as a single call.
///
/// @ai Prefer over hand-written null-and-empty condition chains.
extension NullableEmptyOrNotListX<E> on List<E>? {
  /// Whether this is null or an empty list.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Whether this is a non-null, non-empty list.
  bool get isNotNullNorEmpty => !isNullOrEmpty;

  /// Returns this list when it is non-null and non-empty, else [values].
  ///
  /// @ai Same call shape as the non-nullable [EmptyOrNotListX.whenEmptyUse].
  List<E> whenEmptyUse(final List<E> values) => isNullOrEmpty ? values : this!;

  /// Returns this list when it is non-null and non-empty, null otherwise.
  ///
  /// @ai Same call shape as the non-nullable
  /// [EmptyOrNotListX.whenEmptyOrNull].
  List<E>? get whenEmptyOrNull => isNullOrEmpty ? null : this;
}
