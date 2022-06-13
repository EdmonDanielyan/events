import 'package:equatable/equatable.dart';
import 'package:ink_mobile/messenger/api/rest_client/error/error_response.dart';

enum LoadingState { init, loading, loaded, error }

class RestApiServiceState<T, K> extends Equatable {
  final Future<dynamic> Function() load;
  final LoadingState loadingState;

  const RestApiServiceState({
    required this.load,
    this.loadingState = LoadingState.init,
  });

  RestApiServiceState<T, K> copyWith({
    Future<dynamic> Function()? load,
    LoadingState? loadingState,
    bool? appToken,
    ErrorApiResponse? errorApiResponse,
  }) {
    return RestApiServiceState<T, K>(
      load: load ?? this.load,
      loadingState: loadingState ?? this.loadingState,
    );
  }

  @override
  String toString() {
    return 'RestApiServiceState(load: $load, loadingState: $loadingState)';
  }

  @override
  List<Object?> get props => [load, loadingState];
}
