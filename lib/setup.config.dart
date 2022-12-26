// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ink_mobile/components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i61;
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i83;
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i84;
import 'package:ink_mobile/core/cubit/selectable/selectable_cubit.dart' as _i89;
import 'package:ink_mobile/core/cubit/selectfield/selectfield_cubit.dart'
    as _i90;
import 'package:ink_mobile/core/handlers/AuthHandler.dart' as _i104;
import 'package:ink_mobile/core/logging/file_log_appender.dart' as _i105;
import 'package:ink_mobile/cubit/announcements_detail/announcements_detail_cubit.dart'
    as _i3;
import 'package:ink_mobile/cubit/announcements_detail/sources/network.dart'
    as _i4;
import 'package:ink_mobile/cubit/announcements_list/announcements_list_cubit.dart'
    as _i5;
import 'package:ink_mobile/cubit/announcements_list/sources/network.dart'
    as _i6;
import 'package:ink_mobile/cubit/auth/auth_cubit.dart' as _i11;
import 'package:ink_mobile/cubit/auth/sources/network.dart' as _i12;
import 'package:ink_mobile/cubit/birthdays/birthdays_cubit.dart' as _i14;
import 'package:ink_mobile/cubit/birthdays/sources/network.dart' as _i15;
import 'package:ink_mobile/cubit/boot/boot_cubit.dart' as _i16;
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart'
    as _i20;
import 'package:ink_mobile/cubit/chat_person_list/sources/network.dart' as _i23;
import 'package:ink_mobile/cubit/events_detail/events_detail_cubit.dart'
    as _i36;
import 'package:ink_mobile/cubit/events_detail/sources/fetch/network.dart'
    as _i39;
import 'package:ink_mobile/cubit/events_detail/sources/invite/network.dart'
    as _i37;
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart' as _i40;
import 'package:ink_mobile/cubit/events_list/sources/network.dart' as _i41;
import 'package:ink_mobile/cubit/feedback_answer_list/answer_list_cubit.dart'
    as _i43;
import 'package:ink_mobile/cubit/feedback_answer_list/sources/network.dart'
    as _i44;
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i50;
import 'package:ink_mobile/cubit/learning_materials_list/sources/network.dart'
    as _i48;
import 'package:ink_mobile/cubit/logout/logout_cubit.dart' as _i54;
import 'package:ink_mobile/cubit/logout/sources/logout_network.dart' as _i55;
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart'
    as _i56;
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart'
    as _i38;
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart' as _i58;
import 'package:ink_mobile/cubit/main_page/main_cubit.dart' as _i59;
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart' as _i62;
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart'
    as _i65;
import 'package:ink_mobile/cubit/news_comments/sources/comment/network.dart'
    as _i63;
import 'package:ink_mobile/cubit/news_comments/sources/fetch/network.dart'
    as _i66;
import 'package:ink_mobile/cubit/news_comments/sources/like/network.dart'
    as _i67;
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart' as _i68;
import 'package:ink_mobile/cubit/news_detail/sources/fetch/network.dart'
    as _i69;
import 'package:ink_mobile/cubit/news_detail/sources/like/network.dart' as _i70;
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart' as _i71;
import 'package:ink_mobile/cubit/news_list/sources/network.dart' as _i72;
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_cubit.dart'
    as _i78;
import 'package:ink_mobile/cubit/personnel_movements/sources/network.dart'
    as _i100;
import 'package:ink_mobile/cubit/profile/profile_cubit.dart' as _i79;
import 'package:ink_mobile/cubit/profile/sources/fetch/network.dart' as _i80;
import 'package:ink_mobile/cubit/profile/sources/thank/network.dart' as _i81;
import 'package:ink_mobile/cubit/references/references_cubit.dart' as _i82;
import 'package:ink_mobile/cubit/references/sources/check_permission/network.dart'
    as _i19;
import 'package:ink_mobile/cubit/references/sources/get_autofill_data/network.dart'
    as _i46;
