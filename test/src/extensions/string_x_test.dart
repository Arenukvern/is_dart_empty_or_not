import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotStringX', () {
    test('whenEmptyUse returns original string when not empty', () {
      const str = 'hello';
      const fallback = 'world';
      expect(str.whenEmptyUse(fallback), equals(str));
    });

    test('whenEmptyUse returns fallback string when empty', () {
      const str = '';
      const fallback = 'default';
      expect(str.whenEmptyUse(fallback), equals(fallback));
    });

    test('onNotEmpty executes callback when string is not empty', () {
      const str = 'hello';
      var called = false;
      str.onNotEmpty((final value) {
        called = true;
        expect(value, equals(str));
      });
      expect(called, isTrue);
    });

    test('onNotEmpty does not execute callback when string is empty', () {
      const str = '';
      var called = false;
      str.onNotEmpty((_) => called = true);
      expect(called, isFalse);
    });

    test('onEmpty executes callback when string is empty', () {
      const str = '';
      var called = false;
      str.onEmpty(() => called = true);
      expect(called, isTrue);
    });

    test('onEmpty does not execute callback when string is not empty', () {
      const str = 'hello';
      var called = false;
      str.onEmpty(() => called = true);
      expect(called, isFalse);
    });
  });

  group('NullableEmptyOrNotStringX', () {
    test('isNullOrEmpty is true for null and empty', () {
      const String? nullStr = null;
      expect(nullStr.isNullOrEmpty, isTrue);
      expect(''.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty is false for non-empty strings', () {
      expect('hello'.isNullOrEmpty, isFalse);
      expect(' '.isNullOrEmpty, isFalse);
    });

    test('isNotNullNorEmpty mirrors isNullOrEmpty', () {
      const String? nullStr = null;
      expect(nullStr.isNotNullNorEmpty, isFalse);
      expect(''.isNotNullNorEmpty, isFalse);
      expect('hello'.isNotNullNorEmpty, isTrue);
    });

    test('whenEmptyUse falls back for null and empty', () {
      const String? nullStr = null;
      expect(nullStr.whenEmptyUse('anon'), 'anon');
      expect(''.whenEmptyUse('anon'), 'anon');
      expect('ada'.whenEmptyUse('anon'), 'ada');
    });

    test('whenEmptyOrNull normalizes empty to null', () {
      const String? nullStr = null;
      expect(nullStr.whenEmptyOrNull, isNull);
      expect(''.whenEmptyOrNull, isNull);
      expect('ada'.whenEmptyOrNull, 'ada');
    });

    test('isNullOrBlank treats whitespace-only as absent', () {
      const String? nullStr = null;
      expect(nullStr.isNullOrBlank, isTrue);
      expect(''.isNullOrBlank, isTrue);
      expect('   '.isNullOrBlank, isTrue);
      expect(' ada '.isNullOrBlank, isFalse);
    });

    test('isNotNullNorBlank mirrors isNullOrBlank', () {
      const String? nullStr = null;
      expect(nullStr.isNotNullNorBlank, isFalse);
      expect('   '.isNotNullNorBlank, isFalse);
      expect('ada'.isNotNullNorBlank, isTrue);
    });
  });
}
