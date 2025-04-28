/// Extension methods for [Map] providing empty-check functionality
extension EmptyOrNotMapX<K, V> on Map<K, V> {
  /// Returns the map if it is not empty, otherwise returns the provided map.
  Map<K, V> whenEmptyUse(final Map<K, V> map) => isNotEmpty ? this : map;
}
