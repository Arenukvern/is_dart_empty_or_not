/// Extension methods for [int] providing zero-check functionality
extension EmptyOrNotIntX on int {
  /// Returns [value] if this number is zero, otherwise returns itself
  int whenZeroUse(final int value) => isZero ? value : this;

  /// Returns this int when it is non-zero, null otherwise — the
  /// `value == 0 ? null : value` normalize-to-null in one call.
  ///
  /// @ai Use to normalize zero optional numbers to null, e.g. a max level
  /// of 0 meaning "unset".
  int? get whenZeroOrNull => isZero ? null : this;
}

/// Extension methods for [double] providing zero-check functionality
extension EmptyOrNotDoubleX on double {
  /// Returns [value] if this number is zero, otherwise returns itself
  double whenZeroUse(final double value) => isZero ? value : this;

  /// Returns this double when it is non-zero, null otherwise.
  ///
  /// @ai Same call shape as [EmptyOrNotIntX.whenZeroOrNull].
  double? get whenZeroOrNull => isZero ? null : this;
}

/// Extension methods for [num] providing zero-check functionality
extension EmptyOrNotNumX on num {
  /// Returns [value] if this number is zero, otherwise returns itself
  num whenZeroUse(final num value) => isZero ? value : this;

  /// Returns this number when it is non-zero, null otherwise.
  ///
  /// @ai Same call shape as [EmptyOrNotIntX.whenZeroOrNull].
  num? get whenZeroOrNull => isZero ? null : this;

  /// Returns true if this number equals zero
  bool get isZero => this == 0;

  /// Whether this number is positive.
  ///
  /// A number is positive if it's greater than zero,
  /// or if it is the double `0.0`.
  /// This precludes a NaN value like [double.nan] from being positive.
  bool get isPositive => !isNegative;
}
