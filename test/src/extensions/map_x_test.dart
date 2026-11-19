import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotMapX', () {
    test('whenEmptyUse returns original map when not empty', () {
      final map = {'a': 1, 'b': 2};
      final fallback = {'c': 3, 'd': 4};
      expect(map.whenEmptyUse(fallback), equals(map));
    });

    test('whenEmptyUse returns fallback map when empty', () {
      final Map<String, int> map = {};
      final fallback = {'a': 1, 'b': 2};
      expect(map.whenEmptyUse(fallback), equals(fallback));
    });
  });

  group('NullableEmptyOrNotMapX', () {
    test('isNullOrEmpty is true for null and empty maps', () {
      const Map<String, int>? nullMap = null;
      expect(nullMap.isNullOrEmpty, isTrue);
      expect(<String, int>{}.isNullOrEmpty, isTrue);
    });

    test('isNotNullNorEmpty mirrors isNullOrEmpty', () {
      const Map<String, int>? nullMap = null;
      expect(nullMap.isNotNullNorEmpty, isFalse);
      expect(<String, int>{'a': 1}.isNotNullNorEmpty, isTrue);
    });

    test('whenEmptyUse falls back for null and empty maps', () {
      const Map<String, int>? nullMap = null;
      expect(nullMap.whenEmptyUse(<String, int>{'x': 0}), <String, int>{
        'x': 0,
      });
      expect(<String, int>{}.whenEmptyUse(<String, int>{'x': 0}), <String, int>{
        'x': 0,
      });
      expect(
        <String, int>{'a': 1}.whenEmptyUse(<String, int>{'x': 0}),
        <String, int>{'a': 1},
      );
    });
  });
}
