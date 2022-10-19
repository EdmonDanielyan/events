// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i60;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i82;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i83;
import 'core/cubit/selectable/selectable_cubit.dart' as _i88;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i89;
import 'core/handlers/AuthHandler.dart' as _i103;
import 'core/logging/file_log_appender.dart' as _i104;
import 'core/logging/files.dart' as _i106;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i11;
import 'cubit/auth/sources/network.dart' as _i12;
import 'cubit/birthdays/birthdays_cubit.dart' as _i14;
import 'cubit/birthdays/sources/network.dart' as _i15;
import 'cubit/boot/boot_cubit.dart' as _i16;
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i20;
import 'cubit/chat_person_list/sources/network.dart' as _i23;
import 'cubit/events_detail/events_detail_cubit.dart' as _i36;
import 'cubit/events_detail/sources/fetch/network.dart' as _i39;
import 'cubit/events_detail/sources/invite/network.dart' as _i37;
import 'cubit/events_list/events_list_cubit.dart' as _i40;
import 'cubit/events_list/sources/network.dart' as _i41;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i43;
import 'cubit/feedback_answer_list/sources/network.dart' as _i44;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i51;
import 'cubit/learning_materials_list/sources/network.dart' as _i49;
import 'cubit/main_page/announcements_list_cubit.dart' as _i55;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i38;
import 'cubit/main_page/events_list_cubit.dart' as _i57;
import 'cubit/main_page/main_cubit.dart' as _i58;
import 'cubit/main_page/news_block_cubit.dart' as _i61;
import 'cubit/news_comments/news_comments_cubit.dart' as _i64;
import 'cubit/news_comments/sources/comment/network.dart' as _i62;
import 'cubit/news_comments/sources/fetch/network.dart' as _i65;
import 'cubit/news_comments/sources/like/network.dart' as _i66;
import 'cubit/news_detail/news_detail_cubit.dart' as _i67;
import 'cubit/news_detail/sources/fetch/network.dart' as _i68;
import 'cubit/news_detail/sources/like/network.dart' as _i69;
import 'cubit/news_list/news_list_cubit.dart' as _i70;
import 'cubit/news_list/sources/network.dart' as _i71;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i77;
import 'cubit/personnel_movements/sources/network.dart' as _i99;
import 'cubit/profile/profile_cubit.dart' as _i78;
import 'cubit/profile/sources/fetch/network.dart' as _i79;
import 'cubit/profile/sources/thank/network.dart' as _i80;
import 'cubit/references/references_cubit.dart' as _i81;
import 'cubit/references/sources/check_permission/network.dart' as _i19;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i46;
import 'cubit/search/search_cubit.dart' as _i84;
import 'cubit/search/sources/network.dart' as _i85;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i92;
import 'cubit/send_feedback_form/sources/network.dart' as _i90;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i93;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i94;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i96;
import 'cubit/send_reference_form/sources/network.dart' as _i97;
import 'cubit/tags_list/sources/network.dart' as _i101;
import 'cubit/tags_list/tags_list_cubit.dart' as _i100;
import 'messenger/cubits/cached/base_url/base_url_cubit.dart' as _i13;
import 'messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart'
    as _i21;
import 'messenger/cubits/cached/chats/cached_chats_cubit.dart' as _i17;
import 'messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart' as _i47;
import 'messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart'
    as _i48;
import 'messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart'
    as _i73;
