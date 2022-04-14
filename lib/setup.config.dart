// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i86;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i42;
import 'constants/urls.dart' as _i117;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i64;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i65;
import 'core/cubit/selectable/selectable_cubit.dart' as _i71;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i72;
import 'core/handlers/AuthHandler.dart' as _i87;
import 'core/logging/file_log_appender.dart' as _i91;
import 'core/logging/files.dart' as _i118;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i12;
import 'cubit/boot/boot_cubit.dart' as _i13;
import 'cubit/events_detail/events_detail_cubit.dart' as _i21;
import 'cubit/events_detail/sources/fetch/network.dart' as _i24;
import 'cubit/events_detail/sources/invite/network.dart' as _i22;
import 'cubit/events_list/events_list_cubit.dart' as _i25;
import 'cubit/events_list/sources/network.dart' as _i26;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i28;
import 'cubit/feedback_answer_list/sources/network.dart' as _i29;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i34;
import 'cubit/learning_materials_list/sources/network.dart' as _i32;
import 'cubit/main_page/announcements_list_cubit.dart' as _i38;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i23;
import 'cubit/main_page/events_list_cubit.dart' as _i39;
import 'cubit/main_page/main_cubit.dart' as _i40;
import 'cubit/main_page/news_block_cubit.dart' as _i43;
import 'cubit/news_comments/news_comments_cubit.dart' as _i46;
import 'cubit/news_comments/sources/comment/network.dart' as _i44;
import 'cubit/news_comments/sources/fetch/network.dart' as _i47;
import 'cubit/news_comments/sources/like/network.dart' as _i48;
import 'cubit/news_detail/news_detail_cubit.dart' as _i49;
import 'cubit/news_detail/sources/fetch/network.dart' as _i50;
import 'cubit/news_detail/sources/like/network.dart' as _i51;
import 'cubit/news_list/news_list_cubit.dart' as _i52;
import 'cubit/news_list/sources/network.dart' as _i53;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i58;
import 'cubit/personnel_movements/sources/network.dart' as _i82;
import 'cubit/profile/profile_cubit.dart' as _i59;
import 'cubit/profile/sources/fetch/network.dart' as _i60;
import 'cubit/profile/sources/thank/network.dart' as _i61;
import 'cubit/references/references_cubit.dart' as _i63;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i31;
import 'cubit/search/search_cubit.dart' as _i67;
import 'cubit/search/sources/network.dart' as _i68;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i75;
import 'cubit/send_feedback_form/sources/network.dart' as _i73;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i76;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i77;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i79;
import 'cubit/send_reference_form/sources/network.dart' as _i80;
import 'cubit/tags_list/sources/network.dart' as _i84;
import 'cubit/tags_list/tags_list_cubit.dart' as _i83;
import 'messenger/blocs/chat/chat_cubit.dart' as _i16;
import 'messenger/blocs/chat/chat_opened.dart' as _i18;
import 'messenger/blocs/chat_db/chat_table_cubit.dart' as _i89;
import 'messenger/blocs/chat_list/search_chat_cubit.dart' as _i66;
import 'messenger/blocs/chat_person_list/chat_person_list_cubit.dart' as _i19;
import 'messenger/blocs/chat_person_list/sources/network.dart' as _i20;
import 'messenger/blocs/online/online_bloc.dart' as _i55;
import 'messenger/cases/channel_functions.dart' as _i97;
import 'messenger/cases/chat_creation.dart' as _i99;
import 'messenger/cases/chat_functions.dart' as _i90;
import 'messenger/cases/send_message.dart' as _i94;
import 'messenger/cases/user_functions.dart' as _i95;
import 'messenger/listeners/channels_registry.dart' as _i98;
import 'messenger/listeners/chat_info.dart' as _i109;
import 'messenger/listeners/chat_list.dart' as _i108;
import 'messenger/listeners/delete_message.dart' as _i104;
import 'messenger/listeners/invitation.dart' as _i107;
import 'messenger/listeners/joined.dart' as _i106;
import 'messenger/listeners/left.dart' as _i113;
import 'messenger/listeners/message_listener.dart' as _i103;
import 'messenger/listeners/message_status.dart' as _i112;
import 'messenger/listeners/online.dart' as _i105;
import 'messenger/listeners/text_message.dart' as _i110;
import 'messenger/listeners/texting.dart' as _i111;
import 'messenger/models/chat/database/chat_db.dart' as _i88;
import 'messenger/providers/chat_import/chat_import_storage.dart' as _i17;
import 'messenger/providers/messenger.dart' as _i41;
import 'messenger/providers/nats_provider.dart' as _i93;
import 'messenger/providers/notifications/notifications.dart' as _i35;
import 'messenger/providers/notifications/push_notification_manager.dart'
    as _i62;
