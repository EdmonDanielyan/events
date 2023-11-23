import 'package:equatable/equatable.dart';
import 'package:dio/src/response.dart';
import 'package:openapi/openapi.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  final Response<RequiredSuccess> response;
  const LogoutLoaded(this.response);
  @override
  List<Object> get props => [response];
}

class LogoutError extends LogoutState {
  final Object error;
  const LogoutError(this.error);
}
