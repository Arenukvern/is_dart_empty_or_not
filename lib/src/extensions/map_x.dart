/// Extension methods for [Map] providing empty-check functionality
extension EmptyOrNotMapX<K, V> on Map<K, V> {
  /// Returns the map if it is not empty, otherwise returns the provided map.
  Map<K, V> whenEmptyUse(final Map<K, V> map) => isNotEmpty ? this : map;
}

/// Nullable-aware empty checks for [Map?]: the common
/// `map == null || map.isEmpty` guard as a single call.
///
/// @ai Prefer over hand-written null-and-empty condition chains.
extension NullableEmptyOrNotMapX<K, V> on Map<K, V>? {
  /// Whether this is null or an empty map.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Whether this is a non-null, non-empty map.
  bool get isNotNullNorEmpty => !isNullOrEmpty;

  /// Returns this map when it is non-null and non-empty, else [map].
  ///
  /// @ai Same call shape as the non-nullable [EmptyOrNotMapX.whenEmptyUse].
  Map<K, V> whenEmptyUse(final Map<K, V> map) => isNullOrEmpty ? map : this!;
}
