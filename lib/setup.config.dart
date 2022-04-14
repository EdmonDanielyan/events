// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i85;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i41;
import 'constants/urls.dart' as _i116;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i63;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i64;
import 'core/cubit/selectable/selectable_cubit.dart' as _i70;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i71;
import 'core/handlers/AuthHandler.dart' as _i86;
import 'core/logging/file_log_appender.dart' as _i90;
import 'core/logging/files.dart' as _i117;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i12;
import 'cubit/boot/boot_cubit.dart' as _i13;
import 'cubit/events_detail/events_detail_cubit.dart' as _i20;
import 'cubit/events_detail/sources/fetch/network.dart' as _i23;
import 'cubit/events_detail/sources/invite/network.dart' as _i21;
import 'cubit/events_list/events_list_cubit.dart' as _i24;
import 'cubit/events_list/sources/network.dart' as _i25;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i27;
import 'cubit/feedback_answer_list/sources/network.dart' as _i28;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i33;
import 'cubit/learning_materials_list/sources/network.dart' as _i31;
import 'cubit/main_page/announcements_list_cubit.dart' as _i37;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i22;
import 'cubit/main_page/events_list_cubit.dart' as _i38;
import 'cubit/main_page/main_cubit.dart' as _i39;
import 'cubit/main_page/news_block_cubit.dart' as _i42;
import 'cubit/news_comments/news_comments_cubit.dart' as _i45;
import 'cubit/news_comments/sources/comment/network.dart' as _i43;
import 'cubit/news_comments/sources/fetch/network.dart' as _i46;
import 'cubit/news_comments/sources/like/network.dart' as _i47;
import 'cubit/news_detail/news_detail_cubit.dart' as _i48;
import 'cubit/news_detail/sources/fetch/network.dart' as _i49;
import 'cubit/news_detail/sources/like/network.dart' as _i50;
import 'cubit/news_list/news_list_cubit.dart' as _i51;
import 'cubit/news_list/sources/network.dart' as _i52;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i57;
import 'cubit/personnel_movements/sources/network.dart' as _i81;
import 'cubit/profile/profile_cubit.dart' as _i58;
import 'cubit/profile/sources/fetch/network.dart' as _i59;
import 'cubit/profile/sources/thank/network.dart' as _i60;
import 'cubit/references/references_cubit.dart' as _i62;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i30;
import 'cubit/search/search_cubit.dart' as _i66;
import 'cubit/search/sources/network.dart' as _i67;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i74;
import 'cubit/send_feedback_form/sources/network.dart' as _i72;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i75;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i76;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i78;
import 'cubit/send_reference_form/sources/network.dart' as _i79;
import 'cubit/tags_list/sources/network.dart' as _i83;
import 'cubit/tags_list/tags_list_cubit.dart' as _i82;
import 'messenger/blocs/chat/chat_cubit.dart' as _i16;
import 'messenger/blocs/chat_db/chat_table_cubit.dart' as _i88;
import 'messenger/blocs/chat_list/search_chat_cubit.dart' as _i65;
import 'messenger/blocs/chat_person_list/chat_person_list_cubit.dart' as _i18;
import 'messenger/blocs/chat_person_list/sources/network.dart' as _i19;
import 'messenger/blocs/online/online_bloc.dart' as _i54;
import 'messenger/cases/channel_functions.dart' as _i96;
import 'messenger/cases/chat_creation.dart' as _i98;
import 'messenger/cases/chat_functions.dart' as _i89;
import 'messenger/cases/send_message.dart' as _i93;
import 'messenger/cases/user_functions.dart' as _i94;
import 'messenger/listeners/channels_registry.dart' as _i97;
import 'messenger/listeners/chat_info.dart' as _i105;
import 'messenger/listeners/chat_list.dart' as _i106;
import 'messenger/listeners/delete_message.dart' as _i107;
import 'messenger/listeners/invitation.dart' as _i110;
import 'messenger/listeners/joined.dart' as _i111;
import 'messenger/listeners/left.dart' as _i108;
import 'messenger/listeners/message_listener.dart' as _i102;
import 'messenger/listeners/message_status.dart' as _i112;
import 'messenger/listeners/online.dart' as _i103;
import 'messenger/listeners/text_message.dart' as _i104;
import 'messenger/listeners/texting.dart' as _i109;
import 'messenger/models/chat/database/chat_db.dart' as _i87;
import 'messenger/providers/chat_import/chat_import_storage.dart' as _i17;
import 'messenger/providers/messenger.dart' as _i40;
import 'messenger/providers/nats_provider.dart' as _i92;
import 'messenger/providers/notifications/notifications.dart' as _i34;
import 'messenger/providers/notifications/push_notification_manager.dart'
    as _i61;
