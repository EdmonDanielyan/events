// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i82;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i42;
import 'constants/urls.dart' as _i111;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i62;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i63;
import 'core/cubit/selectable/selectable_cubit.dart' as _i68;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i69;
import 'core/handlers/AuthHandler.dart' as _i84;
import 'core/logging/file_log_appender.dart' as _i88;
import 'core/logging/files.dart' as _i112;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i12;
import 'cubit/boot/boot_cubit.dart' as _i13;
import 'cubit/chat/chat_cubit.dart' as _i16;
import 'cubit/chat_db/chat_table_cubit.dart' as _i18;
import 'cubit/chat_list/chat_list_cubit.dart' as _i19;
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i20;
import 'cubit/chat_person_list/sources/network.dart' as _i21;
import 'cubit/events_detail/events_detail_cubit.dart' as _i22;
import 'cubit/events_detail/sources/fetch/network.dart' as _i25;
import 'cubit/events_detail/sources/invite/network.dart' as _i23;
import 'cubit/events_list/events_list_cubit.dart' as _i26;
import 'cubit/events_list/sources/network.dart' as _i27;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i29;
import 'cubit/feedback_answer_list/sources/network.dart' as _i30;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i35;
import 'cubit/learning_materials_list/sources/network.dart' as _i33;
import 'cubit/main_page/announcements_list_cubit.dart' as _i38;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i24;
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
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i57;
import 'cubit/personnel_movements/sources/network.dart' as _i79;
import 'cubit/profile/profile_cubit.dart' as _i58;
import 'cubit/profile/sources/fetch/network.dart' as _i59;
import 'cubit/profile/sources/thank/network.dart' as _i60;
import 'cubit/references/references_cubit.dart' as _i61;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i32;
import 'cubit/search/search_cubit.dart' as _i64;
import 'cubit/search/sources/network.dart' as _i65;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i72;
import 'cubit/send_feedback_form/sources/network.dart' as _i70;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i73;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i74;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i76;
import 'cubit/send_reference_form/sources/network.dart' as _i77;
import 'cubit/tags_list/sources/network.dart' as _i81;
import 'cubit/tags_list/tags_list_cubit.dart' as _i80;
import 'functions/chat/channel_functions.dart' as _i85;
import 'functions/chat/chat_creation.dart' as _i86;
import 'functions/chat/chat_functions.dart' as _i87;
import 'functions/chat/listeners/channel_listener.dart' as _i99;
import 'functions/chat/listeners/channels_registry.dart' as _i94;
import 'functions/chat/listeners/chat_info.dart' as _i108;
import 'functions/chat/listeners/chat_list.dart' as _i109;
import 'functions/chat/listeners/delete_message.dart' as _i106;
import 'functions/chat/listeners/invitation.dart' as _i105;
import 'functions/chat/listeners/joined.dart' as _i104;
import 'functions/chat/listeners/left.dart' as _i103;
import 'functions/chat/listeners/message_status.dart' as _i102;
import 'functions/chat/listeners/online.dart' as _i101;
import 'functions/chat/listeners/text_message.dart' as _i107;
import 'functions/chat/listeners/texting.dart' as _i100;
import 'functions/chat/send_message.dart' as _i92;
import 'functions/chat/sender/chat_events.dart' as _i110;
import 'functions/chat/sender/chat_saver.dart' as _i95;
import 'functions/chat/sender/invite_sender.dart' as _i96;
import 'functions/chat/sender/message_editor_sender.dart' as _i97;
import 'functions/chat/sender/ping_sender.dart' as _i91;
import 'functions/chat/sender/text_sender.dart' as _i98;
import 'functions/chat/sender/user_reaction_sender.dart' as _i93;
import 'functions/chat/user_functions.dart' as _i83;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i17;
import 'models/event_data.dart' as _i28;
import 'models/feedback/management_answer.dart' as _i31;
import 'models/learning_materials_data.dart' as _i34;
import 'models/new_comment_entities.dart' as _i45;
import 'models/news_data.dart' as _i54;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i78;
import 'models/token.dart' as _i66;
import 'providers/certificate_reader.dart' as _i15;
import 'providers/lock_app.dart' as _i36;
import 'providers/main_api.dart' as _i37;
import 'providers/message_provider.dart' as _i41;
import 'providers/nats_provider.dart' as _i90;
import 'providers/package_info.dart' as _i56;
import 'providers/security_checker.dart' as _i67;
import 'screens/feedback/components/form/entities.dart' as _i71;
import 'screens/initial/cubit/initial_cubit.dart' as _i89;
import 'screens/medical_insurance/components/form/entities.dart' as _i75;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i55;

