import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';
import 'package:test/test.dart';

void main() {
  group('EmptyOrNotListX', () {
    test('whenEmptyUse returns original list when not empty', () {
      final list = [1, 2, 3];
      final fallback = [4, 5, 6];
      expect(list.whenEmptyUse(fallback), equals(list));
    });

    test('whenEmptyUse returns fallback list when empty', () {
      final List<int> list = [];
      final fallback = [1, 2, 3];
      expect(list.whenEmptyUse(fallback), equals(fallback));
    });
  });
}
