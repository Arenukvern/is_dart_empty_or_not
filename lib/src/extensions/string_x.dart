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

  /// Returns this string when it is non-empty, null otherwise — the
  /// `value.isEmpty ? null : value` normalize-to-null in one call.
  ///
  /// ```dart
  /// ''.whenEmptyOrNull; // null
  /// 'ada'.whenEmptyOrNull; // 'ada'
  /// ```
  ///
  /// @ai Use to normalize empty optional strings to null, e.g. config
  /// fields where '' and absent mean the same thing.
  String? get whenEmptyOrNull => isEmpty ? null : this;
}

/// Nullable-aware empty checks for [String?]: the common
/// `value == null || value.isEmpty` guard as a single call.
///
/// Type-promotion caveat: Dart does not promote through extension getters,
/// so `if (name.isNullOrEmpty)` leaves [name] nullable afterwards. When the
/// value is USED after the guard, keep the explicit
/// `name == null || name.isEmpty` form — these getters are for guards whose
/// value is not relied on later (or for bool results).
///
/// @ai Prefer over hand-written null-and-empty condition chains only when
/// no promotion is needed afterwards.
extension NullableEmptyOrNotStringX on String? {
  /// Whether this is null or an empty string.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Whether this is a non-null, non-empty string.
  bool get isNotNullNorEmpty => !isNullOrEmpty;

  /// Returns this string when it is non-null and non-empty, else [value].
  ///
  /// ```dart
  /// const String? name = null;
  /// name.whenEmptyUse('anon'); // 'anon'
  /// ''.whenEmptyUse('anon'); // 'anon'
  /// 'ada'.whenEmptyUse('anon'); // 'ada'
  /// ```
  ///
  /// @ai Same call shape as the non-nullable [EmptyOrNotStringX.whenEmptyUse].
  String whenEmptyUse(final String value) => isNullOrEmpty ? value : this!;

  /// Whether this is null, empty, or whitespace-only.
  ///
  /// ```dart
  /// const String? name = null;
  /// name.isNullOrBlank; // true
  /// '   '.isNullOrBlank; // true
  /// ' ada '.isNullOrBlank; // false
  /// ```
  ///
  /// @ai Use where blank input should count as absent (env vars, CLI
  /// answers); unlike [isNullOrEmpty] this trims first.
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  /// Whether this is a non-null string with non-whitespace content.
  bool get isNotNullNorBlank => !isNullOrBlank;

  /// Returns this string when it is non-null and non-empty, null otherwise —
  /// the `value == null || value.isEmpty ? null : value` shape in one call.
  ///
  /// ```dart
  /// const String? name = null;
  /// name.whenEmptyOrNull; // null
  /// ''.whenEmptyOrNull; // null
  /// 'ada'.whenEmptyOrNull; // 'ada'
  /// ```
  ///
  /// @ai Same call shape as the non-nullable
  /// [EmptyOrNotStringX.whenEmptyOrNull].
  String? get whenEmptyOrNull => isNullOrEmpty ? null : this;
}
