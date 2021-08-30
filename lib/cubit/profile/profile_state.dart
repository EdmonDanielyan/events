import 'package:ink_mobile/models/user_data.dart';

enum ProfileStateType {LOADING, LOADED, ERROR, OTHER_USER_LOADED}

class ProfileState {
  final UserProfileData? data;
  final ProfileStateType type;
  final String? errorMessage;

  ProfileState({
    required this.type,
    this.data,
    this.errorMessage
  }) : assert(
    type != ProfileStateType.ERROR
    || errorMessage != null,
    'errorMessage must not be null in errorState'
  );
}