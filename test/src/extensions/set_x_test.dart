import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotSetX', () {
    test('whenEmptyUse returns original set when not empty', () {
      final set = {1, 2, 3};
      final fallback = {4, 5, 6};
      expect(set.whenEmptyUse(fallback), equals(set));
    });

    test('whenEmptyUse returns fallback set when empty', () {
      final Set<int> set = {};
      final fallback = {1, 2, 3};
      expect(set.whenEmptyUse(fallback), equals(fallback));
    });
  });

  group('NullableEmptyOrNotSetX', () {
    test('isNullOrEmpty is true for null and empty sets', () {
      const Set<int>? nullSet = null;
      expect(nullSet.isNullOrEmpty, isTrue);
      expect(<int>{}.isNullOrEmpty, isTrue);
    });

    test('isNotNullNorEmpty mirrors isNullOrEmpty', () {
      const Set<int>? nullSet = null;
      expect(nullSet.isNotNullNorEmpty, isFalse);
      expect(<int>{1}.isNotNullNorEmpty, isTrue);
    });

    test('whenEmptyUse falls back for null and empty sets', () {
      const Set<int>? nullSet = null;
      expect(nullSet.whenEmptyUse(<int>{7}), <int>{7});
      expect(<int>{}.whenEmptyUse(<int>{7}), <int>{7});
      expect(<int>{1}.whenEmptyUse(<int>{7}), <int>{1});
    });

    test('whenEmptyOrNull normalizes empty to null', () {
      const Set<int>? nullSet = null;
      expect(nullSet.whenEmptyOrNull, isNull);
      expect(<int>{}.whenEmptyOrNull, isNull);
      expect(<int>{1}.whenEmptyOrNull, <int>{1});
    });
  });
}
