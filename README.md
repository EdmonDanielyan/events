# ink_mobile

Проект для компании ИНК

## Настройка IDE

Для настройки проекта и поддержки генерации кода выполните из директории проекта:

- Для Windows: setup.cmd
- Для Linux/MacOS: setup.sh

### В случае, если IDE показывает ошибки 

Например:
`error: Target of URI doesn't exist: 'package:flutter_gen/gen_l10n/app_localizations.dart'. (uri_does_not_exist at [ink_mobile] lib\components\ink_drop_down.dart:2)`

1. Выполните сборку проекта:

    Для Android: 

    Для прода
    `flutter build apk --no-sound-null-safety -t lib/prod_main.dart`
    Для тестового сервера
   `flutter build apk --no-sound-null-safety -t lib/dev_main.dart`

    Или можно использовать готовый скрипт build.sh
   `./build.sh $env $paltform`, описание параметров можно найти в скрипте

    или, в случае, если сборка не работает
    `flutter build apk --release --no-sound-null-safety --obfuscate --split-debug-info=./debug` 
    
    Для IOS:
    
    `flutter pub build ios --no-sound-null-safety`

2. Добавьте директорию .dart_tool/flutter_gen/ в исходники проекта


### OneSignal

Настройка Flutter, согласно официальной документации https://documentation.onesignal.com/docs/flutter-sdk-setup
Генерация ios сертификатов OneSignal https://documentation.onesignal.com/docs/generate-an-ios-push-certificate

В приложении используется базовая структура пуша OneSignal:
Основные поля: title, subtitle, message, image, launchUrl
Для навигации в приложении по пушу используется поле launchUrl (автоматический редирект по launchUrl отключается на каждой платформе отдельно https://documentation.onesignal.com/docs/links)