import 'messenger/sender/chat_events.dart' as _i116;
import 'messenger/sender/chat_saver.dart' as _i100;
import 'messenger/sender/invite_sender.dart' as _i101;
import 'messenger/sender/message_editor_sender.dart' as _i102;
import 'messenger/sender/online_sender.dart' as _i114;
import 'messenger/sender/text_sender.dart' as _i115;
import 'messenger/sender/user_reaction_sender.dart' as _i96;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i27;
import 'models/feedback/management_answer.dart' as _i30;
import 'models/learning_materials_data.dart' as _i33;
import 'models/new_comment_entities.dart' as _i45;
import 'models/news_data.dart' as _i54;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i81;
import 'models/token.dart' as _i85;
import 'providers/certificate_reader.dart' as _i15;
import 'providers/lock_app.dart' as _i36;
import 'providers/main_api.dart' as _i37;
import 'providers/package_info.dart' as _i57;
import 'providers/secure_storage.dart' as _i69;
import 'providers/security_checker.dart' as _i70;
import 'screens/feedback/components/form/entities.dart' as _i74;
import 'screens/initial/cubit/initial_cubit.dart' as _i92;
import 'screens/medical_insurance/components/form/entities.dart' as _i78;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i56;

const String _unitTest = 'unitTest';
const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final urlsConfigUnitTest = _$UrlsConfigUnitTest();
  final urlsConfigProd = _$UrlsConfigProd();
  final urlsConfigDev = _$UrlsConfigDev();
  final urlsConfigTest = _$UrlsConfigTest();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final logFilePathInjector = _$LogFilePathInjector();
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
  gh.singleton<_i18.ChatOpenedCubit>(_i18.ChatOpenedCubit());
  gh.singleton<_i19.ChatPersonListCubit>(_i19.ChatPersonListCubit());
  gh.factoryParam<_i20.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i20.ContactsNetworkRequest(query: query));
  gh.factory<_i21.EventDetailCubit>(() => _i21.EventDetailCubit());
  gh.factoryParam<_i22.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i22.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i23.EventsAndAnnouncementsBlockCubit>(
      () => _i23.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i24.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i24.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i25.EventsListCubit>(() => _i25.EventsListCubit());
  gh.factoryParam<_i26.EventsListNetworkRequest,
          _i7.Pagination<_i27.EventData>?, dynamic>(
      (pagination, _) => _i26.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i28.FeedbackAnswerListCubit>(
      () => _i28.FeedbackAnswerListCubit());
  gh.factoryParam<_i29.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i30.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i29.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i31.GetAutofillNetworkRequest>(
      _i31.GetAutofillNetworkRequest());
  gh.factoryParam<_i32.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i33.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i32.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i34.LearningMaterialsListCubit>(
      () => _i34.LearningMaterialsListCubit());
  gh.lazySingleton<_i35.LocalNotificationsProvider>(
      () => _i35.LocalNotificationsProvider());
  gh.singleton<_i36.LockApp>(_i36.LockApp());
  gh.lazySingleton<_i37.LogInterceptor>(() => _i37.LogInterceptor());
  gh.singleton<_i38.MainAnnouncementsListCubit>(
      _i38.MainAnnouncementsListCubit());
  gh.factory<_i39.MainEventsListCubit>(() => _i39.MainEventsListCubit());
  gh.factory<_i40.MainPageCubit>(() => _i40.MainPageCubit());
  gh.lazySingleton<_i41.Messenger>(() => _i41.Messenger());
  gh.singleton<_i42.NewBottomNavBarCubit>(_i42.NewBottomNavBarCubit());
  gh.singleton<_i43.NewsBlockCubit>(_i43.NewsBlockCubit());
  gh.factoryParam<_i44.NewsCommentsAddNetworkRequest, _i45.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i44.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i46.NewsCommentsCubit>(() => _i46.NewsCommentsCubit());
  gh.factoryParam<_i47.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i47.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i48.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i48.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i49.NewsDetailCubit>(() => _i49.NewsDetailCubit());
  gh.factoryParam<_i50.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i50.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i51.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i51.NewsLikeNetworkRequest(newsId: newsId));
  gh.singleton<_i52.NewsListCubit>(_i52.NewsListCubit());
  gh.factoryParam<_i53.NewsListNetworkRequest,
          _i7.Pagination<_i54.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i53.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.lazySingleton<_i55.OnlineBloc>(() => _i55.OnlineBloc());
  gh.factory<_i56.OpenUniversityCubit>(() => _i56.OpenUniversityCubit());
  gh.lazySingleton<_i57.PackageInfoProvider>(() => _i57.PackageInfoProvider());
  gh.factory<_i58.PersonnelMovementsCubit>(
      () => _i58.PersonnelMovementsCubit());
  gh.factory<_i59.ProfileCubit>(() => _i59.ProfileCubit());
  gh.factoryParam<_i60.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i60.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i61.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i61.ProfileThankNetworkRequest(id: id));
  gh.lazySingleton<_i62.PushNotificationManager>(() =>
      _i62.PushNotificationManager(get<_i35.LocalNotificationsProvider>()));
  gh.singleton<_i63.ReferencesPageCubit>(_i63.ReferencesPageCubit());
  gh.factoryParam<_i64.ScrollBottomLoadMoreCubit,
          _i65.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i64.ScrollBottomLoadMoreCubit(initialState));
  gh.factory<_i66.SearchChatCubit>(() => _i66.SearchChatCubit());
  gh.singleton<_i67.SearchCubit>(_i67.SearchCubit());
  gh.factoryParam<_i68.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i68.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i69.SecureStorage>(() => _i69.SecureStorage());
  gh.factory<_i70.SecurityChecker>(() => _i70.SecurityChecker());
  gh.factory<_i71.SelectableCubit<dynamic>>(
      () => _i71.SelectableCubit<dynamic>());
  gh.factory<_i72.SelectfieldCubit>(() => _i72.SelectfieldCubit());
  gh.factoryParam<_i73.SendFeedbackFormNetworkRequest,
          _i74.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i73.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i75.SendManagementFormCubit>(_i75.SendManagementFormCubit());
  gh.singleton<_i76.SendMedicalInsFormCubit>(_i76.SendMedicalInsFormCubit());
  gh.factoryParam<_i77.SendMedicalInsFormNetworkRequest,
          _i78.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i77.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i79.SendReferenceFormCubit>(_i79.SendReferenceFormCubit());
  gh.factoryParam<_i80.SendReferenceFormNetworkRequest,
          _i81.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i80.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i82.StaffMovementsNetworkRequest>(
      _i82.StaffMovementsNetworkRequest());
  gh.factory<String>(() => tokenDataInjectorModule.localDatabasePassword,
      instanceName: 'localDatabasePassword');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.messengerAuthPassword,
      instanceName: 'messengerAuthPassword');
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => urlsConfigUnitTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigUnitTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_unitTest});
  gh.factory<String>(() => urlsConfigProd.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.apiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => tokenDataInjectorModule.messengerAuthLogin,
      instanceName: 'messengerAuthLogin');
  gh.factory<String>(() => urlsConfigProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigDev.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigDev.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_test});
  gh.factory<String>(() => testLogFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_unitTest});
  await gh.factoryAsync<String>(() => logFilePathInjector.logFile,
      instanceName: 'logFile',
      registerFor: {_test, _prod, _dev},
      preResolve: true);
  gh.factory<String>(() => urlsConfigDev.apiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.singleton<_i83.TagsListCubit>(_i83.TagsListCubit());
  gh.singleton<_i84.TagsListNetworkRequest>(_i84.TagsListNetworkRequest());
  gh.lazySingleton<_i85.TokenDataHolder>(() => _i85.TokenDataHolder());
  gh.factory<_i86.Uint8List>(() => certificateInjector.apiCertificate,
      instanceName: 'apiCertificate');
  gh.factory<_i86.Uint8List>(() => certificateInjector.natsCertificate,
      instanceName: 'natsCertificate');
  gh.singleton<_i87.AuthHandler>(_i87.AuthHandler(get<_i13.BootCubit>()));
  gh.lazySingleton<_i88.ChatDatabase>(() => _i88.ChatDatabase(
      get<String>(instanceName: 'localDatabasePassword'),
      get<String>(instanceName: 'userId')));
  gh.lazySingleton<_i89.ChatDatabaseCubit>(
      () => _i89.ChatDatabaseCubit(get<_i88.ChatDatabase>()));
  gh.factory<_i90.ChatFunctions>(() =>
      _i90.ChatFunctions(get<_i89.ChatDatabaseCubit>(), get<_i41.Messenger>()));
  gh.lazySingleton<_i91.FileLogAppender>(
      () => _i91.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.factory<_i92.InitialCubit>(() => _i92.InitialCubit(
      get<_i70.SecurityChecker>(),
      get<_i15.CertificateReader>(),
      get<_i87.AuthHandler>()));
  gh.lazySingleton<_i37.MainApiProvider>(() => _i37.MainApiProvider(
      get<_i37.LogInterceptor>(),
      get<String>(instanceName: 'apiUrl'),
      get<_i86.Uint8List>(instanceName: 'apiCertificate')));
  gh.lazySingleton<_i93.NatsProvider>(() => _i93.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i86.Uint8List>(instanceName: 'natsCertificate')));
  gh.factory<_i94.SendMessage>(() => _i94.SendMessage(
      chatFunctions: get<_i90.ChatFunctions>(),
      chatDatabaseCubit: get<_i89.ChatDatabaseCubit>()));
  gh.factory<_i95.UserFunctions>(
      () => _i95.UserFunctions(get<_i89.ChatDatabaseCubit>()));
  gh.factory<_i96.UserReactionSender>(() => _i96.UserReactionSender(
      get<_i93.NatsProvider>(), get<_i90.ChatFunctions>()));
  gh.factory<_i97.ChannelFunctions>(
      () => _i97.ChannelFunctions(get<_i89.ChatDatabaseCubit>()));
  gh.lazySingleton<_i98.ChannelsRegistry>(() => _i98.ChannelsRegistry(
      natsProvider: get<_i93.NatsProvider>(),
      channelFunctions: get<_i97.ChannelFunctions>(),
      userFunctions: get<_i95.UserFunctions>(),
      chatDatabaseCubit: get<_i89.ChatDatabaseCubit>(),
      pushNotificationManager: get<_i62.PushNotificationManager>()));
  gh.factory<_i99.ChatCreation>(() => _i99.ChatCreation(
      get<_i89.ChatDatabaseCubit>(),
      get<_i95.UserFunctions>(),
      get<_i41.Messenger>()));
  gh.factory<_i100.ChatSaver>(() =>
      _i100.ChatSaver(get<_i88.ChatDatabase>(), get<_i93.NatsProvider>()));
  gh.factory<_i101.InviteSender>(() => _i101.InviteSender(
      get<_i93.NatsProvider>(),
      get<_i95.UserFunctions>(),
      get<_i90.ChatFunctions>(),
      get<_i100.ChatSaver>(),
      get<_i88.ChatDatabase>(),
      get<_i98.ChannelsRegistry>()));
  gh.factory<_i102.MessageEditorSender>(() => _i102.MessageEditorSender(
      get<_i93.NatsProvider>(),
      get<_i95.UserFunctions>(),
      get<_i90.ChatFunctions>(),
      get<_i88.ChatDatabase>()));
  gh.factory<_i103.MessageListener>(
      () => _i104.MessageDeletedListener(
          get<_i93.NatsProvider>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i98.ChannelsRegistry>(),
          get<_i90.ChatFunctions>(),
          get<_i101.InviteSender>(),
          get<_i88.ChatDatabase>(),
          get<_i100.ChatSaver>()),
      instanceName: 'RemoveMessage');
  gh.factory<_i103.MessageListener>(
      () => _i105.UserOnlineListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i41.Messenger>(),
          get<_i95.UserFunctions>(),
          get<_i89.ChatDatabaseCubit>()),
      instanceName: 'Online');
  gh.factory<_i103.MessageListener>(
      () => _i106.ChatJoinedListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i95.UserFunctions>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i101.InviteSender>(),
          get<_i100.ChatSaver>(),
          get<_i90.ChatFunctions>()),
      instanceName: 'UserJoined');
  gh.factory<_i103.MessageListener>(
      () => _i107.ChatInvitationListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i100.ChatSaver>(),
          get<_i101.InviteSender>(),
          get<_i89.ChatDatabaseCubit>()),
      instanceName: 'InviteUserToJoinChat');
  gh.factory<_i103.MessageListener>(
      () => _i108.ChatListListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i95.UserFunctions>(),
          get<_i97.ChannelFunctions>(),
          get<_i100.ChatSaver>(),
          get<_i99.ChatCreation>()),
      instanceName: 'ChatList');
  gh.factory<_i103.MessageListener>(
      () => _i109.ChatInfoListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i95.UserFunctions>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i101.InviteSender>()),
      instanceName: 'UpdateChatInfo');
  gh.factory<_i103.MessageListener>(
      () => _i110.TextMessageListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i95.UserFunctions>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i101.InviteSender>(),
          get<_i90.ChatFunctions>()),
      instanceName: 'Text');
  gh.factory<_i103.MessageListener>(
      () => _i111.MessageTextingListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i16.ChatCubit>()),
      instanceName: 'Texting');
  gh.factory<_i103.MessageListener>(
      () => _i112.MessageStatusListener(get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(), get<_i90.ChatFunctions>()),
      instanceName: 'UserReacted');
  gh.factory<_i103.MessageListener>(
      () => _i113.ChatLeftListener(
          get<_i93.NatsProvider>(),
          get<_i98.ChannelsRegistry>(),
          get<_i101.InviteSender>(),
          get<_i100.ChatSaver>(),
          get<_i95.UserFunctions>(),
          get<_i89.ChatDatabaseCubit>(),
          get<_i90.ChatFunctions>()),
      instanceName: 'UserLeftChat');
  gh.lazySingleton<_i114.OnlineSender>(() =>
      _i114.OnlineSender(get<_i93.NatsProvider>(), get<_i95.UserFunctions>()));
  gh.lazySingleton<_i115.TextSender>(() => _i115.TextSender(
      get<_i93.NatsProvider>(),
      get<_i95.UserFunctions>(),
      get<_i90.ChatFunctions>(),
      get<_i88.ChatDatabase>(),
      get<_i98.ChannelsRegistry>()));
  gh.factory<_i116.ChatEventsSender>(() => _i116.ChatEventsSender(
      get<_i93.NatsProvider>(),
      get<_i95.UserFunctions>(),
      get<_i100.ChatSaver>(),
      get<_i98.ChannelsRegistry>()));
  return get;
}

class _$TokenDataInjectorModule extends _i85.TokenDataInjectorModule {}

class _$UrlsConfigUnitTest extends _i117.UrlsConfigUnitTest {}

class _$UrlsConfigProd extends _i117.UrlsConfigProd {}

class _$UrlsConfigDev extends _i117.UrlsConfigDev {}

class _$UrlsConfigTest extends _i117.UrlsConfigTest {}

class _$TestLogFilePathInjector extends _i118.TestLogFilePathInjector {}

class _$LogFilePathInjector extends _i118.LogFilePathInjector {}

class _$CertificateInjector extends _i15.CertificateInjector {}
