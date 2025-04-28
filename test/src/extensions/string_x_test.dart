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
}