import 'messenger/sender/chat_events.dart' as _i115;
import 'messenger/sender/chat_saver.dart' as _i99;
import 'messenger/sender/invite_sender.dart' as _i100;
import 'messenger/sender/message_editor_sender.dart' as _i101;
import 'messenger/sender/online_sender.dart' as _i113;
import 'messenger/sender/text_sender.dart' as _i114;
import 'messenger/sender/user_reaction_sender.dart' as _i95;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i26;
import 'models/feedback/management_answer.dart' as _i29;
import 'models/learning_materials_data.dart' as _i32;
import 'models/new_comment_entities.dart' as _i44;
import 'models/news_data.dart' as _i53;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i80;
import 'models/token.dart' as _i84;
import 'providers/certificate_reader.dart' as _i15;
import 'providers/lock_app.dart' as _i35;
import 'providers/main_api.dart' as _i36;
import 'providers/package_info.dart' as _i56;
import 'providers/secure_storage.dart' as _i68;
import 'providers/security_checker.dart' as _i69;
import 'screens/feedback/components/form/entities.dart' as _i73;
import 'screens/initial/cubit/initial_cubit.dart' as _i91;
import 'screens/medical_insurance/components/form/entities.dart' as _i77;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i55;

const String _dev = 'dev';
const String _unitTest = 'unitTest';
const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final urlsConfigDev = _$UrlsConfigDev();
  final urlsConfigUnitTest = _$UrlsConfigUnitTest();
  final urlsConfigProd = _$UrlsConfigProd();
  final logFilePathInjector = _$LogFilePathInjector();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final urlsConfigTest = _$UrlsConfigTest();
  final certificateInjector = _$CertificateInjector();
  gh.factory<_i3.AnnouncementCubit>(() => _i3.AnnouncementCubit());
  gh.factoryParam<_i4.AnnouncementsDetailNetworkRequest, int?, dynamic>(
      (announcementId, _) => _i4.AnnouncementsDetailNetworkRequest(
          announcementId: announcementId));
  gh.singleton<_i5.AnnouncementsListCubit>(_i5.AnnouncementsListCubit());
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
  gh.singleton<_i17.ChatImportStorage>(_i17.ChatImportStorage());
  gh.singleton<_i18.ChatPersonListCubit>(_i18.ChatPersonListCubit());
  gh.factoryParam<_i19.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i19.ContactsNetworkRequest(query: query));
  gh.factory<_i20.EventDetailCubit>(() => _i20.EventDetailCubit());
  gh.factoryParam<_i21.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i21.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i22.EventsAndAnnouncementsBlockCubit>(
      () => _i22.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i23.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i23.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i24.EventsListCubit>(() => _i24.EventsListCubit());
  gh.factoryParam<_i25.EventsListNetworkRequest,
          _i7.Pagination<_i26.EventData>?, dynamic>(
      (pagination, _) => _i25.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i27.FeedbackAnswerListCubit>(
      () => _i27.FeedbackAnswerListCubit());
  gh.factoryParam<_i28.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i29.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i28.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i30.GetAutofillNetworkRequest>(
      _i30.GetAutofillNetworkRequest());
  gh.factoryParam<_i31.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i32.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i31.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i33.LearningMaterialsListCubit>(
      () => _i33.LearningMaterialsListCubit());
  gh.lazySingleton<_i34.LocalNotificationsProvider>(
      () => _i34.LocalNotificationsProvider());
  gh.singleton<_i35.LockApp>(_i35.LockApp());
  gh.lazySingleton<_i36.LogInterceptor>(() => _i36.LogInterceptor());
  gh.singleton<_i37.MainAnnouncementsListCubit>(
      _i37.MainAnnouncementsListCubit());
  gh.factory<_i38.MainEventsListCubit>(() => _i38.MainEventsListCubit());
  gh.factory<_i39.MainPageCubit>(() => _i39.MainPageCubit());
  gh.lazySingleton<_i40.Messenger>(() => _i40.Messenger());
  gh.singleton<_i41.NewBottomNavBarCubit>(_i41.NewBottomNavBarCubit());
  gh.singleton<_i42.NewsBlockCubit>(_i42.NewsBlockCubit());
  gh.factoryParam<_i43.NewsCommentsAddNetworkRequest, _i44.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i43.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i45.NewsCommentsCubit>(() => _i45.NewsCommentsCubit());
  gh.factoryParam<_i46.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i46.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i47.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i47.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i48.NewsDetailCubit>(() => _i48.NewsDetailCubit());
  gh.factoryParam<_i49.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i49.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i50.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i50.NewsLikeNetworkRequest(newsId: newsId));
  gh.singleton<_i51.NewsListCubit>(_i51.NewsListCubit());
  gh.factoryParam<_i52.NewsListNetworkRequest,
          _i7.Pagination<_i53.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i52.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.lazySingleton<_i54.OnlineBloc>(() => _i54.OnlineBloc());
  gh.factory<_i55.OpenUniversityCubit>(() => _i55.OpenUniversityCubit());
  gh.lazySingleton<_i56.PackageInfoProvider>(() => _i56.PackageInfoProvider());
  gh.factory<_i57.PersonnelMovementsCubit>(
      () => _i57.PersonnelMovementsCubit());
  gh.factory<_i58.ProfileCubit>(() => _i58.ProfileCubit());
  gh.factoryParam<_i59.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i59.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i60.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i60.ProfileThankNetworkRequest(id: id));
  gh.lazySingleton<_i61.PushNotificationManager>(() =>
      _i61.PushNotificationManager(get<_i34.LocalNotificationsProvider>()));
  gh.singleton<_i62.ReferencesPageCubit>(_i62.ReferencesPageCubit());
  gh.factoryParam<_i63.ScrollBottomLoadMoreCubit,
          _i64.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i63.ScrollBottomLoadMoreCubit(initialState));
  gh.factory<_i65.SearchChatCubit>(() => _i65.SearchChatCubit());
  gh.singleton<_i66.SearchCubit>(_i66.SearchCubit());
  gh.factoryParam<_i67.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i67.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i68.SecureStorage>(() => _i68.SecureStorage());
  gh.factory<_i69.SecurityChecker>(() => _i69.SecurityChecker());
  gh.factory<_i70.SelectableCubit<dynamic>>(
      () => _i70.SelectableCubit<dynamic>());
  gh.factory<_i71.SelectfieldCubit>(() => _i71.SelectfieldCubit());
  gh.factoryParam<_i72.SendFeedbackFormNetworkRequest,
          _i73.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i72.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i74.SendManagementFormCubit>(_i74.SendManagementFormCubit());
  gh.singleton<_i75.SendMedicalInsFormCubit>(_i75.SendMedicalInsFormCubit());
  gh.factoryParam<_i76.SendMedicalInsFormNetworkRequest,
          _i77.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i76.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i78.SendReferenceFormCubit>(_i78.SendReferenceFormCubit());
  gh.factoryParam<_i79.SendReferenceFormNetworkRequest,
          _i80.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i79.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i81.StaffMovementsNetworkRequest>(
      _i81.StaffMovementsNetworkRequest());
  gh.factory<String>(() => tokenDataInjectorModule.localDatabasePassword,
      instanceName: 'localDatabasePassword');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.messengerAuthPassword,
      instanceName: 'messengerAuthPassword');
  gh.factory<String>(() => tokenDataInjectorModule.messengerAuthLogin,
      instanceName: 'messengerAuthLogin');
  gh.factory<String>(() => urlsConfigDev.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigUnitTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigProd.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.apiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  await gh.factoryAsync<String>(() => logFilePathInjector.logFile,
      instanceName: 'logFile',
      registerFor: {_test, _prod, _dev},
      preResolve: true);
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => testLogFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_test});
  gh.factory<String>(() => urlsConfigDev.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => urlsConfigDev.apiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.singleton<_i82.TagsListCubit>(_i82.TagsListCubit());
  gh.singleton<_i83.TagsListNetworkRequest>(_i83.TagsListNetworkRequest());
  gh.lazySingleton<_i84.TokenDataHolder>(() => _i84.TokenDataHolder());
  gh.factory<_i85.Uint8List>(() => certificateInjector.apiCertificate,
      instanceName: 'apiCertificate');
  gh.factory<_i85.Uint8List>(() => certificateInjector.natsCertificate,
      instanceName: 'natsCertificate');
  gh.singleton<_i86.AuthHandler>(_i86.AuthHandler(get<_i13.BootCubit>()));
  gh.lazySingleton<_i87.ChatDatabase>(() => _i87.ChatDatabase(
      get<String>(instanceName: 'localDatabasePassword'),
      get<String>(instanceName: 'userId')));
  gh.lazySingleton<_i88.ChatDatabaseCubit>(
      () => _i88.ChatDatabaseCubit(get<_i87.ChatDatabase>()));
  gh.factory<_i89.ChatFunctions>(() =>
      _i89.ChatFunctions(get<_i88.ChatDatabaseCubit>(), get<_i40.Messenger>()));
  gh.lazySingleton<_i90.FileLogAppender>(
      () => _i90.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.factory<_i91.InitialCubit>(() => _i91.InitialCubit(
      get<_i69.SecurityChecker>(),
      get<_i15.CertificateReader>(),
      get<_i86.AuthHandler>()));
  gh.lazySingleton<_i36.MainApiProvider>(() => _i36.MainApiProvider(
      get<_i36.LogInterceptor>(),
      get<String>(instanceName: 'apiUrl'),
      get<_i85.Uint8List>(instanceName: 'apiCertificate')));
  gh.lazySingleton<_i92.NatsProvider>(() => _i92.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i85.Uint8List>(instanceName: 'natsCertificate')));
  gh.factory<_i93.SendMessage>(() => _i93.SendMessage(
      chatFunctions: get<_i89.ChatFunctions>(),
      chatDatabaseCubit: get<_i88.ChatDatabaseCubit>()));
  gh.factory<_i94.UserFunctions>(
      () => _i94.UserFunctions(get<_i88.ChatDatabaseCubit>()));
  gh.factory<_i95.UserReactionSender>(() => _i95.UserReactionSender(
      get<_i92.NatsProvider>(), get<_i89.ChatFunctions>()));
  gh.factory<_i96.ChannelFunctions>(
      () => _i96.ChannelFunctions(get<_i88.ChatDatabaseCubit>()));
  gh.lazySingleton<_i97.ChannelsRegistry>(() => _i97.ChannelsRegistry(
      natsProvider: get<_i92.NatsProvider>(),
      channelFunctions: get<_i96.ChannelFunctions>(),
      userFunctions: get<_i94.UserFunctions>(),
      chatDatabaseCubit: get<_i88.ChatDatabaseCubit>(),
      pushNotificationManager: get<_i61.PushNotificationManager>()));
  gh.factory<_i98.ChatCreation>(() => _i98.ChatCreation(
      get<_i88.ChatDatabaseCubit>(),
      get<_i94.UserFunctions>(),
      get<_i40.Messenger>()));
  gh.factory<_i99.ChatSaver>(
      () => _i99.ChatSaver(get<_i87.ChatDatabase>(), get<_i92.NatsProvider>()));
  gh.factory<_i100.InviteSender>(() => _i100.InviteSender(
      get<_i92.NatsProvider>(),
      get<_i94.UserFunctions>(),
      get<_i89.ChatFunctions>(),
      get<_i99.ChatSaver>(),
      get<_i87.ChatDatabase>(),
      get<_i97.ChannelsRegistry>()));
  gh.factory<_i101.MessageEditorSender>(() => _i101.MessageEditorSender(
      get<_i92.NatsProvider>(),
      get<_i94.UserFunctions>(),
      get<_i89.ChatFunctions>(),
      get<_i87.ChatDatabase>()));
  gh.factory<_i102.MessageListener>(
      () => _i103.UserOnlineListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i40.Messenger>(),
          get<_i94.UserFunctions>(),
          get<_i88.ChatDatabaseCubit>()),
      instanceName: 'Online');
  gh.factory<_i102.MessageListener>(
      () => _i104.TextMessageListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i94.UserFunctions>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i100.InviteSender>(),
          get<_i89.ChatFunctions>()),
      instanceName: 'Text');
  gh.factory<_i102.MessageListener>(
      () => _i105.ChatInfoListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i94.UserFunctions>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i100.InviteSender>()),
      instanceName: 'UpdateChatInfo');
  gh.factory<_i102.MessageListener>(
      () => _i106.ChatListListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i94.UserFunctions>(),
          get<_i96.ChannelFunctions>(),
          get<_i99.ChatSaver>(),
          get<_i98.ChatCreation>()),
      instanceName: 'ChatList');
  gh.factory<_i102.MessageListener>(
      () => _i107.MessageDeletedListener(
          get<_i92.NatsProvider>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i97.ChannelsRegistry>(),
          get<_i89.ChatFunctions>(),
          get<_i100.InviteSender>(),
          get<_i87.ChatDatabase>(),
          get<_i99.ChatSaver>()),
      instanceName: 'RemoveMessage');
  gh.factory<_i102.MessageListener>(
      () => _i108.ChatLeftListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i100.InviteSender>(),
          get<_i99.ChatSaver>(),
          get<_i94.UserFunctions>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i89.ChatFunctions>()),
      instanceName: 'UserLeftChat');
  gh.factory<_i102.MessageListener>(
      () => _i109.MessageTextingListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i16.ChatCubit>()),
      instanceName: 'Texting');
  gh.factory<_i102.MessageListener>(
      () => _i110.ChatInvitationListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i99.ChatSaver>(),
          get<_i100.InviteSender>(),
          get<_i88.ChatDatabaseCubit>()),
      instanceName: 'InviteUserToJoinChat');
  gh.factory<_i102.MessageListener>(
      () => _i111.ChatJoinedListener(
          get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(),
          get<_i94.UserFunctions>(),
          get<_i88.ChatDatabaseCubit>(),
          get<_i100.InviteSender>(),
          get<_i99.ChatSaver>(),
          get<_i89.ChatFunctions>()),
      instanceName: 'UserJoined');
  gh.factory<_i102.MessageListener>(
      () => _i112.MessageStatusListener(get<_i92.NatsProvider>(),
          get<_i97.ChannelsRegistry>(), get<_i89.ChatFunctions>()),
      instanceName: 'UserReacted');
  gh.lazySingleton<_i113.OnlineSender>(() =>
      _i113.OnlineSender(get<_i92.NatsProvider>(), get<_i94.UserFunctions>()));
  gh.lazySingleton<_i114.TextSender>(() => _i114.TextSender(
      get<_i92.NatsProvider>(),
      get<_i94.UserFunctions>(),
      get<_i89.ChatFunctions>(),
      get<_i87.ChatDatabase>(),
      get<_i97.ChannelsRegistry>()));
  gh.factory<_i115.ChatEventsSender>(() => _i115.ChatEventsSender(
      get<_i92.NatsProvider>(),
      get<_i94.UserFunctions>(),
      get<_i99.ChatSaver>(),
      get<_i97.ChannelsRegistry>()));
  return get;
}

class _$TokenDataInjectorModule extends _i84.TokenDataInjectorModule {}

class _$UrlsConfigDev extends _i116.UrlsConfigDev {}

class _$UrlsConfigUnitTest extends _i116.UrlsConfigUnitTest {}

class _$UrlsConfigProd extends _i116.UrlsConfigProd {}

class _$LogFilePathInjector extends _i117.LogFilePathInjector {}

class _$TestLogFilePathInjector extends _i117.TestLogFilePathInjector {}

class _$UrlsConfigTest extends _i116.UrlsConfigTest {}

class _$CertificateInjector extends _i15.CertificateInjector {}
