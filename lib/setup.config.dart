// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i83;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i40;
import 'constants/urls.dart' as _i114;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i62;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i63;
import 'core/cubit/selectable/selectable_cubit.dart' as _i69;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i70;
import 'core/handlers/AuthHandler.dart' as _i84;
import 'core/logging/file_log_appender.dart' as _i88;
import 'core/logging/files.dart' as _i115;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i12;
import 'cubit/boot/boot_cubit.dart' as _i13;
import 'cubit/events_detail/events_detail_cubit.dart' as _i19;
import 'cubit/events_detail/sources/fetch/network.dart' as _i22;
import 'cubit/events_detail/sources/invite/network.dart' as _i20;
import 'cubit/events_list/events_list_cubit.dart' as _i23;
import 'cubit/events_list/sources/network.dart' as _i24;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i26;
import 'cubit/feedback_answer_list/sources/network.dart' as _i27;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i32;
import 'cubit/learning_materials_list/sources/network.dart' as _i30;
import 'cubit/main_page/announcements_list_cubit.dart' as _i36;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i21;
import 'cubit/main_page/events_list_cubit.dart' as _i37;
import 'cubit/main_page/main_cubit.dart' as _i38;
import 'cubit/main_page/news_block_cubit.dart' as _i41;
import 'cubit/news_comments/news_comments_cubit.dart' as _i44;
import 'cubit/news_comments/sources/comment/network.dart' as _i42;
import 'cubit/news_comments/sources/fetch/network.dart' as _i45;
import 'cubit/news_comments/sources/like/network.dart' as _i46;
import 'cubit/news_detail/news_detail_cubit.dart' as _i47;
import 'cubit/news_detail/sources/fetch/network.dart' as _i48;
import 'cubit/news_detail/sources/like/network.dart' as _i49;
import 'cubit/news_list/news_list_cubit.dart' as _i50;
import 'cubit/news_list/sources/network.dart' as _i51;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i56;
import 'cubit/personnel_movements/sources/network.dart' as _i80;
import 'cubit/profile/profile_cubit.dart' as _i57;
import 'cubit/profile/sources/fetch/network.dart' as _i58;
import 'cubit/profile/sources/thank/network.dart' as _i59;
import 'cubit/references/references_cubit.dart' as _i61;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i29;
import 'cubit/search/search_cubit.dart' as _i65;
import 'cubit/search/sources/network.dart' as _i66;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i73;
import 'cubit/send_feedback_form/sources/network.dart' as _i71;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i74;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i75;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i77;
import 'cubit/send_reference_form/sources/network.dart' as _i78;
import 'cubit/tags_list/sources/network.dart' as _i82;
import 'cubit/tags_list/tags_list_cubit.dart' as _i81;
import 'messenger/blocs/chat/chat_cubit.dart' as _i16;
import 'messenger/blocs/chat_db/chat_table_cubit.dart' as _i86;
import 'messenger/blocs/chat_list/search_chat_cubit.dart' as _i64;
import 'messenger/blocs/chat_person_list/chat_person_list_cubit.dart' as _i17;
import 'messenger/blocs/chat_person_list/sources/network.dart' as _i18;
import 'messenger/blocs/online/online_bloc.dart' as _i53;
import 'messenger/cases/channel_functions.dart' as _i94;
import 'messenger/cases/chat_creation.dart' as _i96;
import 'messenger/cases/chat_functions.dart' as _i87;
import 'messenger/cases/send_message.dart' as _i91;
import 'messenger/cases/user_functions.dart' as _i92;
import 'messenger/listeners/channels_registry.dart' as _i95;
import 'messenger/listeners/chat_info.dart' as _i108;
import 'messenger/listeners/chat_list.dart' as _i104;
import 'messenger/listeners/delete_message.dart' as _i110;
import 'messenger/listeners/invitation.dart' as _i101;
import 'messenger/listeners/joined.dart' as _i103;
import 'messenger/listeners/left.dart' as _i105;
import 'messenger/listeners/message_listener.dart' as _i100;
import 'messenger/listeners/message_status.dart' as _i106;
import 'messenger/listeners/online.dart' as _i109;
import 'messenger/listeners/text_message.dart' as _i107;
import 'messenger/listeners/texting.dart' as _i102;
import 'messenger/models/chat/database/chat_db.dart' as _i85;
import 'messenger/providers/messenger.dart' as _i39;
import 'messenger/providers/nats_provider.dart' as _i90;
import 'messenger/providers/notifications/notifications.dart' as _i33;
import 'messenger/providers/notifications/push_notification_manager.dart'
    as _i60;
