# portfolio_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
 

flutter build apk --analyse-size
# Reduce App Size

1.  flutter build apk --obfuscate --split-debug-info=some_parent_directory/some_child_directory
2. Remove unused code
3. Minimise plugins
4. Compress pictures and Videos

# Performance
1. Don't rebuild whole UI, user stateful builder
2. Split into smaller widgets.
3. Use Isolates
4. Use effects onyl when necessary.