import 'messenger/cubits/cached/users/cached_users_cubit.dart' as _i18;
import 'messenger/cubits/custom/app_state/app_state_cubit.dart' as _i9;
import 'messenger/cubits/custom/online_cubit/online_cubit.dart' as _i74;
import 'messenger/messenger/listeners/add_participant.dart' as _i24;
import 'messenger/messenger/listeners/connect.dart' as _i22;
import 'messenger/messenger/listeners/delete_message.dart' as _i25;
import 'messenger/messenger/listeners/direct_message.dart' as _i26;
import 'messenger/messenger/listeners/disconnect.dart' as _i34;
import 'messenger/messenger/listeners/error.dart' as _i35;
import 'messenger/messenger/listeners/invite.dart' as _i27;
import 'messenger/messenger/listeners/message.dart' as _i28;
import 'messenger/messenger/listeners/online_listener.dart' as _i29;
import 'messenger/messenger/listeners/read_message_listener.dart' as _i30;
import 'messenger/messenger/listeners/remove_participant.dart' as _i31;
import 'messenger/messenger/listeners/update_chat_listener.dart' as _i32;
import 'messenger/messenger/listeners/update_message.dart' as _i33;
import 'messenger/providers/app_token.dart' as _i10;
import 'messenger/providers/messenger.dart' as _i59;
import 'messenger/providers/notifications.dart' as _i52;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i42;
import 'models/feedback/management_answer.dart' as _i45;
import 'models/learning_materials_data.dart' as _i50;
import 'models/new_comment_entities.dart' as _i63;
import 'models/news_data.dart' as _i72;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i98;
import 'models/token.dart' as _i102;
import 'providers/local_pin_provider.dart' as _i53;
import 'providers/lock_app.dart' as _i54;
import 'providers/main_api.dart' as _i56;
import 'providers/package_info.dart' as _i76;
import 'providers/secure_storage.dart' as _i86;
import 'providers/security_checker.dart' as _i87;
import 'screens/feedback/components/form/entities.dart' as _i91;
import 'screens/initial/cubit/initial_cubit.dart' as _i105;
import 'screens/medical_insurance/components/form/entities.dart' as _i95;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i75;

