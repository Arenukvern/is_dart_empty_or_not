# 0.5.1

- DOCS: document the type-promotion caveat on the nullable extensions
  (Dart does not promote through extension getters; keep the explicit
  form when the value is used after the guard).

# 0.5.0

- ADDED: nullable-aware extensions for `String?`, `List?`, `Map?` and `Set?`:
  `isNullOrEmpty` / `isNotNullNorEmpty` plus a nullable `whenEmptyUse` with the
  same call shape as the non-nullable one — collapses the common
  `value == null || value.isEmpty` guard into a single call.

# 0.4.0

- BREAKING: dependencies update:

  ```yaml
  environment:
    sdk: ">=3.11.0 <4.0.0"
  ```

# 0.3.0

- BREAKING: dependencies update:

  ```yaml
  environment:
    sdk: ">=3.10.0 <4.0.0"

  dev_dependencies:
    lints: ^6.0.0
    test: ^1.29.0
    xsoulspace_lints: ^0.1.2
  ```

# 0.2.3

- Added example file
- Fixed repository link

# 0.2.2

- Added tests and coverage

# 0.2.0

- Added extension methods for Duration:
  - isZero
  - whenZeroUse
  - isNegative
  - whenNegativeUse
  - isPositive

# 0.1.0

initial version
