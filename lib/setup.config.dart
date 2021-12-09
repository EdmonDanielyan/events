// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i81;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i43;
import 'constants/files.dart' as _i108;
import 'constants/messenger.dart' as _i107;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i62;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i63;
import 'core/cubit/selectable/selectable_cubit.dart' as _i66;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i67;
import 'core/handlers/AuthHandler.dart' as _i83;
import 'core/logging/file_log_appender.dart' as _i86;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i12;
import 'cubit/boot/boot_cubit.dart' as _i13;
import 'cubit/chat/chat_cubit.dart' as _i15;
import 'cubit/chat_db/chat_table_cubit.dart' as _i17;
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
    as _i36;
import 'cubit/learning_materials_list/sources/network.dart' as _i34;
import 'cubit/main_page/announcements_list_cubit.dart' as _i38;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i24;
import 'cubit/main_page/events_list_cubit.dart' as _i40;
import 'cubit/main_page/main_cubit.dart' as _i41;
import 'cubit/main_page/news_block_cubit.dart' as _i44;
import 'cubit/news_comments/news_comments_cubit.dart' as _i47;
import 'cubit/news_comments/sources/comment/network.dart' as _i45;
import 'cubit/news_comments/sources/fetch/network.dart' as _i48;
import 'cubit/news_comments/sources/like/network.dart' as _i49;
import 'cubit/news_detail/news_detail_cubit.dart' as _i50;
import 'cubit/news_detail/sources/fetch/network.dart' as _i51;
import 'cubit/news_detail/sources/like/network.dart' as _i52;
import 'cubit/news_list/news_list_cubit.dart' as _i53;
import 'cubit/news_list/sources/network.dart' as _i54;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i57;
import 'cubit/personnel_movements/sources/network.dart' as _i77;
import 'cubit/profile/profile_cubit.dart' as _i58;
import 'cubit/profile/sources/fetch/network.dart' as _i59;
import 'cubit/profile/sources/thank/network.dart' as _i60;
import 'cubit/references/references_cubit.dart' as _i61;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i32;
import 'cubit/search/search_cubit.dart' as _i64;
import 'cubit/search/sources/network.dart' as _i65;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i70;
import 'cubit/send_feedback_form/sources/network.dart' as _i68;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i71;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i72;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i74;
import 'cubit/send_reference_form/sources/network.dart' as _i75;
import 'cubit/tags_list/sources/network.dart' as _i79;
import 'cubit/tags_list/tags_list_cubit.dart' as _i78;
import 'functions/chat/channel_functions.dart' as _i84;
import 'functions/chat/chat_creation.dart' as _i85;
import 'functions/chat/chat_functions.dart' as _i18;
import 'functions/chat/listeners/channel_listener.dart' as _i95;
import 'functions/chat/listeners/channels_registry.dart' as _i90;
import 'functions/chat/listeners/chat_info.dart' as _i104;
import 'functions/chat/listeners/chat_list.dart' as _i103;
import 'functions/chat/listeners/delete_message.dart' as _i96;
import 'functions/chat/listeners/invitation.dart' as _i102;
import 'functions/chat/listeners/joined.dart' as _i99;
import 'functions/chat/listeners/left.dart' as _i100;
import 'functions/chat/listeners/message_status.dart' as _i101;
import 'functions/chat/listeners/online.dart' as _i97;
import 'functions/chat/listeners/text_message.dart' as _i105;
import 'functions/chat/listeners/texting.dart' as _i98;
import 'functions/chat/sender/chat_events.dart' as _i106;
import 'functions/chat/sender/chat_saver.dart' as _i91;
import 'functions/chat/sender/invite_sender.dart' as _i92;
import 'functions/chat/sender/message_editor_sender.dart' as _i93;
import 'functions/chat/sender/ping_sender.dart' as _i88;
import 'functions/chat/sender/text_sender.dart' as _i94;
import 'functions/chat/sender/user_reaction_sender.dart' as _i89;
import 'functions/chat/user_functions.dart' as _i82;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i16;
import 'models/event_data.dart' as _i28;
import 'models/feedback/management_answer.dart' as _i31;
import 'models/learning_materials_data.dart' as _i35;
import 'models/new_comment_entities.dart' as _i46;
import 'models/news_data.dart' as _i55;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i76;
import 'models/token.dart' as _i80;
import 'providers/lock_app.dart' as _i37;
import 'providers/main_api.dart' as _i39;
import 'providers/message_provider.dart' as _i42;
import 'providers/nats_provider.dart' as _i87;
import 'screens/feedback/components/form/entities.dart' as _i69;
import 'screens/initial/cubit/initial_cubit.dart' as _i33;
import 'screens/medical_insurance/components/form/entities.dart' as _i73;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i56;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final messengerProd = _$MessengerProd();
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final messengerDev = _$MessengerDev();
  final fileConstants = _$FileConstants();
  final messengerCertificate = _$MessengerCertificate();
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
  gh.singleton<_i15.ChatCubit>(_i15.ChatCubit());
  gh.lazySingleton<_i16.ChatDatabase>(() => _i16.ChatDatabase());
  gh.lazySingleton<_i17.ChatDatabaseCubit>(
      () => _i17.ChatDatabaseCubit(get<_i16.ChatDatabase>()));
  gh.factory<_i18.ChatFunctions>(
      () => _i18.ChatFunctions(get<_i17.ChatDatabaseCubit>()));
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
  gh.factory<_i33.InitialCubit>(() => _i33.InitialCubit());
  gh.factoryParam<_i34.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i35.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i34.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i36.LearningMaterialsListCubit>(
      () => _i36.LearningMaterialsListCubit());
  gh.singleton<_i37.LockApp>(_i37.LockApp());
  gh.factory<_i38.MainAnnouncementsListCubit>(
      () => _i38.MainAnnouncementsListCubit());
  gh.singleton<_i39.MainApiProvider>(_i39.MainApiProvider());
  gh.factory<_i40.MainEventsListCubit>(() => _i40.MainEventsListCubit());
  gh.factory<_i41.MainPageCubit>(() => _i41.MainPageCubit());
  gh.lazySingleton<_i42.MessageProvider>(() => _i42.MessageProvider());
  gh.singleton<_i43.NewBottomNavBarCubit>(_i43.NewBottomNavBarCubit());
  gh.factory<_i44.NewsBlockCubit>(() => _i44.NewsBlockCubit());
  gh.factoryParam<_i45.NewsCommentsAddNetworkRequest, _i46.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i45.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i47.NewsCommentsCubit>(() => _i47.NewsCommentsCubit());
  gh.factoryParam<_i48.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i48.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i49.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i49.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i50.NewsDetailCubit>(() => _i50.NewsDetailCubit());
  gh.factoryParam<_i51.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i51.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i52.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i52.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i53.NewsListCubit>(() => _i53.NewsListCubit());
  gh.factoryParam<_i54.NewsListNetworkRequest,
          _i7.Pagination<_i55.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i54.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i56.OpenUniversityCubit>(() => _i56.OpenUniversityCubit());
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
  gh.factory<_i66.SelectableCubit<dynamic>>(
      () => _i66.SelectableCubit<dynamic>());
  gh.factory<_i67.SelectfieldCubit>(() => _i67.SelectfieldCubit());
  gh.factoryParam<_i68.SendFeedbackFormNetworkRequest,
          _i69.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i68.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i70.SendManagementFormCubit>(_i70.SendManagementFormCubit());
  gh.singleton<_i71.SendMedicalInsFormCubit>(_i71.SendMedicalInsFormCubit());
  gh.factoryParam<_i72.SendMedicalInsFormNetworkRequest,
          _i73.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i72.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i74.SendReferenceFormCubit>(_i74.SendReferenceFormCubit());
  gh.factoryParam<_i75.SendReferenceFormNetworkRequest,
          _i76.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i75.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i77.StaffMovementsNetworkRequest>(
      _i77.StaffMovementsNetworkRequest());
  gh.factory<String>(() => messengerProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  gh.factory<String>(() => messengerProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => messengerDev.natsCertPath,
      instanceName: 'natsCertPath', registerFor: {_dev});
  gh.factory<String>(() => messengerDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => messengerDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  gh.factory<String>(() => fileConstants.logFile, instanceName: 'logFile');
  gh.factory<String>(() => messengerProd.natsCertPath,
      instanceName: 'natsCertPath', registerFor: {_prod});
  gh.singleton<_i78.TagsListCubit>(_i78.TagsListCubit());
  gh.singleton<_i79.TagsListNetworkRequest>(_i79.TagsListNetworkRequest());
  gh.lazySingleton<_i80.TokenDataHolder>(() => _i80.TokenDataHolder());
  await gh.factoryAsync<_i81.Uint8List>(() => messengerCertificate.natsCert,
      instanceName: 'natsCert', preResolve: true);
  gh.factory<_i82.UserFunctions>(
      () => _i82.UserFunctions(get<_i17.ChatDatabaseCubit>()));
  gh.singleton<_i83.AuthHandler>(_i83.AuthHandler(get<_i13.BootCubit>()));
  gh.factory<_i84.ChannelFunctions>(
      () => _i84.ChannelFunctions(get<_i17.ChatDatabaseCubit>()));
  gh.factory<_i85.ChatCreation>(() => _i85.ChatCreation(
      get<_i17.ChatDatabaseCubit>(), get<_i82.UserFunctions>()));
  gh.singleton<_i86.FileLogAppender>(
      _i86.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.lazySingleton<_i87.NatsProvider>(() => _i87.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i81.Uint8List>(instanceName: 'natsCert')));
  gh.factory<_i88.PingSender>(() =>
      _i88.PingSender(get<_i87.NatsProvider>(), get<_i82.UserFunctions>()));
  gh.factory<_i89.UserReactionSender>(
      () => _i89.UserReactionSender(get<_i87.NatsProvider>()));
  gh.lazySingleton<_i90.ChannelsRegistry>(() => _i90.ChannelsRegistry(
      natsProvider: get<_i87.NatsProvider>(),
      channelFunctions: get<_i84.ChannelFunctions>(),
      userFunctions: get<_i82.UserFunctions>()));
  gh.factory<_i91.ChatSaver>(
      () => _i91.ChatSaver(get<_i16.ChatDatabase>(), get<_i87.NatsProvider>()));
  gh.factory<_i92.InviteSender>(() => _i92.InviteSender(
      get<_i87.NatsProvider>(),
      get<_i82.UserFunctions>(),
      get<_i18.ChatFunctions>(),
      get<_i91.ChatSaver>(),
      get<_i16.ChatDatabase>(),
      get<_i90.ChannelsRegistry>()));
  gh.factory<_i93.MessageEditorSender>(() => _i93.MessageEditorSender(
      get<_i87.NatsProvider>(),
      get<_i82.UserFunctions>(),
      get<_i18.ChatFunctions>(),
      get<_i91.ChatSaver>(),
      get<_i16.ChatDatabase>()));
  gh.factory<_i94.TextSender>(() => _i94.TextSender(
      get<_i87.NatsProvider>(),
      get<_i82.UserFunctions>(),
      get<_i18.ChatFunctions>(),
      get<_i16.ChatDatabase>(),
      get<_i90.ChannelsRegistry>(),
      get<_i91.ChatSaver>()));
  gh.factory<_i95.ChannelListener>(
      () => _i96.MessageDeletedListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i18.ChatFunctions>(),
          get<_i92.InviteSender>(),
          get<_i16.ChatDatabase>(),
          get<_i91.ChatSaver>()),
      instanceName: 'RemoveMessage');
  gh.factory<_i95.ChannelListener>(
      () => _i97.UserOnlineListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i82.UserFunctions>(),
          get<_i92.InviteSender>(),
          get<_i17.ChatDatabaseCubit>()),
      instanceName: 'Online');
  gh.factory<_i95.ChannelListener>(
      () => _i98.MessageTextingListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i15.ChatCubit>()),
      instanceName: 'Texting');
  gh.factory<_i95.ChannelListener>(
      () => _i99.ChatJoinedListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i82.UserFunctions>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i92.InviteSender>(),
          get<_i91.ChatSaver>()),
      instanceName: 'UserJoined');
  gh.factory<_i95.ChannelListener>(
      () => _i100.ChatLeftListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i92.InviteSender>(),
          get<_i91.ChatSaver>(),
          get<_i82.UserFunctions>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i18.ChatFunctions>()),
      instanceName: 'UserLeftChat');
  gh.factory<_i95.ChannelListener>(
      () => _i101.MessageStatusListener(get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(), get<_i18.ChatFunctions>()),
      instanceName: 'UserReacted');
  gh.factory<_i95.ChannelListener>(
      () => _i102.ChatInvitationListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i92.InviteSender>(),
          get<_i17.ChatDatabaseCubit>()),
      instanceName: 'InviteUserToJoinChat');
  gh.factory<_i95.ChannelListener>(
      () => _i103.ChatListListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i82.UserFunctions>(),
          get<_i84.ChannelFunctions>(),
          get<_i91.ChatSaver>()),
      instanceName: 'ChatList');
  gh.factory<_i95.ChannelListener>(
      () => _i104.ChatInfoListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i82.UserFunctions>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i92.InviteSender>()),
      instanceName: 'UpdateChatInfo');
  gh.factory<_i95.ChannelListener>(
      () => _i105.TextMessageListener(
          get<_i87.NatsProvider>(),
          get<_i90.ChannelsRegistry>(),
          get<_i82.UserFunctions>(),
          get<_i17.ChatDatabaseCubit>(),
          get<_i92.InviteSender>(),
          get<_i18.ChatFunctions>(),
          get<_i91.ChatSaver>()),
      instanceName: 'Text');
  gh.factory<_i106.ChatEventsSender>(() => _i106.ChatEventsSender(
      get<_i87.NatsProvider>(),
      get<_i82.UserFunctions>(),
      get<_i91.ChatSaver>(),
      get<_i90.ChannelsRegistry>()));
  return get;
}

class _$MessengerProd extends _i107.MessengerProd {}

class _$TokenDataInjectorModule extends _i80.TokenDataInjectorModule {}

class _$MessengerDev extends _i107.MessengerDev {}

class _$FileConstants extends _i108.FileConstants {}

class _$MessengerCertificate extends _i107.MessengerCertificate {}
