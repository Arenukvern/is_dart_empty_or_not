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
}