const String _unitTest = 'unitTest';
const String _test = 'test';
const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final logFilePathInjector = _$LogFilePathInjector();
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
  gh.factory<_i14.BirthdaysCubit>(() => _i14.BirthdaysCubit());
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
  gh.singleton<_i47.HiddenChatsCubit>(_i47.HiddenChatsCubit());
  gh.singleton<_i48.HiddenMessagesCubit>(_i48.HiddenMessagesCubit());
  gh.singleton<_i27.InviteListener>(_i27.InviteListener());
  gh.factoryParam<_i49.LearningMaterialListNetworkRequest,
      _i7.Pagination<_i50.LearningMaterialsData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i49.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i51.LearningMaterialsListCubit>(
      () => _i51.LearningMaterialsListCubit());
  gh.singleton<_i52.LocalNotificationsProvider>(
      _i52.LocalNotificationsProvider());
  gh.lazySingleton<_i53.LocalPinProvider>(() => _i53.LocalPinProvider());
  gh.singleton<_i54.LockApp>(_i54.LockApp());
  gh.singleton<_i55.MainAnnouncementsListCubit>(
      _i55.MainAnnouncementsListCubit());
  gh.lazySingleton<_i56.MainApiProvider>(() => _i56.MainApiProvider());
  gh.factory<_i57.MainEventsListCubit>(() => _i57.MainEventsListCubit());
  gh.factory<_i58.MainPageCubit>(() => _i58.MainPageCubit());
  gh.singleton<_i59.MessengerProvider>(_i59.MessengerProvider());
  gh.singleton<_i60.NewBottomNavBarCubit>(_i60.NewBottomNavBarCubit());
  gh.singleton<_i61.NewsBlockCubit>(_i61.NewsBlockCubit());
  gh.factoryParam<_i62.NewsCommentsAddNetworkRequest, _i63.NewCommentEntities?,
      dynamic>((
    comment,
    _,
  ) =>
      _i62.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i64.NewsCommentsCubit>(() => _i64.NewsCommentsCubit());
  gh.factoryParam<_i65.NewsCommentsFetchNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i65.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i66.NewsCommentsLikeNetworkRequest, int?, dynamic>((
    commentId,
    _,
  ) =>
      _i66.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i67.NewsDetailCubit>(() => _i67.NewsDetailCubit());
  gh.factoryParam<_i68.NewsDetailNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i68.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i69.NewsLikeNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i69.NewsLikeNetworkRequest(newsId: newsId));
  gh.singleton<_i70.NewsListCubit>(_i70.NewsListCubit());
  gh.factoryParam<_i71.NewsListNetworkRequest,
      _i7.Pagination<_i72.NewsItemData>?, String?>((
    pagination,
    filter,
  ) =>
      _i71.NewsListNetworkRequest(
        pagination: pagination,
        filter: filter,
      ));
  gh.singleton<_i73.NotificationsDisabledChatsCubit>(
      _i73.NotificationsDisabledChatsCubit());
  gh.singleton<_i74.OnlineCubit>(_i74.OnlineCubit());
  gh.factory<_i75.OpenUniversityCubit>(() => _i75.OpenUniversityCubit());
  gh.lazySingleton<_i76.PackageInfoProvider>(() => _i76.PackageInfoProvider());
  gh.factory<_i77.PersonnelMovementsCubit>(
      () => _i77.PersonnelMovementsCubit());
  gh.factory<_i78.ProfileCubit>(() => _i78.ProfileCubit());
  gh.factoryParam<_i79.ProfileFetchNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i79.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i80.ProfileThankNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i80.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i81.ReferencesPageCubit>(_i81.ReferencesPageCubit());
  gh.factoryParam<_i82.ScrollBottomLoadMoreCubit,
      _i83.ScrollBottomLoadMoreState?, dynamic>((
    initialState,
    _,
  ) =>
      _i82.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i84.SearchCubit>(_i84.SearchCubit());
  gh.factoryParam<_i85.SearchNetworkRequest, String?, dynamic>((
    query,
    _,
  ) =>
      _i85.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i86.SecureStorage>(() => _i86.SecureStorage());
  gh.factory<_i87.SecurityChecker>(() => _i87.SecurityChecker());
  gh.factory<_i88.SelectableCubit<dynamic>>(
      () => _i88.SelectableCubit<dynamic>());
  gh.factory<_i89.SelectfieldCubit>(() => _i89.SelectfieldCubit());
  gh.factoryParam<_i90.SendFeedbackFormNetworkRequest,
      _i91.ManagementFeedbackFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i90.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i92.SendManagementFormCubit>(_i92.SendManagementFormCubit());
  gh.singleton<_i93.SendMedicalInsFormCubit>(_i93.SendMedicalInsFormCubit());
  gh.factoryParam<_i94.SendMedicalInsFormNetworkRequest,
      _i95.MedicalInsuranceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i94.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i96.SendReferenceFormCubit>(_i96.SendReferenceFormCubit());
  gh.factoryParam<_i97.SendReferenceFormNetworkRequest,
      _i98.SendReferenceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i97.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i99.StaffMovementsNetworkRequest>(
      _i99.StaffMovementsNetworkRequest());
  gh.factory<String>(
    () => tokenDataInjectorModule.localDatabasePassword,
    instanceName: 'localDatabasePassword',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.natsToken,
    instanceName: 'natsToken',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.deviceVirtualId,
    instanceName: 'deviceVirtualId',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.messengerAuthLogin,
    instanceName: 'messengerAuthLogin',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.userId,
    instanceName: 'userId',
  );
  gh.factory<String>(
    () => testLogFilePathInjector.logFile,
    instanceName: 'logFile',
    registerFor: {_unitTest},
  );
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
    () => tokenDataInjectorModule.messengerAuthPassword,
    instanceName: 'messengerAuthPassword',
  );
  gh.singleton<_i100.TagsListCubit>(_i100.TagsListCubit());
  gh.singleton<_i101.TagsListNetworkRequest>(_i101.TagsListNetworkRequest());
  gh.lazySingleton<_i102.TokenDataHolder>(() => _i102.TokenDataHolder());
  gh.singleton<_i103.AuthHandler>(_i103.AuthHandler(get<_i16.BootCubit>()));
  gh.lazySingleton<_i104.FileLogAppender>(
      () => _i104.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.factory<_i105.InitialCubit>(() => _i105.InitialCubit(
        get<_i87.SecurityChecker>(),
        get<_i103.AuthHandler>(),
      ));
  return get;
}

class _$TokenDataInjectorModule extends _i102.TokenDataInjectorModule {}

class _$TestLogFilePathInjector extends _i106.TestLogFilePathInjector {}

class _$LogFilePathInjector extends _i106.LogFilePathInjector {}