import 'package:ink_mobile/cubit/search/search_cubit.dart' as _i85;
import 'package:ink_mobile/cubit/search/sources/network.dart' as _i86;
import 'package:ink_mobile/cubit/send_feedback_form/send_form_cubit.dart'
    as _i93;
import 'package:ink_mobile/cubit/send_feedback_form/sources/network.dart'
    as _i91;
import 'package:ink_mobile/cubit/send_medical_ins_form/send_form_cubit.dart'
    as _i94;
import 'package:ink_mobile/cubit/send_medical_ins_form/sources/network.dart'
    as _i95;
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart'
    as _i97;
import 'package:ink_mobile/cubit/send_reference_form/sources/network.dart'
    as _i98;
import 'package:ink_mobile/cubit/tags_list/sources/network.dart' as _i102;
import 'package:ink_mobile/cubit/tags_list/tags_list_cubit.dart' as _i101;
import 'package:ink_mobile/messenger/cubits/cached/base_url/base_url_cubit.dart'
    as _i13;
import 'package:ink_mobile/messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart'
    as _i21;
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart'
    as _i17;
import 'package:ink_mobile/messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart'
    as _i106;
import 'package:ink_mobile/messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart'
    as _i47;
import 'package:ink_mobile/messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart'
    as _i74;
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_cubit.dart'
    as _i18;
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state_cubit.dart'
    as _i9;
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_cubit.dart'
    as _i75;
import 'package:ink_mobile/messenger/messenger/listeners/add_participant.dart'
    as _i24;
import 'package:ink_mobile/messenger/messenger/listeners/connect.dart' as _i22;
import 'package:ink_mobile/messenger/messenger/listeners/delete_message.dart'
    as _i25;
import 'package:ink_mobile/messenger/messenger/listeners/direct_message.dart'
    as _i26;
import 'package:ink_mobile/messenger/messenger/listeners/disconnect.dart'
    as _i34;
import 'package:ink_mobile/messenger/messenger/listeners/error.dart' as _i35;
import 'package:ink_mobile/messenger/messenger/listeners/invite.dart' as _i27;
import 'package:ink_mobile/messenger/messenger/listeners/message.dart' as _i28;
import 'package:ink_mobile/messenger/messenger/listeners/online_listener.dart'
    as _i29;
import 'package:ink_mobile/messenger/messenger/listeners/read_message_listener.dart'
    as _i30;
import 'package:ink_mobile/messenger/messenger/listeners/remove_participant.dart'
    as _i31;
import 'package:ink_mobile/messenger/messenger/listeners/update_chat_listener.dart'
    as _i32;
import 'package:ink_mobile/messenger/messenger/listeners/update_message.dart'
    as _i33;
import 'package:ink_mobile/messenger/providers/app_token.dart' as _i10;
import 'package:ink_mobile/messenger/providers/messenger.dart' as _i60;
import 'package:ink_mobile/messenger/providers/notifications.dart' as _i51;
import 'package:ink_mobile/models/announcement_data.dart' as _i8;
import 'package:ink_mobile/models/event_data.dart' as _i42;
import 'package:ink_mobile/models/feedback/management_answer.dart' as _i45;
import 'package:ink_mobile/models/learning_materials_data.dart' as _i49;
import 'package:ink_mobile/models/new_comment_entities.dart' as _i64;
import 'package:ink_mobile/models/news_data.dart' as _i73;
import 'package:ink_mobile/models/pagination.dart' as _i7;
import 'package:ink_mobile/models/send_reference_form_entities.dart' as _i99;
import 'package:ink_mobile/models/token.dart' as _i103;
import 'package:ink_mobile/providers/local_pin_provider.dart' as _i52;
import 'package:ink_mobile/providers/lock_app.dart' as _i53;
import 'package:ink_mobile/providers/main_api.dart' as _i57;
import 'package:ink_mobile/providers/package_info.dart' as _i77;
import 'package:ink_mobile/providers/secure_storage.dart' as _i87;
import 'package:ink_mobile/providers/security_checker.dart' as _i88;
import 'package:ink_mobile/screens/feedback/components/form/entities.dart'
    as _i92;
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart' as _i107;
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart'
    as _i96;
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart'
    as _i76;

