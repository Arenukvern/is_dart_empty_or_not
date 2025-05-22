import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';

void main() {
  // String examples
  print('--- String Examples ---');
  String? nullString; // Example of a nullable string that is null
  String emptyString = ''; // Example of a non-nullable empty string
  String nonEmptyString = 'Hello Dart!';

  // Demonstrating onEmpty with a nullable string that is null
  // Note: onEmpty will not be called because the string itself is null, not just empty.
  // The ?. operator ensures that onEmpty is only called if nullString is not null.
  print('Demonstrating onEmpty with a nullable string that is null:');
  nullString?.onEmpty(() {
    print('  nullString is empty.'); // This will not be printed
  });
  if (nullString == null) {
    print('  nullString is null, so onEmpty was not called on it via ?. operator.');
  }

  // Demonstrating onEmpty with a non-nullable empty string
  print('Demonstrating onEmpty with a non-nullable empty string:');
  emptyString.onEmpty(() {
    print('  emptyString is empty.'); // This will be printed
  });

  // Demonstrating onNotEmpty with a non-empty string
  print('Demonstrating onNotEmpty with a non-empty string:');
  nonEmptyString.onNotEmpty((value) {
    print('  Non-empty string: $value'); // This will be printed
  });

  // Demonstrating whenEmptyUse with a nullable string that is null
  // Using ?. as suggested by analyzer. If nullString is null, this will print null.
  print('Demonstrating whenEmptyUse with a nullable string that is null:');
  print('  Using whenEmptyUse for nullString: ${nullString?.whenEmptyUse('Default String')}'); // Prints: null

  // Demonstrating whenEmptyUse with a non-nullable empty string
  print('Demonstrating whenEmptyUse with a non-nullable empty string:');
  print('  Using whenEmptyUse for emptyString: ${emptyString.whenEmptyUse('Default String')}'); // Prints: Default String
  
  // Demonstrating whenEmptyUse with a non-empty string
  print('Demonstrating whenEmptyUse with a non-empty string:');
  print('  Using whenEmptyUse for nonEmptyString: ${nonEmptyString.whenEmptyUse('Default String')}'); // Prints: Hello Dart!
  print('');

  // List examples
  print('--- List Examples ---');
  List<int> emptyList = [];
  List<int> nonEmptyList = [1, 2, 3];
  List<int> defaultList = [4, 5, 6];

  print('Using whenEmptyUse for empty list: ${emptyList.whenEmptyUse(defaultList)}');
  print('Using whenEmptyUse for non-empty list: ${nonEmptyList.whenEmptyUse(defaultList)}');
  print('');

  // Map examples
  print('--- Map Examples ---');
  Map<String, int> emptyMap = {};
  Map<String, int> nonEmptyMap = {'a': 1, 'b': 2};
  Map<String, int> defaultMap = {'c': 3, 'd': 4};

  print('Using whenEmptyUse for empty map: ${emptyMap.whenEmptyUse(defaultMap)}');
  print('Using whenEmptyUse for non-empty map: ${nonEmptyMap.whenEmptyUse(defaultMap)}');
  print('');

  // Set examples
  print('--- Set Examples ---');
  Set<String> emptySet = {};
  Set<String> nonEmptySet = {'apple', 'banana'};
  Set<String> defaultSet = {'orange', 'grape'};

  print('Using whenEmptyUse for empty set: ${emptySet.whenEmptyUse(defaultSet)}');
  print('Using whenEmptyUse for non-empty set: ${nonEmptySet.whenEmptyUse(defaultSet)}');
  print('');

  // Num examples (int and double)
  print('--- Num Examples ---');
  int zeroInt = 0;
  int nonZeroInt = 5;
  double zeroDouble = 0.0;
  double nonZeroDouble = 3.14;
  num negativeNum = -10;
  num positiveNum = 10;

  print('zeroInt.isZero: ${zeroInt.isZero}'); 
  print('nonZeroInt.isZero: ${nonZeroInt.isZero}'); 
  print('zeroInt.whenZeroUse(10): ${zeroInt.whenZeroUse(10)}'); 
  print('nonZeroInt.whenZeroUse(10): ${nonZeroInt.whenZeroUse(10)}'); 

  print('zeroDouble.isZero: ${zeroDouble.isZero}'); 
  print('nonZeroDouble.isZero: ${nonZeroDouble.isZero}'); 
  print('zeroDouble.whenZeroUse(1.0): ${zeroDouble.whenZeroUse(1.0)}'); 
  print('nonZeroDouble.whenZeroUse(1.0): ${nonZeroDouble.whenZeroUse(1.0)}');

  print('positiveNum.isPositive: ${positiveNum.isPositive}'); 
  print('zeroInt.isPositive: ${zeroInt.isPositive}'); // As per library, 0 is positive
  print('negativeNum.isPositive: ${negativeNum.isPositive}'); 
  print('');


  // Duration examples
  print('--- Duration Examples ---');
  Duration zeroDuration = Duration.zero;
  Duration nonZeroPositiveDuration = Duration(seconds: 5);
  Duration negativeDuration = Duration(seconds: -5);
  Duration defaultDuration = Duration(minutes: 1);

  print('zeroDuration.isZero: ${zeroDuration.isZero}');
  print('nonZeroPositiveDuration.isZero: ${nonZeroPositiveDuration.isZero}');

  print('zeroDuration.whenZeroUse(defaultDuration): ${zeroDuration.whenZeroUse(defaultDuration)}');
  print('nonZeroPositiveDuration.whenZeroUse(defaultDuration): ${nonZeroPositiveDuration.whenZeroUse(defaultDuration)}');

  print('zeroDuration.isPositive: ${zeroDuration.isPositive}'); // Duration.zero is considered positive
  print('nonZeroPositiveDuration.isPositive: ${nonZeroPositiveDuration.isPositive}');
  print('negativeDuration.isPositive: ${negativeDuration.isPositive}');
  
  print('zeroDuration.isNegative: ${zeroDuration.isNegative}');
  print('nonZeroPositiveDuration.isNegative: ${nonZeroPositiveDuration.isNegative}');
  print('negativeDuration.isNegative: ${negativeDuration.isNegative}');

  print('zeroDuration.whenNegativeUse(defaultDuration): ${zeroDuration.whenNegativeUse(defaultDuration)}');
  print('nonZeroPositiveDuration.whenNegativeUse(defaultDuration): ${nonZeroPositiveDuration.whenNegativeUse(defaultDuration)}');
  print('negativeDuration.whenNegativeUse(defaultDuration): ${negativeDuration.whenNegativeUse(defaultDuration)}');
}
