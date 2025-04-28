# is_dart_empty_or_not

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Version](https://img.shields.io/badge/version-0.1.0-blue)](https://pub.dev/packages/is_dart_empty_or_not)

A minimal Dart package providing concise extension methods for handling empty and zero values on core types (`String`, `List`, `Set`, `Map`, `num`, `int`, `double`).

- **Purpose:** Simplifies fallback logic and conditional actions for empty/zero values.
- **Origin:** Inspired by Dart empty patterns [String.isEmpty, List.isEmpty etc..], see more about it [Dart non-nullable initialization pattern](https://medium.com/@antmalofeev/dart-non-nullable-initialization-pattern-a7465740e27c)

## Features

- Extension methods for `String`, `List`, `Set`, `Map`, `num`, `int`, `double`
- Fallback and conditional logic in a single call
- Zero dependencies

## Quick Start

```yaml
# pubspec.yaml
dependencies:
  is_dart_empty_or_not: ^0.1.0
```

```dart
import 'package:is_dart_empty_or_not/is_dart_empty_or_not.dart';

final name = ''.whenEmptyUse('Anonymous'); // 'Anonymous'
final items = <int>[].whenEmptyUse([1, 2]); // [1, 2]
final value = 0.whenZeroUse(42); // 42

''.onNotEmpty((s) => print('Not empty!')); // (does nothing)
```

## API Overview

| Type           | Method       | Signature / Description                                                       |
| -------------- | ------------ | ----------------------------------------------------------------------------- |
| String         | whenEmptyUse | `String whenEmptyUse(String value)`<br>Returns the provided value if empty    |
| String         | onNotEmpty   | `void onNotEmpty(void Function(String))`<br>Runs callback if not empty        |
| String         | onEmpty      | `void onEmpty(void Function(String))`<br>Runs callback if empty               |
| List           | whenEmptyUse | `List<T> whenEmptyUse(List<T> values)`<br>Returns the provided value if empty |
| Set            | whenEmptyUse | `Set<T> whenEmptyUse(Set<T> values)`<br>Returns the provided value if empty   |
| Map            | whenEmptyUse | `Map<K,V> whenEmptyUse(Map<K,V> map)`<br>Returns the provided value if empty  |
| num/int/double | whenZeroUse  | `num whenZeroUse(num value)`<br>Returns fallback if zero                      |
| num            | isZero       | `bool get isZero`<br>True if value is zero                                    |
| num            | isPositive   | `bool get isPositive`<br>True if value is positive                            |

## Examples

### String

```dart
''.whenEmptyUse('default'); // 'default'
'foo'.whenEmptyUse('default'); // 'foo'

'bar'.onNotEmpty((s) => print(s)); // prints 'bar'
''.onEmpty(() => print('foo')); // prints 'foo'
```

### List

```dart
[].whenEmptyUse([1, 2]); // [1, 2]
[3].whenEmptyUse([1, 2]); // [3]
```

### Set

```dart
<Set<int>>{}.whenEmptyUse({1, 2}); // {1, 2}
{3}.whenEmptyUse({1, 2}); // {3}
```

### Map

```dart
<Map<int, String>>{}.whenEmptyUse({1: 'a'}); // {1: 'a'}
{2: 'b'}.whenEmptyUse({1: 'a'}); // {2: 'b'}
```

### num/int/double

```dart
0.whenZeroUse(42); // 42
1.whenZeroUse(42); // 1

0.0.whenZeroUse(3.14); // 3.14
2.7.whenZeroUse(3.14); // 2.7

(0).isZero; // true
(1).isZero; // false

(5).isPositive; // true
(-2).isPositive; // false
```

## Changelog

See [CHANGELOG.md](CHANGELOG.md)

## License

This package is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