import 'core/logging/files.dart' as _i108;
import 'models/token.dart' as _i109;

const String _test = 'test';
const String _prod = 'prod';
const String _dev = 'dev';
const String _unitTest = 'unitTest';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final logFilePathInjector = _$LogFilePathInjector();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  gh.factory<_i3.AnnouncementCubit>(() => _i3.AnnouncementCubit());
  gh.factoryParam<_i4.AnnouncementsDetailNetworkRequest, int?, dynamic>((
    announcementId,
    _,
  ) =>
      _i4.AnnouncementsDetailNetworkRequest(announcementId: announcementId));
  gh.singleton<_i5.AnnouncementsListCubit>(_i5.AnnouncementsListCubit());
  gh.factoryParam<_i6.AnnouncementsListNetworkRequest,
      _i7.Pagination<_i8.AnnouncementData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i6.AnnouncementsListNetworkRequest(pagination: pagination));
  gh.singleton<_i9.AppStateCubit>(_i9.AppStateCubit());
  gh.singleton<_i10.AppTokenProvider>(_i10.AppTokenProvider());
  gh.factory<_i11.AuthCubit>(() => _i11.AuthCubit());
  gh.factoryParam<_i12.AuthNetworkRequest, String?, String?>((
    login,
    password,
  ) =>
      _i12.AuthNetworkRequest(
        login: login,
        password: password,
      ));
  gh.singleton<_i13.BaseUrlCubit>(_i13.BaseUrlCubit());
  gh.lazySingleton<_i14.BirthdaysCubit>(() => _i14.BirthdaysCubit());
  gh.singleton<_i15.BirthdaysNetworkRequest>(_i15.BirthdaysNetworkRequest());
  gh.singleton<_i16.BootCubit>(_i16.BootCubit());
  gh.singleton<_i17.CachedChatsCubit>(_i17.CachedChatsCubit());
  gh.singleton<_i18.CachedUsersCubit>(_i18.CachedUsersCubit());
  gh.singleton<_i19.CanInquireNetworkRequest>(_i19.CanInquireNetworkRequest());
  gh.singleton<_i20.ChatPersonListCubit>(_i20.ChatPersonListCubit());
  gh.singleton<_i21.ChatUsersPickerCubit>(_i21.ChatUsersPickerCubit());
  gh.singleton<_i22.ConnectListener>(_i22.ConnectListener());
  gh.factoryParam<_i23.ContactsNetworkRequest, String?, dynamic>((
    query,
    _,
  ) =>
      _i23.ContactsNetworkRequest(query: query));
  gh.singleton<_i24.CustomAddParticipantListener>(
      _i24.CustomAddParticipantListener());
  gh.singleton<_i25.CustomDeleteMessageListener>(
      _i25.CustomDeleteMessageListener());
  gh.singleton<_i26.CustomDirectMessageListener>(
      _i26.CustomDirectMessageListener());
  gh.singleton<_i27.CustomInviteListener>(_i27.CustomInviteListener());
  gh.singleton<_i28.CustomMessageListener>(_i28.CustomMessageListener());
  gh.singleton<_i29.CustomOnlineListener>(_i29.CustomOnlineListener());
  gh.singleton<_i30.CustomReadMessageListener>(
      _i30.CustomReadMessageListener());
  gh.singleton<_i31.CustomRemoveParticipantListener>(
      _i31.CustomRemoveParticipantListener());
  gh.singleton<_i32.CustomUpdateChatListener>(_i32.CustomUpdateChatListener());
  gh.singleton<_i33.CustomUpdateMessageListener>(
      _i33.CustomUpdateMessageListener());
  gh.singleton<_i26.DirectMessageListener>(_i26.DirectMessageListener());
  gh.singleton<_i34.DisconnectListener>(_i34.DisconnectListener());
  gh.singleton<_i35.ErrorListener>(_i35.ErrorListener());
  gh.factory<_i36.EventDetailCubit>(() => _i36.EventDetailCubit());
  gh.factoryParam<_i37.EventInviteNetworkRequest, int?, dynamic>((
    eventId,
    _,
  ) =>
      _i37.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i38.EventsAndAnnouncementsBlockCubit>(
      () => _i38.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i39.EventsDetailNetworkRequest, int?, dynamic>((
    eventId,
    _,
  ) =>
      _i39.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i40.EventsListCubit>(() => _i40.EventsListCubit());
  gh.factoryParam<_i41.EventsListNetworkRequest,
      _i7.Pagination<_i42.EventData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i41.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i43.FeedbackAnswerListCubit>(
      () => _i43.FeedbackAnswerListCubit());
  gh.factoryParam<_i44.FeedbackAnswerListNetworkRequest,
      _i7.Pagination<_i45.ManagementAnswer>?, dynamic>((
    pagination,
    _,
  ) =>
      _i44.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i46.GetAutofillNetworkRequest>(
      _i46.GetAutofillNetworkRequest());
  gh.singleton<_i47.HiddenMessagesCubit>(_i47.HiddenMessagesCubit());
  gh.singleton<_i27.InviteListener>(_i27.InviteListener());
  gh.factoryParam<_i48.LearningMaterialListNetworkRequest,
      _i7.Pagination<_i49.LearningMaterialsData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i48.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i50.LearningMaterialsListCubit>(
      () => _i50.LearningMaterialsListCubit());
  gh.singleton<_i51.LocalNotificationsProvider>(
      _i51.LocalNotificationsProvider());
  gh.lazySingleton<_i52.LocalPinProvider>(() => _i52.LocalPinProvider());
  gh.singleton<_i53.LockApp>(_i53.LockApp());
  gh.factory<_i54.LogoutCubit>(() => _i54.LogoutCubit());
  gh.factory<_i55.LogoutNetworkRequest>(() => _i55.LogoutNetworkRequest());
  gh.singleton<_i56.MainAnnouncementsListCubit>(
      _i56.MainAnnouncementsListCubit());
  gh.lazySingleton<_i57.MainApiProvider>(() => _i57.MainApiProvider());
  gh.factory<_i58.MainEventsListCubit>(() => _i58.MainEventsListCubit());
  gh.factory<_i59.MainPageCubit>(() => _i59.MainPageCubit());
  gh.singleton<_i60.MessengerProvider>(_i60.MessengerProvider());
  gh.singleton<_i61.NewBottomNavBarCubit>(_i61.NewBottomNavBarCubit());
  gh.singleton<_i62.NewsBlockCubit>(_i62.NewsBlockCubit());
  gh.factoryParam<_i63.NewsCommentsAddNetworkRequest, _i64.NewCommentEntities?,
      dynamic>((
    comment,
    _,
  ) =>
      _i63.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i65.NewsCommentsCubit>(() => _i65.NewsCommentsCubit());
  gh.factoryParam<_i66.NewsCommentsFetchNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i66.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i67.NewsCommentsLikeNetworkRequest, int?, dynamic>((
    commentId,
    _,
  ) =>
      _i67.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i68.NewsDetailCubit>(() => _i68.NewsDetailCubit());
  gh.factoryParam<_i69.NewsDetailNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i69.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i70.NewsLikeNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i70.NewsLikeNetworkRequest(newsId: newsId));
  gh.singleton<_i71.NewsListCubit>(_i71.NewsListCubit());
  gh.factoryParam<_i72.NewsListNetworkRequest,
      _i7.Pagination<_i73.NewsItemData>?, String?>((
    pagination,
    filter,
  ) =>
      _i72.NewsListNetworkRequest(
        pagination: pagination,
        filter: filter,
      ));
  gh.singleton<_i74.NotificationsDisabledChatsCubit>(
      _i74.NotificationsDisabledChatsCubit());
  gh.singleton<_i75.OnlineCubit>(_i75.OnlineCubit());
  gh.factory<_i76.OpenUniversityCubit>(() => _i76.OpenUniversityCubit());
  gh.lazySingleton<_i77.PackageInfoProvider>(() => _i77.PackageInfoProvider());
  gh.factory<_i78.PersonnelMovementsCubit>(
      () => _i78.PersonnelMovementsCubit());
  gh.factory<_i79.ProfileCubit>(() => _i79.ProfileCubit());
  gh.factoryParam<_i80.ProfileFetchNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i80.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i81.ProfileThankNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i81.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i82.ReferencesPageCubit>(_i82.ReferencesPageCubit());
  gh.factoryParam<_i83.ScrollBottomLoadMoreCubit,
      _i84.ScrollBottomLoadMoreState?, dynamic>((
    initialState,
    _,
  ) =>
      _i83.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i85.SearchCubit>(_i85.SearchCubit());
  gh.factoryParam<_i86.SearchNetworkRequest, String?, dynamic>((
    query,
    _,
  ) =>
      _i86.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i87.SecureStorage>(() => _i87.SecureStorage());
  gh.factory<_i88.SecurityChecker>(() => _i88.SecurityChecker());
  gh.factory<_i89.SelectableCubit<dynamic>>(
      () => _i89.SelectableCubit<dynamic>());
  gh.factory<_i90.SelectfieldCubit>(() => _i90.SelectfieldCubit());
  gh.factoryParam<_i91.SendFeedbackFormNetworkRequest,
      _i92.ManagementFeedbackFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i91.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i93.SendManagementFormCubit>(_i93.SendManagementFormCubit());
  gh.singleton<_i94.SendMedicalInsFormCubit>(_i94.SendMedicalInsFormCubit());
  gh.factoryParam<_i95.SendMedicalInsFormNetworkRequest,
      _i96.MedicalInsuranceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i95.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i97.SendReferenceFormCubit>(_i97.SendReferenceFormCubit());
  gh.factoryParam<_i98.SendReferenceFormNetworkRequest,
      _i99.SendReferenceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i98.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i100.StaffMovementsNetworkRequest>(
      _i100.StaffMovementsNetworkRequest());
  await gh.factoryAsync<String>(
    () => logFilePathInjector.logFile,
    instanceName: 'logFile',
    registerFor: {
      _test,
      _prod,
      _dev,
    },
    preResolve: true,
  );
  gh.factory<String>(
    () => testLogFilePathInjector.logFile,
    instanceName: 'logFile',
    registerFor: {_unitTest},
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.natsToken,
    instanceName: 'natsToken',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.localDatabasePassword,
    instanceName: 'localDatabasePassword',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.deviceVirtualId,
    instanceName: 'deviceVirtualId',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.messengerAuthPassword,
    instanceName: 'messengerAuthPassword',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.messengerAuthLogin,
    instanceName: 'messengerAuthLogin',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.userId,
    instanceName: 'userId',
  );
  gh.singleton<_i101.TagsListCubit>(_i101.TagsListCubit());
  gh.singleton<_i102.TagsListNetworkRequest>(_i102.TagsListNetworkRequest());
  gh.lazySingleton<_i103.TokenDataHolder>(() => _i103.TokenDataHolder());
  gh.singleton<_i104.AuthHandler>(_i104.AuthHandler(gh<_i16.BootCubit>()));
  gh.lazySingleton<_i105.FileLogAppender>(
      () => _i105.FileLogAppender(gh<String>(instanceName: 'logFile')));
  gh.singleton<_i106.HiddenChatsCubit>(
      _i106.HiddenChatsCubit(gh<_i47.HiddenMessagesCubit>()));
  gh.factory<_i107.InitialCubit>(() => _i107.InitialCubit(
        gh<_i88.SecurityChecker>(),
        gh<_i104.AuthHandler>(),
      ));
  return getIt;
}

class _$LogFilePathInjector extends _i108.LogFilePathInjector {}

class _$TestLogFilePathInjector extends _i108.TestLogFilePathInjector {}

class _$TokenDataInjectorModule extends _i109.TokenDataInjectorModule {}
