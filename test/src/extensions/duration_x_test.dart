import 'package:is_dart_empty_or_not/src/extensions/duration_x.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotDurationX', () {
    test('isZero returns true only for Duration.zero', () {
      expect(Duration.zero.isZero, isTrue);
      expect(const Duration(seconds: 1).isZero, isFalse);
    });

    test('isNegative returns true for negative durations', () {
      expect(const Duration(seconds: -1).isNegative, isTrue);
      expect(Duration.zero.isNegative, isFalse);
      expect(const Duration(seconds: 1).isNegative, isFalse);
    });

    test('isPositive returns true for zero and positive durations', () {
      expect(const Duration(seconds: 1).isPositive, isTrue);
      expect(Duration.zero.isPositive, isTrue);
      expect(const Duration(seconds: -1).isPositive, isFalse);
    });

    test('whenZeroUse returns fallback if zero, otherwise self', () {
      const d = Duration(seconds: 5);
      const fallback = Duration(seconds: 10);
      expect(Duration.zero.whenZeroUse(fallback), fallback);
      expect(d.whenZeroUse(fallback), d);
    });

    test('whenNegativeUse returns fallback if negative, otherwise self', () {
      const d = Duration(seconds: 5);
      const fallback = Duration(seconds: 10);
      expect(const Duration(seconds: -1).whenNegativeUse(fallback), fallback);
      expect(d.whenNegativeUse(fallback), d);
    });
  });
}
