SetLocal EnableExtensions
call flutter pub get
call flutter packages pub run build_runner build --delete-conflicting-outputs