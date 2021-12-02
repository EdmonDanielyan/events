// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:typed_data' as _i79;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i41;
import 'constants/files.dart' as _i98;
import 'constants/messenger.dart' as _i99;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i60;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i61;
import 'core/cubit/selectable/selectable_cubit.dart' as _i64;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i65;
import 'core/errors/file_log_appender.dart' as _i84;
import 'core/handlers/AuthHandler.dart' as _i81;
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
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i19;
import 'cubit/chat_person_list/sources/network.dart' as _i20;
import 'cubit/events_detail/events_detail_cubit.dart' as _i21;
import 'cubit/events_detail/sources/fetch/network.dart' as _i24;
import 'cubit/events_detail/sources/invite/network.dart' as _i22;
import 'cubit/events_list/events_list_cubit.dart' as _i25;
import 'cubit/events_list/sources/network.dart' as _i26;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i28;
import 'cubit/feedback_answer_list/sources/network.dart' as _i29;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i35;
import 'cubit/learning_materials_list/sources/network.dart' as _i33;
import 'cubit/main_page/announcements_list_cubit.dart' as _i37;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i23;
import 'cubit/main_page/events_list_cubit.dart' as _i39;
import 'cubit/main_page/main_cubit.dart' as _i40;
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
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i55;
import 'cubit/personnel_movements/sources/network.dart' as _i75;
import 'cubit/profile/profile_cubit.dart' as _i56;
import 'cubit/profile/sources/fetch/network.dart' as _i57;
import 'cubit/profile/sources/thank/network.dart' as _i58;
import 'cubit/references/references_cubit.dart' as _i59;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i31;
import 'cubit/search/search_cubit.dart' as _i62;
import 'cubit/search/sources/network.dart' as _i63;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i68;
import 'cubit/send_feedback_form/sources/network.dart' as _i66;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i69;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i70;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i72;
import 'cubit/send_reference_form/sources/network.dart' as _i73;
import 'cubit/tags_list/sources/network.dart' as _i77;
import 'cubit/tags_list/tags_list_cubit.dart' as _i76;
import 'functions/chat/channel_functions.dart' as _i82;
import 'functions/chat/chat_creation.dart' as _i83;
import 'functions/chat/chat_functions.dart' as _i18;
import 'functions/chat/listeners/chat.dart' as _i94;
import 'functions/chat/listeners/chat_info.dart' as _i96;
import 'functions/chat/listeners/chat_list.dart' as _i86;
import 'functions/chat/listeners/delete_message.dart' as _i95;
import 'functions/chat/listeners/invitation.dart' as _i92;
import 'functions/chat/listeners/joined.dart' as _i93;
import 'functions/chat/listeners/left.dart' as _i97;
import 'functions/chat/listeners/message_status.dart' as _i89;
import 'functions/chat/listeners/online.dart' as _i91;
import 'functions/chat/listeners/texting.dart' as _i90;
import 'functions/chat/sender/message_sender.dart' as _i88;
import 'functions/chat/user_functions.dart' as _i80;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i16;
import 'models/event_data.dart' as _i27;
import 'models/feedback/management_answer.dart' as _i30;
import 'models/learning_materials_data.dart' as _i34;
import 'models/new_comment_entities.dart' as _i44;
import 'models/news_data.dart' as _i53;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i74;
import 'models/token.dart' as _i78;
import 'providers/lock_app.dart' as _i36;
import 'providers/main_api.dart' as _i38;
import 'providers/message_provider.dart' as _i87;
import 'providers/nats_provider.dart' as _i85;
import 'screens/feedback/components/form/entities.dart' as _i67;
import 'screens/initial/cubit/initial_cubit.dart' as _i32;
import 'screens/medical_insurance/components/form/entities.dart' as _i71;
import 'screens/open_university/cubit/open_university_cubit.dart' as _i54;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final fileConstants = _$FileConstants();
  final messengerDev = _$MessengerDev();
  final messengerProd = _$MessengerProd();
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
  gh.singleton<_i16.ChatDatabase>(_i16.ChatDatabase());
  gh.singleton<_i17.ChatDatabaseCubit>(_i17.ChatDatabaseCubit());
  gh.factory<_i18.ChatFunctions>(
      () => _i18.ChatFunctions(get<_i17.ChatDatabaseCubit>()));
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
  gh.factory<_i32.InitialCubit>(() => _i32.InitialCubit());
  gh.factoryParam<_i33.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i34.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i33.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i35.LearningMaterialsListCubit>(
      () => _i35.LearningMaterialsListCubit());
  gh.singleton<_i36.LockApp>(_i36.LockApp());
  gh.factory<_i37.MainAnnouncementsListCubit>(
      () => _i37.MainAnnouncementsListCubit());
  gh.singleton<_i38.MainApiProvider>(_i38.MainApiProvider());
  gh.factory<_i39.MainEventsListCubit>(() => _i39.MainEventsListCubit());
  gh.factory<_i40.MainPageCubit>(() => _i40.MainPageCubit());
  gh.singleton<_i41.NewBottomNavBarCubit>(_i41.NewBottomNavBarCubit());
  gh.factory<_i42.NewsBlockCubit>(() => _i42.NewsBlockCubit());
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
  gh.factory<_i51.NewsListCubit>(() => _i51.NewsListCubit());
  gh.factoryParam<_i52.NewsListNetworkRequest,
          _i7.Pagination<_i53.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i52.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i54.OpenUniversityCubit>(() => _i54.OpenUniversityCubit());
  gh.factory<_i55.PersonnelMovementsCubit>(
      () => _i55.PersonnelMovementsCubit());
  gh.factory<_i56.ProfileCubit>(() => _i56.ProfileCubit());
  gh.factoryParam<_i57.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i57.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i58.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i58.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i59.ReferencesPageCubit>(_i59.ReferencesPageCubit());
  gh.factoryParam<_i60.ScrollBottomLoadMoreCubit,
          _i61.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i60.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i62.SearchCubit>(_i62.SearchCubit());
  gh.factoryParam<_i63.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i63.SearchNetworkRequest(query: query));
  gh.factory<_i64.SelectableCubit<dynamic>>(
      () => _i64.SelectableCubit<dynamic>());
  gh.factory<_i65.SelectfieldCubit>(() => _i65.SelectfieldCubit());
  gh.factoryParam<_i66.SendFeedbackFormNetworkRequest,
          _i67.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i66.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i68.SendManagementFormCubit>(_i68.SendManagementFormCubit());
  gh.singleton<_i69.SendMedicalInsFormCubit>(_i69.SendMedicalInsFormCubit());
  gh.factoryParam<_i70.SendMedicalInsFormNetworkRequest,
          _i71.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i70.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i72.SendReferenceFormCubit>(_i72.SendReferenceFormCubit());
  gh.factoryParam<_i73.SendReferenceFormNetworkRequest,
          _i74.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i73.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i75.StaffMovementsNetworkRequest>(
      _i75.StaffMovementsNetworkRequest());
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => fileConstants.logFile, instanceName: 'logFile');
  gh.factory<String>(() => messengerDev.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_dev});
  gh.factory<String>(() => messengerDev.natsCluster,
      instanceName: 'natsCluster', registerFor: {_dev});
  gh.factory<String>(() => messengerDev.natsCertPath,
      instanceName: 'natsCertPath', registerFor: {_dev});
  gh.factory<String>(() => messengerProd.natsWssUrl,
      instanceName: 'natsWssUrl', registerFor: {_prod});
  gh.factory<String>(() => messengerProd.natsCluster,
      instanceName: 'natsCluster', registerFor: {_prod});
  gh.factory<String>(() => messengerProd.natsCertPath,
      instanceName: 'natsCertPath', registerFor: {_prod});
  gh.singleton<_i76.TagsListCubit>(_i76.TagsListCubit());
  gh.singleton<_i77.TagsListNetworkRequest>(_i77.TagsListNetworkRequest());
  gh.lazySingleton<_i78.TokenDataHolder>(() => _i78.TokenDataHolder());
  await gh.factoryAsync<_i79.Uint8List>(() => messengerCertificate.natsCert,
      instanceName: 'natsCert', preResolve: true);
  gh.factory<_i80.UserFunctions>(
      () => _i80.UserFunctions(get<_i17.ChatDatabaseCubit>()));
  gh.singleton<_i81.AuthHandler>(_i81.AuthHandler(get<_i13.BootCubit>()));
  gh.factory<_i82.ChannelFunctions>(
      () => _i82.ChannelFunctions(get<_i17.ChatDatabaseCubit>()));
  gh.factory<_i83.ChatCreation>(
      () => _i83.ChatCreation(get<_i17.ChatDatabaseCubit>()));
  gh.singleton<_i84.FileLogAppender>(
      _i84.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.lazySingleton<_i85.NatsProvider>(() => _i85.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken'),
      certificate: get<_i79.Uint8List>(instanceName: 'natsCert')));
  gh.factory<_i86.ChatListListener>(() => _i86.ChatListListener(
      natsProvider: get<_i85.NatsProvider>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>(),
      userFunctions: get<_i80.UserFunctions>(),
      channelFunctions: get<_i82.ChannelFunctions>()));
  gh.lazySingleton<_i87.MessageProvider>(() => _i87.MessageProvider(
      get<_i85.NatsProvider>(),
      get<_i17.ChatDatabaseCubit>(),
      get<_i15.ChatCubit>(),
      get<_i80.UserFunctions>()));
  gh.factory<_i88.MessageSender>(
      () => _i88.MessageSender(get<_i85.NatsProvider>()));
  gh.factory<_i89.MessageStatusListener>(() => _i89.MessageStatusListener(
      natsProvider: get<_i85.NatsProvider>(),
      chatFunctions: get<_i18.ChatFunctions>()));
  gh.factory<_i90.MessageTextingListener>(() => _i90.MessageTextingListener(
      natsProvider: get<_i85.NatsProvider>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>(),
      chatCubit: get<_i15.ChatCubit>()));
  gh.factory<_i91.UserOnlineListener>(() => _i91.UserOnlineListener(
      messageSender: get<_i88.MessageSender>(),
      natsProvider: get<_i85.NatsProvider>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>()));
  gh.factory<_i92.ChatInvitationListener>(() => _i92.ChatInvitationListener(
      get<_i85.NatsProvider>(),
      get<_i88.MessageSender>(),
      get<_i17.ChatDatabaseCubit>()));
  gh.factory<_i93.ChatJoinedListener>(() => _i93.ChatJoinedListener(
      messageProvider: get<_i87.MessageProvider>(),
      natsProvider: get<_i85.NatsProvider>(),
      userFunctions: get<_i80.UserFunctions>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>()));
  gh.factory<_i94.ChatMessageListener>(() => _i94.ChatMessageListener(
      messageProvider: get<_i87.MessageProvider>(),
      natsProvider: get<_i85.NatsProvider>(),
      userFunctions: get<_i80.UserFunctions>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>(),
      messageSender: get<_i88.MessageSender>()));
  gh.factory<_i87.ChatSaver>(() =>
      _i87.ChatSaver(get<_i17.ChatDatabaseCubit>(), get<_i88.MessageSender>()));
  gh.factory<_i95.MessageDeletedListener>(() => _i95.MessageDeletedListener(
      get<_i85.NatsProvider>(),
      get<_i18.ChatFunctions>(),
      get<_i87.ChatSaver>(),
      get<_i88.MessageSender>()));
  gh.factory<_i96.ChatInfoListener>(() => _i96.ChatInfoListener(
      get<_i85.NatsProvider>(),
      get<_i17.ChatDatabaseCubit>(),
      get<_i88.MessageSender>(),
      get<_i87.ChatSaver>()));
  gh.factory<_i97.ChatLeftListener>(() => _i97.ChatLeftListener(
      messageSender: get<_i88.MessageSender>(),
      chatSaver: get<_i87.ChatSaver>(),
      natsProvider: get<_i85.NatsProvider>(),
      userFunctions: get<_i80.UserFunctions>(),
      chatDatabaseCubit: get<_i17.ChatDatabaseCubit>()));
  return get;
}

class _$TokenDataInjectorModule extends _i78.TokenDataInjectorModule {}

class _$FileConstants extends _i98.FileConstants {}

class _$MessengerDev extends _i99.MessengerDev {}

class _$MessengerProd extends _i99.MessengerProd {}

class _$MessengerCertificate extends _i99.MessengerCertificate {}
