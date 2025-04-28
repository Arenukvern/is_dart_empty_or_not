/// Extension methods for [String] providing empty-check functionality
extension EmptyOrNotStringX on String {
  /// Invokes a callback when the string is non-empty.
  ///
  /// [callback] The function to invoke with the string value.
  ///
  /// @ai Use this method to perform actions conditionally based on string
  /// content.
  void onNotEmpty(final void Function(String value) callback) =>
      isEmpty ? null : callback(this);

  /// Invokes a callback when the string is empty.
  ///
  /// [callback] The function to invoke.
  ///
  /// @ai Use this method to perform actions conditionally based on string
  /// content.
  void onEmpty(final void Function() callback) => isEmpty ? callback() : null;

  /// Returns a default value if the string is empty.
  ///
  /// [value] The default value to return if the string is empty.
  /// @returns The original string or the default value if empty.
  ///
  /// @ai Use this method to provide fallback values for empty strings.
  String whenEmptyUse(final String value) => isEmpty ? value : this;
}
