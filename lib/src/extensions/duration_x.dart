/// Extension methods for [Duration] to provide additional functionality.
///
/// This extension adds useful methods for manipulating durations, enhancing
/// their capabilities for various use cases.
///
/// @ai Use this extension to simplify operations on durations in your code.
extension EmptyOrNotDurationX on Duration {
  /// Returns true if the duration is zero.
  bool get isZero => this == Duration.zero;

  /// Returns the duration if it is not zero, otherwise returns the provided
  /// duration.
  Duration whenZeroUse(final Duration duration) => isZero ? duration : this;

  /// Returns the duration if it is not negative, otherwise returns the provided
  /// duration.
  Duration whenNegativeUse(final Duration duration) =>
      isNegative ? duration : this;

  /// Returns true if the duration is negative.
  bool get isNegative => this < Duration.zero;

  /// Returns true if the duration is positive.
  bool get isPositive => this >= Duration.zero;
}