import 'messenger/sender/chat_events.dart' as _i113;
import 'messenger/sender/chat_saver.dart' as _i97;
import 'messenger/sender/invite_sender.dart' as _i98;
import 'messenger/sender/message_editor_sender.dart' as _i99;
import 'messenger/sender/online_sender.dart' as _i111;
import 'messenger/sender/text_sender.dart' as _i112;
import 'messenger/sender/user_reaction_sender.dart' as _i93;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i25;
import 'models/feedback/management_answer.dart' as _i28;
import 'models/learning_materials_data.dart' as _i31;
import 'models/new_comment_entities.dart' as _i43;
import 'models/news_data.dart' as _i52;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i79;
import 'models/token.dart' as _i67;
import 'providers/certificate_reader.dart' as _i15;
import 'providers/lock_app.dart' as _i34;
import 'providers/main_api.dart' as _i35;
import 'providers/package_info.dart' as _i55;
import 'providers/security_checker.dart' as _i68;
import 'screens/feedback/components/form/entities.dart' as _i72;
import 'screens/initial/cubit/initial_cubit.dart' as _i89;
import 'screens/medical_insurance/components/form/entities.dart' as _i76;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i54;

const String _test = 'test';
const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final urlsConfigTest = _$UrlsConfigTest();
  final urlsConfigProd = _$UrlsConfigProd();
  final urlsConfigDev = _$UrlsConfigDev();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final logFilePathInjector = _$LogFilePathInjector();
  final certificateInjector = _$CertificateInjector();
  gh.factory<_i3.AnnouncementCubit>(() => _i3.AnnouncementCubit());
  gh.factoryParam<_i4.AnnouncementsDetailNetworkRequest, int?, dynamic>(
      (announcementId, _) => _i4.AnnouncementsDetailNetworkRequest(
          announcementId: announcementId));
  gh.factory<_i5.AnnouncementsListCubit>(() => _i5.AnnouncementsListCubit());
  gh.factoryParam<_i6.AnnouncementsListNetworkRequest,
          _i7.Pagination<_i8.AnnouncementData>?, dynamic>(
      (pagination, _) =>
          _i6.AnnouncementsListNetworkRequest(pagination: pagination));
  gh.factory<_i9.AuthCubit>(() => _i9.AuthCubit());
  gh.factoryParam<_i10.AuthNetworkRequest, String?, String?>(
      (login, password) =>
          _i10.AuthNetworkRequest(login: login, password: password));
  gh.factory<_i11.BirthdaysCubit>(() => _i11.BirthdaysCubit());
  gh.singleton<_i12.BirthdaysNetworkRequest>(_i12.BirthdaysNetworkRequest());
  gh.singleton<_i13.BootCubit>(_i13.BootCubit());
  gh.singleton<_i14.CanInquireNetworkRequest>(_i14.CanInquireNetworkRequest());
  gh.lazySingleton<_i15.CertificateReader>(() => _i15.CertificateReader());
  gh.singleton<_i16.ChatCubit>(_i16.ChatCubit());
  gh.singleton<_i17.ChatPersonListCubit>(_i17.ChatPersonListCubit());
  gh.factoryParam<_i18.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i18.ContactsNetworkRequest(query: query));
  gh.factory<_i19.EventDetailCubit>(() => _i19.EventDetailCubit());
  gh.factoryParam<_i20.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i20.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i21.EventsAndAnnouncementsBlockCubit>(
      () => _i21.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i22.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i22.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i23.EventsListCubit>(() => _i23.EventsListCubit());
  gh.factoryParam<_i24.EventsListNetworkRequest,
          _i7.Pagination<_i25.EventData>?, dynamic>(
      (pagination, _) => _i24.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i26.FeedbackAnswerListCubit>(
      () => _i26.FeedbackAnswerListCubit());
  gh.factoryParam<_i27.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i28.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i27.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i29.GetAutofillNetworkRequest>(
      _i29.GetAutofillNetworkRequest());
  gh.factoryParam<_i30.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i31.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i30.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i32.LearningMaterialsListCubit>(
      () => _i32.LearningMaterialsListCubit());
  gh.lazySingleton<_i33.LocalNotificationsProvider>(
      () => _i33.LocalNotificationsProvider());
  gh.singleton<_i34.LockApp>(_i34.LockApp());
  gh.lazySingleton<_i35.LogInterceptor>(() => _i35.LogInterceptor());
  gh.factory<_i36.MainAnnouncementsListCubit>(
      () => _i36.MainAnnouncementsListCubit());
  gh.factory<_i37.MainEventsListCubit>(() => _i37.MainEventsListCubit());
  gh.factory<_i38.MainPageCubit>(() => _i38.MainPageCubit());
  gh.lazySingleton<_i39.Messenger>(() => _i39.Messenger());
  gh.singleton<_i40.NewBottomNavBarCubit>(_i40.NewBottomNavBarCubit());
  gh.singleton<_i41.NewsBlockCubit>(_i41.NewsBlockCubit());
  gh.factoryParam<_i42.NewsCommentsAddNetworkRequest, _i43.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i42.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i44.NewsCommentsCubit>(() => _i44.NewsCommentsCubit());
  gh.factoryParam<_i45.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i45.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i46.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i46.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i47.NewsDetailCubit>(() => _i47.NewsDetailCubit());
  gh.factoryParam<_i48.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i48.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i49.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i49.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i50.NewsListCubit>(() => _i50.NewsListCubit());
  gh.factoryParam<_i51.NewsListNetworkRequest,
          _i7.Pagination<_i52.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i51.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.lazySingleton<_i53.OnlineBloc>(() => _i53.OnlineBloc());
  gh.factory<_i54.OpenUniversityCubit>(() => _i54.OpenUniversityCubit());
  gh.lazySingleton<_i55.PackageInfoProvider>(() => _i55.PackageInfoProvider());
  gh.factory<_i56.PersonnelMovementsCubit>(
      () => _i56.PersonnelMovementsCubit());
  gh.factory<_i57.ProfileCubit>(() => _i57.ProfileCubit());
  gh.factoryParam<_i58.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i58.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i59.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i59.ProfileThankNetworkRequest(id: id));
  gh.lazySingleton<_i60.PushNotificationManager>(() =>
      _i60.PushNotificationManager(get<_i33.LocalNotificationsProvider>()));
  gh.singleton<_i61.ReferencesPageCubit>(_i61.ReferencesPageCubit());
  gh.factoryParam<_i62.ScrollBottomLoadMoreCubit,
          _i63.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i62.ScrollBottomLoadMoreCubit(initialState));
  gh.factory<_i64.SearchChatCubit>(() => _i64.SearchChatCubit());
  gh.singleton<_i65.SearchCubit>(_i65.SearchCubit());
  gh.factoryParam<_i66.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i66.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i67.SecureStorage>(() => _i67.SecureStorage());
  gh.factory<_i68.SecurityChecker>(() => _i68.SecurityChecker());
  gh.factory<_i69.SelectableCubit<dynamic>>(
      () => _i69.SelectableCubit<dynamic>());
  gh.factory<_i70.SelectfieldCubit>(() => _i70.SelectfieldCubit());
  gh.factoryParam<_i71.SendFeedbackFormNetworkRequest,
          _i72.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i71.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i73.SendManagementFormCubit>(_i73.SendManagementFormCubit());
  gh.singleton<_i74.SendMedicalInsFormCubit>(_i74.SendMedicalInsFormCubit());
  gh.factoryParam<_i75.SendMedicalInsFormNetworkRequest,
          _i76.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i75.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i77.SendReferenceFormCubit>(_i77.SendReferenceFormCubit());
  gh.factoryParam<_i78.SendReferenceFormNetworkRequest,
          _i79.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i78.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i80.StaffMovementsNetworkRequest>(
      _i80.StaffMovementsNetworkRequest());
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => tokenDataInjectorModule.localDatabasePassword,
      instanceName: 'localDatabasePassword');
  gh.factory<String>(() => urlsConfigTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigProd.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.apiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigDev.apiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigDev.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => testLogFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_test});
  gh.factory<String>(() => urlsConfigDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  await gh.factoryAsync<String>(() => logFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_prod, _dev}, preResolve: true);
  gh.factory<String>(() => urlsConfigTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_test});
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => urlsConfigTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigDev.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_dev});
  gh.singleton<_i81.TagsListCubit>(_i81.TagsListCubit());
  gh.singleton<_i82.TagsListNetworkRequest>(_i82.TagsListNetworkRequest());
  gh.lazySingleton<_i67.TokenDataHolder>(() => _i67.TokenDataHolder());
  gh.factory<_i83.Uint8List>(() => certificateInjector.apiCertificate,
      instanceName: 'apiCertificate');
  gh.factory<_i83.Uint8List>(() => certificateInjector.natsCertificate,
      instanceName: 'natsCertificate');
  gh.singleton<_i84.AuthHandler>(_i84.AuthHandler(get<_i13.BootCubit>()));
  gh.lazySingleton<_i85.ChatDatabase>(() => _i85.ChatDatabase(
      get<String>(instanceName: 'localDatabasePassword'),
      get<String>(instanceName: 'userId')));
  gh.lazySingleton<_i86.ChatDatabaseCubit>(
      () => _i86.ChatDatabaseCubit(get<_i85.ChatDatabase>()));
  gh.factory<_i87.ChatFunctions>(() =>
      _i87.ChatFunctions(get<_i86.ChatDatabaseCubit>(), get<_i39.Messenger>()));
  gh.lazySingleton<_i88.FileLogAppender>(
      () => _i88.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.factory<_i89.InitialCubit>(() => _i89.InitialCubit(
      get<_i68.SecurityChecker>(),
      get<_i15.CertificateReader>(),
      get<_i84.AuthHandler>()));
  gh.lazySingleton<_i35.MainApiProvider>(() => _i35.MainApiProvider(
      get<_i35.LogInterceptor>(),
      get<String>(instanceName: 'apiUrl'),
      get<_i83.Uint8List>(instanceName: 'apiCertificate')));
  gh.lazySingleton<_i90.NatsProvider>(() => _i90.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i83.Uint8List>(instanceName: 'natsCertificate')));
  gh.factory<_i91.SendMessage>(() => _i91.SendMessage(
      chatFunctions: get<_i87.ChatFunctions>(),
      chatDatabaseCubit: get<_i86.ChatDatabaseCubit>()));
  gh.factory<_i92.UserFunctions>(
      () => _i92.UserFunctions(get<_i86.ChatDatabaseCubit>()));
  gh.factory<_i93.UserReactionSender>(() => _i93.UserReactionSender(
      get<_i90.NatsProvider>(), get<_i87.ChatFunctions>()));
  gh.factory<_i94.ChannelFunctions>(
      () => _i94.ChannelFunctions(get<_i86.ChatDatabaseCubit>()));
  gh.lazySingleton<_i95.ChannelsRegistry>(() => _i95.ChannelsRegistry(
      natsProvider: get<_i90.NatsProvider>(),
      channelFunctions: get<_i94.ChannelFunctions>(),
      userFunctions: get<_i92.UserFunctions>(),
      chatDatabaseCubit: get<_i86.ChatDatabaseCubit>(),
      pushNotificationManager: get<_i60.PushNotificationManager>()));
  gh.factory<_i96.ChatCreation>(() => _i96.ChatCreation(
      get<_i86.ChatDatabaseCubit>(),
      get<_i92.UserFunctions>(),
      get<_i39.Messenger>()));
  gh.factory<_i97.ChatSaver>(
      () => _i97.ChatSaver(get<_i85.ChatDatabase>(), get<_i90.NatsProvider>()));
  gh.factory<_i98.InviteSender>(() => _i98.InviteSender(
      get<_i90.NatsProvider>(),
      get<_i92.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i97.ChatSaver>(),
      get<_i85.ChatDatabase>(),
      get<_i95.ChannelsRegistry>()));
  gh.factory<_i99.MessageEditorSender>(() => _i99.MessageEditorSender(
      get<_i90.NatsProvider>(),
      get<_i92.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i85.ChatDatabase>()));
  gh.factory<_i100.MessageListener>(
      () => _i101.ChatInvitationListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i97.ChatSaver>(),
          get<_i98.InviteSender>(),
          get<_i86.ChatDatabaseCubit>()),
      instanceName: 'InviteUserToJoinChat');
  gh.factory<_i100.MessageListener>(
      () => _i102.MessageTextingListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i16.ChatCubit>()),
      instanceName: 'Texting');
  gh.factory<_i100.MessageListener>(
      () => _i103.ChatJoinedListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i92.UserFunctions>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i98.InviteSender>(),
          get<_i97.ChatSaver>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'UserJoined');
  gh.factory<_i100.MessageListener>(
      () => _i104.ChatListListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i92.UserFunctions>(),
          get<_i94.ChannelFunctions>(),
          get<_i97.ChatSaver>(),
          get<_i96.ChatCreation>()),
      instanceName: 'ChatList');
  gh.factory<_i100.MessageListener>(
      () => _i105.ChatLeftListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i98.InviteSender>(),
          get<_i97.ChatSaver>(),
          get<_i92.UserFunctions>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'UserLeftChat');
  gh.factory<_i100.MessageListener>(
      () => _i106.MessageStatusListener(get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(), get<_i87.ChatFunctions>()),
      instanceName: 'UserReacted');
  gh.factory<_i100.MessageListener>(
      () => _i107.TextMessageListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i92.UserFunctions>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i98.InviteSender>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'Text');
  gh.factory<_i100.MessageListener>(
      () => _i108.ChatInfoListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i92.UserFunctions>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i98.InviteSender>()),
      instanceName: 'UpdateChatInfo');
  gh.factory<_i100.MessageListener>(
      () => _i109.UserOnlineListener(
          get<_i90.NatsProvider>(),
          get<_i95.ChannelsRegistry>(),
          get<_i39.Messenger>(),
          get<_i92.UserFunctions>(),
          get<_i86.ChatDatabaseCubit>()),
      instanceName: 'Online');
  gh.factory<_i100.MessageListener>(
      () => _i110.MessageDeletedListener(
          get<_i90.NatsProvider>(),
          get<_i86.ChatDatabaseCubit>(),
          get<_i95.ChannelsRegistry>(),
          get<_i87.ChatFunctions>(),
          get<_i98.InviteSender>(),
          get<_i85.ChatDatabase>(),
          get<_i97.ChatSaver>()),
      instanceName: 'RemoveMessage');
  gh.lazySingleton<_i111.OnlineSender>(() =>
      _i111.OnlineSender(get<_i90.NatsProvider>(), get<_i92.UserFunctions>()));
  gh.factory<_i112.TextSender>(() => _i112.TextSender(
      get<_i90.NatsProvider>(),
      get<_i92.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i85.ChatDatabase>(),
      get<_i95.ChannelsRegistry>()));
  gh.factory<_i113.ChatEventsSender>(() => _i113.ChatEventsSender(
      get<_i90.NatsProvider>(),
      get<_i92.UserFunctions>(),
      get<_i97.ChatSaver>(),
      get<_i95.ChannelsRegistry>()));
  return get;
}

class _$TokenDataInjectorModule extends _i67.TokenDataInjectorModule {}

class _$UrlsConfigTest extends _i114.UrlsConfigTest {}

class _$UrlsConfigProd extends _i114.UrlsConfigProd {}

class _$UrlsConfigDev extends _i114.UrlsConfigDev {}

class _$TestLogFilePathInjector extends _i115.TestLogFilePathInjector {}

class _$LogFilePathInjector extends _i115.LogFilePathInjector {}

class _$CertificateInjector extends _i15.CertificateInjector {}
