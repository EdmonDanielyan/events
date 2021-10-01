class ErrorModel {
  final Exception exception;
  final String msg;
  ErrorModel({
    required this.exception,
    required this.msg,
  });

  ErrorModel copyWith({
    Exception? exception,
    String? msg,
  }) {
    return ErrorModel(
      exception: exception ?? this.exception,
      msg: msg ?? this.msg,
    );
  }
}
