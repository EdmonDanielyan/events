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


### API generation

Перед генерацией необходимо получить у бэкенда актуальный specification.yaml и заменить им файл ./tools/specification.yaml

Для генерации необходимых API методов необходимо запустить скрипт ./tools/generate-main-api.sh

В случае возникновения ошибок необходимо обратить внимание на файл ./main_api_client/pubspec.yaml
Зависимость build_runner должна быть настолько свежей, насколько это возможожно 
Также был обнаружен факт перезаписывания данного файла, чему виной файл ./tools/dart-dio-custom/pubspec.mustache
Поэтому стоит следить и за версией build_runner в данном файле 

После генерации возникают ошибки следующего плана:
error: The argument type 'BuiltList<Uint8List>' can't be assigned to the parameter type 'List<int>'
В такого рода строках
r'files': MultipartFile.fromBytes(files, filename: r'files'),
Для решения ошибок достаточно преобразовать данную строку в
r'files': files,
Править автосгенерированные файлы - нехорошо, но альтернативы пока нет :(


### OneSignal

Настройка Flutter, согласно официальной документации https://documentation.onesignal.com/docs/flutter-sdk-setup
Генерация ios сертификатов OneSignal https://documentation.onesignal.com/docs/generate-an-ios-push-certificate

В приложении используется базовая структура пуша OneSignal:
Основные поля: title, subtitle, message, image, launchUrl
Для навигации в приложении по пушу используется поле launchUrl (автоматический редирект по launchUrl отключается на каждой платформе отдельно https://documentation.onesignal.com/docs/links)

### Локализация приложения

По пути ./lib/localizations/i18n лежат два .arb файла
Для того, чтобы добавить новое значение для локализации, пишем туда уникальный ключ для добавляемой строчки и для файлов app_ru и app_en прописываем русский и английский вариант строки соответственно
Для использования необходимой строчки в коде используем сущность localizationInstance и обращаемся к ней по ключу 