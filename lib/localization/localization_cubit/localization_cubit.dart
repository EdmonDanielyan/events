import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class LocalizationCubit extends Cubit<LanguageStrings> {
  LocalizationCubit({required LanguageStrings initialState})
      : super(initialState);

  void changeLanguage(LanguageStrings lang) {
    emit(lang);
  }
}
