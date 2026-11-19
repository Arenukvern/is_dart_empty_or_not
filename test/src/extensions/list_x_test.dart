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

  group('NullableEmptyOrNotListX', () {
    test('isNullOrEmpty is true for null and empty lists', () {
      const List<int>? nullList = null;
      expect(nullList.isNullOrEmpty, isTrue);
      expect(<int>[].isNullOrEmpty, isTrue);
    });

    test('isNotNullNorEmpty mirrors isNullOrEmpty', () {
      const List<int>? nullList = null;
      expect(nullList.isNotNullNorEmpty, isFalse);
      expect(<int>[1].isNotNullNorEmpty, isTrue);
    });

    test('whenEmptyUse falls back for null and empty lists', () {
      const List<int>? nullList = null;
      expect(nullList.whenEmptyUse(<int>[7]), <int>[7]);
      expect(<int>[].whenEmptyUse(<int>[7]), <int>[7]);
      expect(<int>[1].whenEmptyUse(<int>[7]), <int>[1]);
    });
  });
}
