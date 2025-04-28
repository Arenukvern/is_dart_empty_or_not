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
}
