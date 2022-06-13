import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ink_mobile/app.dart';
import 'package:ink_mobile/setup.dart';

class I18n {
  static final all = [
    const Locale('ru'),
    const Locale('en'),
  ];
}

void setupI18n(GetIt getIt) {
  getIt.registerFactory<AppLocalizations>(
      () => AppLocalizations.of(App.materialKey!.currentContext!)!);
}

AppLocalizations get localizationInstance => getIt<AppLocalizations>();
