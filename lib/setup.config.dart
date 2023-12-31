// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i65;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i88;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i89;
import 'core/cubit/selectable/selectable_cubit.dart' as _i94;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i95;
import 'core/handlers/auth_handler.dart' as _i112;
import 'core/logging/file_log_appender.dart' as _i113;
import 'core/logging/files.dart' as _i116;
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
import 'cubit/events_detail/events_detail_cubit.dart' as _i37;
import 'cubit/events_detail/sources/cancel/network.dart' as _i36;
import 'cubit/events_detail/sources/fetch/network.dart' as _i40;
import 'cubit/events_detail/sources/invite/network.dart' as _i38;
import 'cubit/events_list/events_list_cubit.dart' as _i41;
import 'cubit/events_list/sources/network.dart' as _i42;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i44;
import 'cubit/feedback_answer_list/sources/network.dart' as _i45;
import 'cubit/get_page/get_page_cubit.dart' as _i48;
import 'cubit/get_page/sources/network.dart' as _i105;
import 'cubit/get_pages/sources/network.dart' as _i54;
import 'cubit/get_section/get_section_cubit.dart' as _i49;
import 'cubit/get_section/sources%20/network.dart' as _i106;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i53;
import 'cubit/learning_materials_list/sources/network.dart' as _i51;
import 'cubit/logout/logout_cubit.dart' as _i58;
import 'cubit/logout/sources/logout_network.dart' as _i59;
import 'cubit/main_page/announcements_list_cubit.dart' as _i60;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i39;
import 'cubit/main_page/events_list_cubit.dart' as _i62;
import 'cubit/main_page/main_cubit.dart' as _i63;
import 'cubit/main_page/news_block_cubit.dart' as _i66;
import 'cubit/news_comments/news_comments_cubit.dart' as _i69;
import 'cubit/news_comments/sources/comment/network.dart' as _i67;
import 'cubit/news_comments/sources/delete_comment/network.dart' as _i70;
import 'cubit/news_comments/sources/edit_comment/network.dart' as _i71;
import 'cubit/news_comments/sources/fetch/network.dart' as _i72;
import 'cubit/news_comments/sources/like/network.dart' as _i73;
import 'cubit/news_detail/news_detail_cubit.dart' as _i74;
import 'cubit/news_detail/sources/fetch/network.dart' as _i75;
import 'cubit/news_detail/sources/like/network.dart' as _i76;
import 'cubit/news_list/news_list_cubit.dart' as _i77;
import 'cubit/news_list/sources/network.dart' as _i78;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i83;
import 'cubit/personnel_movements/sources/network.dart' as _i107;
import 'cubit/profile/profile_cubit.dart' as _i84;
import 'cubit/profile/sources/fetch/network.dart' as _i85;
import 'cubit/profile/sources/thank/network.dart' as _i86;
import 'cubit/references/references_cubit.dart' as _i87;
import 'cubit/references/sources/check_permission/network.dart' as _i19;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i47;
import 'cubit/search/search_cubit.dart' as _i90;
import 'cubit/search/sources/network.dart' as _i91;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i98;
import 'cubit/send_feedback_form/sources/network.dart' as _i96;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i99;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i100;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i102;
import 'cubit/send_reference_form/sources/network.dart' as _i103;
import 'cubit/tags_list/sources/network.dart' as _i109;
import 'cubit/tags_list/tags_list_cubit.dart' as _i108;
import 'messenger/cubits/cached/base_url/base_url_cubit.dart' as _i13;
import 'messenger/cubits/cached/chat_users_picker/chat_users_picker_cubit.dart'
    as _i21;
import 'messenger/cubits/cached/chats/cached_chats_cubit.dart' as _i17;
import 'messenger/cubits/cached/hidden_chats/hidden_chats_cubit.dart' as _i114;
import 'messenger/cubits/cached/hidden_messages/hidden_messages_cubit.dart'
    as _i50;
import 'messenger/cubits/cached/notifications_disabled_chats/notifications_disabled_chats_cubit.dart'
    as _i110;
import 'messenger/cubits/cached/users/cached_users_cubit.dart' as _i18;
import 'messenger/cubits/custom/app_state/app_state_cubit.dart' as _i9;
import 'messenger/cubits/custom/online_cubit/online_cubit.dart' as _i80;
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
import 'messenger/providers/messenger.dart' as _i64;
import 'messenger/providers/notifications.dart' as _i55;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i43;
import 'models/feedback/management_answer.dart' as _i46;
import 'models/learning_materials_data.dart' as _i52;
import 'models/new_comment_entities.dart' as _i68;
import 'models/news_data.dart' as _i79;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i104;
import 'models/token.dart' as _i111;
import 'providers/local_pin_provider.dart' as _i56;
import 'providers/lock_app.dart' as _i57;
import 'providers/main_api.dart' as _i61;
import 'providers/package_info.dart' as _i82;
import 'providers/secure_storage.dart' as _i92;
import 'providers/security_checker.dart' as _i93;
import 'screens/feedback/components/form/entities.dart' as _i97;
import 'screens/initial/cubit/initial_cubit.dart' as _i115;
import 'screens/medical_insurance/components/form/entities.dart' as _i101;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i81;

