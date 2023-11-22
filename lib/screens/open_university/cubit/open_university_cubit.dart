import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/screens/open_university/components/open_university_filter_slider.dart';

import 'open_university_state.dart';

@injectable
class OpenUniversityCubit extends Cubit<OpenUniversityState> {
  OpenUniversityCubit()
      : super(const OpenUniversityState(
            type: OpenUniversityStateType.ABOUT_PROJECT));

  Future<void> load(OpenUniversityFilterCodes code) async {
    try {
      await Token.setNewTokensIfExpired();

      switch (code) {
        case OpenUniversityFilterCodes.about_project:
          {
            _emitState(type: OpenUniversityStateType.ABOUT_PROJECT);
            break;
          }

        case OpenUniversityFilterCodes.events:
          {
            _emitState(type: OpenUniversityStateType.EVENTS);
            break;
          }

        case OpenUniversityFilterCodes.ink_literacy:
          {
            _emitState(type: OpenUniversityStateType.INK_LITERACY);
            break;
          }

        case OpenUniversityFilterCodes.learning_materials:
          {
            _emitState(type: OpenUniversityStateType.LEARNING_MATERIALS);
            break;
          }
      }
    } on DioException catch (_) {
    } on Exception catch (_) {}
  }

  void _emitState({required OpenUniversityStateType type, dynamic data}) {
    emit(OpenUniversityState(type: type, data: data));
  }
}