const String _test = 'test';
const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final urlsConfigTest = _$UrlsConfigTest();
  final urlsConfigProd = _$UrlsConfigProd();
  final urlsConfigDev = _$UrlsConfigDev();
  final testLogFilePathInjector = _$TestLogFilePathInjector();
  final logFilePathInjector = _$LogFilePathInjector();
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
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
  gh.lazySingleton<_i17.ChatDatabase>(() => _i17.ChatDatabase());
  gh.lazySingleton<_i18.ChatDatabaseCubit>(
      () => _i18.ChatDatabaseCubit(get<_i17.ChatDatabase>()));
  gh.factory<_i19.ChatListCubit>(() => _i19.ChatListCubit());
  gh.singleton<_i20.ChatPersonListCubit>(_i20.ChatPersonListCubit());
  gh.factoryParam<_i21.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i21.ContactsNetworkRequest(query: query));
  gh.factory<_i22.EventDetailCubit>(() => _i22.EventDetailCubit());
  gh.factoryParam<_i23.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i23.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i24.EventsAndAnnouncementsBlockCubit>(
      () => _i24.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i25.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i25.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i26.EventsListCubit>(() => _i26.EventsListCubit());
  gh.factoryParam<_i27.EventsListNetworkRequest,
          _i7.Pagination<_i28.EventData>?, dynamic>(
      (pagination, _) => _i27.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i29.FeedbackAnswerListCubit>(
      () => _i29.FeedbackAnswerListCubit());
  gh.factoryParam<_i30.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i31.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i30.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.singleton<_i32.GetAutofillNetworkRequest>(
      _i32.GetAutofillNetworkRequest());
  gh.factoryParam<_i33.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i34.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i33.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i35.LearningMaterialsListCubit>(
      () => _i35.LearningMaterialsListCubit());
  gh.singleton<_i36.LockApp>(_i36.LockApp());
  gh.lazySingleton<_i37.LogInterceptor>(() => _i37.LogInterceptor());
  gh.factory<_i38.MainAnnouncementsListCubit>(
      () => _i38.MainAnnouncementsListCubit());
  gh.factory<_i39.MainEventsListCubit>(() => _i39.MainEventsListCubit());
  gh.factory<_i40.MainPageCubit>(() => _i40.MainPageCubit());
  gh.lazySingleton<_i41.Messenger>(() => _i41.Messenger());
  gh.singleton<_i42.NewBottomNavBarCubit>(_i42.NewBottomNavBarCubit());
  gh.factory<_i43.NewsBlockCubit>(() => _i43.NewsBlockCubit());
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
  gh.factory<_i52.NewsListCubit>(() => _i52.NewsListCubit());
  gh.factoryParam<_i53.NewsListNetworkRequest,
          _i7.Pagination<_i54.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i53.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i55.OpenUniversityCubit>(() => _i55.OpenUniversityCubit());
  gh.lazySingleton<_i56.PackageInfoProvider>(() => _i56.PackageInfoProvider());
  gh.factory<_i57.PersonnelMovementsCubit>(
      () => _i57.PersonnelMovementsCubit());
  gh.factory<_i58.ProfileCubit>(() => _i58.ProfileCubit());
  gh.factoryParam<_i59.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i59.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i60.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i60.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i61.ReferencesPageCubit>(_i61.ReferencesPageCubit());
  gh.factoryParam<_i62.ScrollBottomLoadMoreCubit,
          _i63.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i62.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i64.SearchCubit>(_i64.SearchCubit());
  gh.factoryParam<_i65.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i65.SearchNetworkRequest(query: query));
  gh.lazySingleton<_i66.SecureStorage>(() => _i66.SecureStorage());
  gh.factory<_i67.SecurityChecker>(() => _i67.SecurityChecker());
  gh.factory<_i68.SelectableCubit<dynamic>>(
      () => _i68.SelectableCubit<dynamic>());
  gh.factory<_i69.SelectfieldCubit>(() => _i69.SelectfieldCubit());
  gh.factoryParam<_i70.SendFeedbackFormNetworkRequest,
          _i71.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i70.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i72.SendManagementFormCubit>(_i72.SendManagementFormCubit());
  gh.singleton<_i73.SendMedicalInsFormCubit>(_i73.SendMedicalInsFormCubit());
  gh.factoryParam<_i74.SendMedicalInsFormNetworkRequest,
          _i75.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i74.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i76.SendReferenceFormCubit>(_i76.SendReferenceFormCubit());
  gh.factoryParam<_i77.SendReferenceFormNetworkRequest,
          _i78.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i77.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i79.StaffMovementsNetworkRequest>(
      _i79.StaffMovementsNetworkRequest());
  gh.factory<String>(() => urlsConfigTest.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsCluster,
      instanceName: 'natsCluster', registerFor: {_test});
  gh.factory<String>(() => urlsConfigProd.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigProd.apiUrl,
      instanceName: 'apiUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  gh.factory<String>(() => testLogFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_test});
  await gh.factoryAsync<String>(() => logFilePathInjector.logFile,
      instanceName: 'logFile', registerFor: {_prod, _dev}, preResolve: true);
  gh.factory<String>(() => urlsConfigTest.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_test});
  gh.factory<String>(() => urlsConfigDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigTest.apiUrl,
      instanceName: 'apiUrl', registerFor: {_test});
  gh.factory<String>(() => urlsConfigTest.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_test});
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => urlsConfigDev.natsCertificatePath,
      instanceName: 'natsCertificatePath', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigDev.apiUrl,
      instanceName: 'apiUrl', registerFor: {_dev});
  gh.factory<String>(() => urlsConfigProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => urlsConfigDev.apiCertificatePath,
      instanceName: 'apiCertificatePath', registerFor: {_dev});
  gh.singleton<_i80.TagsListCubit>(_i80.TagsListCubit());
  gh.singleton<_i81.TagsListNetworkRequest>(_i81.TagsListNetworkRequest());
  gh.lazySingleton<_i66.TokenDataHolder>(() => _i66.TokenDataHolder());
  gh.factory<_i82.Uint8List>(() => certificateInjector.apiCertificate,
      instanceName: 'apiCertificate');
  gh.factory<_i82.Uint8List>(() => certificateInjector.natsCertificate,
      instanceName: 'natsCertificate');
  gh.factory<_i83.UserFunctions>(
      () => _i83.UserFunctions(get<_i18.ChatDatabaseCubit>()));
  gh.singleton<_i84.AuthHandler>(_i84.AuthHandler(get<_i13.BootCubit>()));
  gh.factory<_i85.ChannelFunctions>(
      () => _i85.ChannelFunctions(get<_i18.ChatDatabaseCubit>()));
  gh.factory<_i86.ChatCreation>(() => _i86.ChatCreation(
      get<_i18.ChatDatabaseCubit>(),
      get<_i83.UserFunctions>(),
      get<_i41.Messenger>()));
  gh.factory<_i87.ChatFunctions>(() =>
      _i87.ChatFunctions(get<_i18.ChatDatabaseCubit>(), get<_i41.Messenger>()));
  gh.lazySingleton<_i88.FileLogAppender>(
      () => _i88.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.factory<_i89.InitialCubit>(() => _i89.InitialCubit(
      get<_i67.SecurityChecker>(),
      get<_i15.CertificateReader>(),
      get<_i84.AuthHandler>()));
  gh.lazySingleton<_i37.MainApiProvider>(() => _i37.MainApiProvider(
      get<_i37.LogInterceptor>(),
      get<String>(instanceName: 'apiUrl'),
      get<_i82.Uint8List>(instanceName: 'apiCertificate')));
  gh.lazySingleton<_i90.NatsProvider>(() => _i90.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i82.Uint8List>(instanceName: 'natsCertificate')));
  gh.factory<_i91.PingSender>(() =>
      _i91.PingSender(get<_i90.NatsProvider>(), get<_i83.UserFunctions>()));
  gh.factory<_i92.SendMessage>(() => _i92.SendMessage(
      chatFunctions: get<_i87.ChatFunctions>(),
      chatDatabaseCubit: get<_i18.ChatDatabaseCubit>()));
  gh.factory<_i93.UserReactionSender>(() => _i93.UserReactionSender(
      get<_i90.NatsProvider>(), get<_i87.ChatFunctions>()));
  gh.lazySingleton<_i94.ChannelsRegistry>(() => _i94.ChannelsRegistry(
      natsProvider: get<_i90.NatsProvider>(),
      channelFunctions: get<_i85.ChannelFunctions>(),
      userFunctions: get<_i83.UserFunctions>(),
      chatDatabaseCubit: get<_i18.ChatDatabaseCubit>()));
  gh.factory<_i95.ChatSaver>(
      () => _i95.ChatSaver(get<_i17.ChatDatabase>(), get<_i90.NatsProvider>()));
  gh.factory<_i96.InviteSender>(() => _i96.InviteSender(
      get<_i90.NatsProvider>(),
      get<_i83.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i95.ChatSaver>(),
      get<_i17.ChatDatabase>(),
      get<_i94.ChannelsRegistry>()));
  gh.factory<_i97.MessageEditorSender>(() => _i97.MessageEditorSender(
      get<_i90.NatsProvider>(),
      get<_i83.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i17.ChatDatabase>()));
  gh.factory<_i98.TextSender>(() => _i98.TextSender(
      get<_i90.NatsProvider>(),
      get<_i83.UserFunctions>(),
      get<_i87.ChatFunctions>(),
      get<_i17.ChatDatabase>(),
      get<_i94.ChannelsRegistry>()));
  gh.factory<_i99.ChannelListener>(
      () => _i100.MessageTextingListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i16.ChatCubit>()),
      instanceName: 'Texting');
  gh.factory<_i99.ChannelListener>(
      () => _i101.UserOnlineListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i83.UserFunctions>(),
          get<_i18.ChatDatabaseCubit>()),
      instanceName: 'Online');
  gh.factory<_i99.ChannelListener>(
      () => _i102.MessageStatusListener(get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(), get<_i87.ChatFunctions>()),
      instanceName: 'UserReacted');
  gh.factory<_i99.ChannelListener>(
      () => _i103.ChatLeftListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i96.InviteSender>(),
          get<_i95.ChatSaver>(),
          get<_i83.UserFunctions>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'UserLeftChat');
  gh.factory<_i99.ChannelListener>(
      () => _i104.ChatJoinedListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i83.UserFunctions>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i96.InviteSender>(),
          get<_i95.ChatSaver>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'UserJoined');
  gh.factory<_i99.ChannelListener>(
      () => _i105.ChatInvitationListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i95.ChatSaver>(),
          get<_i96.InviteSender>(),
          get<_i18.ChatDatabaseCubit>()),
      instanceName: 'InviteUserToJoinChat');
  gh.factory<_i99.ChannelListener>(
      () => _i106.MessageDeletedListener(
          get<_i90.NatsProvider>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i94.ChannelsRegistry>(),
          get<_i87.ChatFunctions>(),
          get<_i96.InviteSender>(),
          get<_i17.ChatDatabase>(),
          get<_i95.ChatSaver>()),
      instanceName: 'RemoveMessage');
  gh.factory<_i99.ChannelListener>(
      () => _i107.TextMessageListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i83.UserFunctions>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i96.InviteSender>(),
          get<_i87.ChatFunctions>()),
      instanceName: 'Text');
  gh.factory<_i99.ChannelListener>(
      () => _i108.ChatInfoListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i83.UserFunctions>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i96.InviteSender>()),
      instanceName: 'UpdateChatInfo');
  gh.factory<_i99.ChannelListener>(
      () => _i109.ChatListListener(
          get<_i90.NatsProvider>(),
          get<_i94.ChannelsRegistry>(),
          get<_i18.ChatDatabaseCubit>(),
          get<_i83.UserFunctions>(),
          get<_i85.ChannelFunctions>(),
          get<_i95.ChatSaver>(),
          get<_i86.ChatCreation>()),
      instanceName: 'ChatList');
  gh.factory<_i110.ChatEventsSender>(() => _i110.ChatEventsSender(
      get<_i90.NatsProvider>(),
      get<_i83.UserFunctions>(),
      get<_i95.ChatSaver>(),
      get<_i94.ChannelsRegistry>()));
  return get;
}

class _$UrlsConfigTest extends _i111.UrlsConfigTest {}

class _$UrlsConfigProd extends _i111.UrlsConfigProd {}

class _$UrlsConfigDev extends _i111.UrlsConfigDev {}

class _$TestLogFilePathInjector extends _i112.TestLogFilePathInjector {}

class _$LogFilePathInjector extends _i112.LogFilePathInjector {}

class _$TokenDataInjectorModule extends _i66.TokenDataInjectorModule {}

class _$CertificateInjector extends _i15.CertificateInjector {}
