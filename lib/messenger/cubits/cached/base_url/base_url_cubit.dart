import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/urls.dart';
import 'base_url_state.dart';

@singleton
class BaseUrlCubit extends HydratedCubit<BaseUrlState> {
  BaseUrlCubit() : super(BaseUrlState(url: Urls.baseUrls.first));

  String get url => state.url;

  void setNewUrl(String url) {
    emit(state.copyWith(url: url));
  }

  @override
  BaseUrlState? fromJson(Map<String, dynamic> json) =>
      BaseUrlState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(BaseUrlState state) => state.toMap();
}
