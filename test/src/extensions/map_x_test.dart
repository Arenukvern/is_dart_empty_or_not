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
}
