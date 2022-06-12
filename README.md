# portfolio_flutter

A personal guide to do Flutter better.

## Things to keep in knowledge
+ Software Design Pattern
    + BLOC
    + MVP
    + MVVM
    + MVC
+ Design Guideline
+ User Experience
+ Native Coding for custom work
+ CI/CD


# Reduce App Size

1.  flutter build apk --obfuscate --split-debug-info=some_parent_directory/some_child_directory
2. Remove unused code
3. Minimise plugins
4. Compress pictures and Videos
5. flutter build apk --analyse-size
 
# Performance
1. Don't rebuild whole UI, user stateful builder
2. Split into smaller widgets.
3. Use Isolates
4. Use effects onyl when necessary.


##Links
1. [markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
1. [deep linking](https://docs.flutter.dev/development/ui/navigation/deep-linking)