const String _test = 'test';
const String _prod = 'prod';
const String _dev = 'dev';
const String _unitTest = 'unitTest';

// initializes the registration of main-scope dependencies inside of GetIt
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
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final logFilePathInjector = _$LogFilePathInjector();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
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
  gh.factoryParam<_i36.EventCancelNetworkRequest, int?, dynamic>((
    eventId,
    _,
  ) =>
      _i36.EventCancelNetworkRequest(eventId: eventId));
  gh.factory<_i37.EventDetailCubit>(() => _i37.EventDetailCubit());
  gh.factoryParam<_i38.EventInviteNetworkRequest, int?, dynamic>((
    eventId,
    _,
  ) =>
      _i38.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i39.EventsAndAnnouncementsBlockCubit>(
      () => _i39.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i40.EventsDetailNetworkRequest, int?, dynamic>((
    eventId,
    _,
  ) =>
      _i40.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i41.EventsListCubit>(() => _i41.EventsListCubit());
  gh.factoryParam<_i42.EventsListNetworkRequest,
      _i7.Pagination<_i43.EventData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i42.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i44.FeedbackAnswerListCubit>(
      () => _i44.FeedbackAnswerListCubit());
  gh.factoryParam<_i45.FeedbackAnswerListNetworkRequest,
      _i7.Pagination<_i46.ManagementAnswer>?, dynamic>((
    pagination,
    _,
  ) =>
      _i45.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i47.GetAutofillNetworkRequest>(
      _i47.GetAutofillNetworkRequest());
  gh.factory<_i48.GetPageCubit>(() => _i48.GetPageCubit());
  gh.factory<_i49.GetSectionCubit>(() => _i49.GetSectionCubit());
  gh.singleton<_i50.HiddenMessagesCubit>(_i50.HiddenMessagesCubit());
  gh.singleton<_i27.InviteListener>(_i27.InviteListener());
  gh.factoryParam<_i51.LearningMaterialListNetworkRequest,
      _i7.Pagination<_i52.LearningMaterialsData>?, dynamic>((
    pagination,
    _,
  ) =>
      _i51.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i53.LearningMaterialsListCubit>(
      () => _i53.LearningMaterialsListCubit());
  gh.factory<_i54.ListPageNetworkRequest>(() => _i54.ListPageNetworkRequest());
  gh.singleton<_i55.LocalNotificationsProvider>(
      _i55.LocalNotificationsProvider());
  gh.lazySingleton<_i56.LocalPinProvider>(() => _i56.LocalPinProvider());
  gh.singleton<_i57.LockApp>(_i57.LockApp());
  gh.factory<_i58.LogoutCubit>(() => _i58.LogoutCubit());
  gh.factory<_i59.LogoutNetworkRequest>(() => _i59.LogoutNetworkRequest());
  gh.singleton<_i60.MainAnnouncementsListCubit>(
      _i60.MainAnnouncementsListCubit());
  gh.lazySingleton<_i61.MainApiProvider>(() => _i61.MainApiProvider());
  gh.factory<_i62.MainEventsListCubit>(() => _i62.MainEventsListCubit());
  gh.factory<_i63.MainPageCubit>(() => _i63.MainPageCubit());
  gh.singleton<_i64.MessengerProvider>(_i64.MessengerProvider());
  gh.singleton<_i65.NewBottomNavBarCubit>(_i65.NewBottomNavBarCubit());
  gh.singleton<_i66.NewsBlockCubit>(_i66.NewsBlockCubit());
  gh.factoryParam<_i67.NewsCommentsAddNetworkRequest, _i68.NewCommentEntities?,
      dynamic>((
    comment,
    _,
  ) =>
      _i67.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i69.NewsCommentsCubit>(() => _i69.NewsCommentsCubit());
  gh.factoryParam<_i70.NewsCommentsDeleteNetworkRequest, int?, dynamic>((
    commentId,
    _,
  ) =>
      _i70.NewsCommentsDeleteNetworkRequest(commentId: commentId));
  gh.factoryParam<_i71.NewsCommentsEditNetworkRequest,
      _i68.EditingCommentEntities?, dynamic>((
    comment,
    _,
  ) =>
      _i71.NewsCommentsEditNetworkRequest(comment: comment));
  gh.factoryParam<_i72.NewsCommentsFetchNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i72.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i73.NewsCommentsLikeNetworkRequest, int?, dynamic>((
    commentId,
    _,
  ) =>
      _i73.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i74.NewsDetailCubit>(() => _i74.NewsDetailCubit());
  gh.factoryParam<_i75.NewsDetailNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i75.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i76.NewsLikeNetworkRequest, int?, dynamic>((
    newsId,
    _,
  ) =>
      _i76.NewsLikeNetworkRequest(newsId: newsId));
  gh.singleton<_i77.NewsListCubit>(_i77.NewsListCubit());
  gh.factoryParam<_i78.NewsListNetworkRequest,
      _i7.Pagination<_i79.NewsItemData>?, String?>((
    pagination,
    filter,
  ) =>
      _i78.NewsListNetworkRequest(
        pagination: pagination,
        filter: filter,
      ));
  gh.singleton<_i80.OnlineCubit>(_i80.OnlineCubit());
  gh.factory<_i81.OpenUniversityCubit>(() => _i81.OpenUniversityCubit());
  gh.lazySingleton<_i82.PackageInfoProvider>(() => _i82.PackageInfoProvider());
  gh.factory<_i83.PersonnelMovementsCubit>(
      () => _i83.PersonnelMovementsCubit());
  gh.factory<_i84.ProfileCubit>(() => _i84.ProfileCubit());
  gh.factoryParam<_i85.ProfileFetchNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i85.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i86.ProfileThankNetworkRequest, int?, dynamic>((
    id,
    _,
  ) =>
      _i86.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i87.ReferencesPageCubit>(_i87.ReferencesPageCubit());
  gh.factoryParam<_i88.ScrollBottomLoadMoreCubit,
      _i89.ScrollBottomLoadMoreState?, dynamic>((
    initialState,
    _,
  ) =>
      _i88.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i90.SearchCubit>(_i90.SearchCubit());
  gh.factoryParam<_i91.SearchNetworkRequest, String?, dynamic>((
    query,
    _,
  ) =>
      _i91.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i92.SecureStorage>(() => _i92.SecureStorage());
  gh.factory<_i93.SecurityChecker>(() => const _i93.SecurityChecker());
  gh.factory<_i94.SelectableCubit<dynamic>>(
      () => _i94.SelectableCubit<dynamic>());
  gh.factory<_i95.SelectfieldCubit>(() => _i95.SelectfieldCubit());
  gh.factoryParam<_i96.SendFeedbackFormNetworkRequest,
      _i97.ManagementFeedbackFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i96.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i98.SendManagementFormCubit>(_i98.SendManagementFormCubit());
  gh.singleton<_i99.SendMedicalInsFormCubit>(_i99.SendMedicalInsFormCubit());
  gh.factoryParam<_i100.SendMedicalInsFormNetworkRequest,
      _i101.MedicalInsuranceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i100.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i102.SendReferenceFormCubit>(_i102.SendReferenceFormCubit());
  gh.factoryParam<_i103.SendReferenceFormNetworkRequest,
      _i104.SendReferenceFormEntities?, dynamic>((
    entities,
    _,
  ) =>
      _i103.SendReferenceFormNetworkRequest(entities: entities));
  gh.factoryParam<_i105.SinglePageNetworkRequest, String?, dynamic>((
    id,
    _,
  ) =>
      _i105.SinglePageNetworkRequest(id: id));
  gh.factoryParam<_i106.SingleSectionNetworkRequest, String?, dynamic>((
    code,
    _,
  ) =>
      _i106.SingleSectionNetworkRequest(code: code));
  gh.singleton<_i107.StaffMovementsNetworkRequest>(
      _i107.StaffMovementsNetworkRequest());
  gh.factory<String>(
    () => tokenDataInjectorModule.messengerAuthLogin,
    instanceName: 'messengerAuthLogin',
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.userId,
    instanceName: 'userId',
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
    () => tokenDataInjectorModule.messengerAuthPassword,
    instanceName: 'messengerAuthPassword',
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
    () => testLogFilePathInjector.logFile,
    instanceName: 'logFile',
    registerFor: {_unitTest},
  );
  gh.factory<String>(
    () => tokenDataInjectorModule.deviceVirtualId,
    instanceName: 'deviceVirtualId',
  );
  gh.singleton<_i108.TagsListCubit>(_i108.TagsListCubit());
  gh.singleton<_i109.TagsListNetworkRequest>(_i109.TagsListNetworkRequest());
  gh.singleton<_i110.ToggleNotificationsChatsCubit>(
      _i110.ToggleNotificationsChatsCubit());
  gh.lazySingleton<_i111.TokenDataHolder>(() => _i111.TokenDataHolder());
  gh.singleton<_i112.AuthHandler>(_i112.AuthHandler(gh<_i16.BootCubit>()));
  gh.lazySingleton<_i113.FileLogAppender>(
      () => _i113.FileLogAppender(gh<String>(instanceName: 'logFile')));
  gh.singleton<_i114.HiddenChatsCubit>(
      _i114.HiddenChatsCubit(gh<_i50.HiddenMessagesCubit>()));
  gh.factory<_i115.InitialCubit>(() => _i115.InitialCubit(
        gh<_i93.SecurityChecker>(),
        gh<_i112.AuthHandler>(),
      ));
  return getIt;
}

class _$LogFilePathInjector extends _i116.LogFilePathInjector {}

class _$TokenDataInjectorModule extends _i111.TokenDataInjectorModule {}

class _$TestLogFilePathInjector extends _i116.TestLogFilePathInjector {}
