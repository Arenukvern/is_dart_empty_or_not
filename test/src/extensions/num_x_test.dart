import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotNumX', () {
    test('isZero returns true for zero', () {
      expect(0.isZero, isTrue);
      expect(0.0.isZero, isTrue);
    });

    test('isZero returns false for non-zero', () {
      expect(1.isZero, isFalse);
      expect((-1).isZero, isFalse);
      expect(0.1.isZero, isFalse);
    });

    test('isPositive returns true for positive numbers', () {
      expect(1.isPositive, isTrue);
      expect(0.1.isPositive, isTrue);
      expect(0.0.isPositive, isTrue);
    });

    test('isPositive returns false for negative numbers', () {
      expect((-1).isPositive, isFalse);
      expect((-0.1).isPositive, isFalse);
    });
  });

  group('EmptyOrNotIntX', () {
    test('whenZeroUse returns original value when non-zero', () {
      expect(5.whenZeroUse(10), equals(5));
      expect((-5).whenZeroUse(10), equals(-5));
    });

    test('whenZeroUse returns fallback value when zero', () {
      expect(0.whenZeroUse(10), equals(10));
    });
  });

  group('EmptyOrNotDoubleX', () {
    test('whenZeroUse returns original value when non-zero', () {
      expect(5.0.whenZeroUse(10), equals(5.0));
      expect((-5.0).whenZeroUse(10), equals(-5.0));
    });

    test('whenZeroUse returns fallback value when zero', () {
      expect(0.0.whenZeroUse(10), equals(10.0));
    });
  });
}
