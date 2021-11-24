import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/app.dart';

class I18n {
  static final all = [
    const Locale('ru'),
    const Locale('en'),
  ];
}

AppLocalizations get localizationInstance =>
    AppLocalizations.of(App.materialKey!.currentContext!)!;
