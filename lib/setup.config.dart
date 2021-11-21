// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i39;
import 'constants/files.dart' as _i81;
import 'constants/urls.dart' as _i80;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i58;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i59;
import 'core/cubit/selectable/selectable_cubit.dart' as _i62;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i63;
import 'core/errors/file_log_appender.dart' as _i78;
import 'core/handlers/AuthHandler.dart' as _i77;
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
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i18;
import 'cubit/chat_person_list/sources/network.dart' as _i19;
import 'cubit/events_detail/events_detail_cubit.dart' as _i20;
import 'cubit/events_detail/sources/fetch/network.dart' as _i23;
import 'cubit/events_detail/sources/invite/network.dart' as _i21;
import 'cubit/events_list/events_list_cubit.dart' as _i24;
import 'cubit/events_list/sources/network.dart' as _i25;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i27;
import 'cubit/feedback_answer_list/sources/network.dart' as _i28;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i34;
import 'cubit/learning_materials_list/sources/network.dart' as _i32;
import 'cubit/main_page/announcements_list_cubit.dart' as _i35;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i22;
import 'cubit/main_page/events_list_cubit.dart' as _i37;
import 'cubit/main_page/main_cubit.dart' as _i38;
import 'cubit/main_page/news_block_cubit.dart' as _i40;
import 'cubit/news_comments/news_comments_cubit.dart' as _i43;
import 'cubit/news_comments/sources/comment/network.dart' as _i41;
import 'cubit/news_comments/sources/fetch/network.dart' as _i44;
import 'cubit/news_comments/sources/like/network.dart' as _i45;
import 'cubit/news_detail/news_detail_cubit.dart' as _i46;
import 'cubit/news_detail/sources/fetch/network.dart' as _i47;
import 'cubit/news_detail/sources/like/network.dart' as _i48;
import 'cubit/news_list/news_list_cubit.dart' as _i49;
import 'cubit/news_list/sources/network.dart' as _i50;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i53;
import 'cubit/personnel_movements/sources/network.dart' as _i73;
import 'cubit/profile/profile_cubit.dart' as _i54;
import 'cubit/profile/sources/fetch/network.dart' as _i55;
import 'cubit/profile/sources/thank/network.dart' as _i56;
import 'cubit/references/references_cubit.dart' as _i57;
import 'cubit/references/sources/check_permission/network.dart' as _i14;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i30;
import 'cubit/search/search_cubit.dart' as _i60;
import 'cubit/search/sources/network.dart' as _i61;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i66;
import 'cubit/send_feedback_form/sources/network.dart' as _i64;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i67;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i68;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i70;
import 'cubit/send_reference_form/sources/network.dart' as _i71;
import 'cubit/tags_list/sources/network.dart' as _i75;
import 'cubit/tags_list/tags_list_cubit.dart' as _i74;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i16;
import 'models/event_data.dart' as _i26;
import 'models/feedback/management_answer.dart' as _i29;
import 'models/learning_materials_data.dart' as _i33;
import 'models/new_comment_entities.dart' as _i42;
import 'models/news_data.dart' as _i51;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i72;
import 'models/token.dart' as _i76;
import 'providers/main_api.dart' as _i36;
import 'providers/nats_provider.dart' as _i79;
import 'screens/feedback/components/form/entities.dart' as _i65;
import 'screens/initial/cubit/initial_cubit.dart' as _i31;
import 'screens/medical_insurance/components/form/entities.dart' as _i69;
import 'screens/open_university/cubit/open_university_cubit.dart'
    as _i52; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final urls = _$Urls();
  final tokenDataInjectorModule = _$TokenDataInjectorModule();
  final fileConstants = _$FileConstants();
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
  gh.factory<_i31.InitialCubit>(() => _i31.InitialCubit());
  gh.factoryParam<_i32.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i33.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i32.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i34.LearningMaterialsListCubit>(
      () => _i34.LearningMaterialsListCubit());
  gh.factory<_i35.MainAnnouncementsListCubit>(
      () => _i35.MainAnnouncementsListCubit());
  gh.singleton<_i36.MainApiProvider>(_i36.MainApiProvider());
  gh.factory<_i37.MainEventsListCubit>(() => _i37.MainEventsListCubit());
  gh.factory<_i38.MainPageCubit>(() => _i38.MainPageCubit());
  gh.singleton<_i39.NewBottomNavBarCubit>(_i39.NewBottomNavBarCubit());
  gh.factory<_i40.NewsBlockCubit>(() => _i40.NewsBlockCubit());
  gh.factoryParam<_i41.NewsCommentsAddNetworkRequest, _i42.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i41.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i43.NewsCommentsCubit>(() => _i43.NewsCommentsCubit());
  gh.factoryParam<_i44.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i44.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i45.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i45.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i46.NewsDetailCubit>(() => _i46.NewsDetailCubit());
  gh.factoryParam<_i47.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i47.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i48.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i48.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i49.NewsListCubit>(() => _i49.NewsListCubit());
  gh.factoryParam<_i50.NewsListNetworkRequest,
          _i7.Pagination<_i51.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i50.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i52.OpenUniversityCubit>(() => _i52.OpenUniversityCubit());
  gh.factory<_i53.PersonnelMovementsCubit>(
      () => _i53.PersonnelMovementsCubit());
  gh.factory<_i54.ProfileCubit>(() => _i54.ProfileCubit());
  gh.factoryParam<_i55.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i55.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i56.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i56.ProfileThankNetworkRequest(id: id));
  gh.singleton<_i57.ReferencesPageCubit>(_i57.ReferencesPageCubit());
  gh.factoryParam<_i58.ScrollBottomLoadMoreCubit,
          _i59.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i58.ScrollBottomLoadMoreCubit(initialState));
  gh.singleton<_i60.SearchCubit>(_i60.SearchCubit());
  gh.factoryParam<_i61.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i61.SearchNetworkRequest(query: query));
  gh.factory<_i62.SelectableCubit<dynamic>>(
      () => _i62.SelectableCubit<dynamic>());
  gh.factory<_i63.SelectfieldCubit>(() => _i63.SelectfieldCubit());
  gh.factoryParam<_i64.SendFeedbackFormNetworkRequest,
          _i65.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i64.SendFeedbackFormNetworkRequest(entities: entities));
  gh.singleton<_i66.SendManagementFormCubit>(_i66.SendManagementFormCubit());
  gh.singleton<_i67.SendMedicalInsFormCubit>(_i67.SendMedicalInsFormCubit());
  gh.factoryParam<_i68.SendMedicalInsFormNetworkRequest,
          _i69.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i68.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.singleton<_i70.SendReferenceFormCubit>(_i70.SendReferenceFormCubit());
  gh.factoryParam<_i71.SendReferenceFormNetworkRequest,
          _i72.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i71.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i73.StaffMovementsNetworkRequest>(
      _i73.StaffMovementsNetworkRequest());
  gh.factory<String>(() => urls.natsCertPath, instanceName: 'natsCertPath');
  gh.factory<String>(() => tokenDataInjectorModule.userId,
      instanceName: 'userId');
  gh.factory<String>(() => tokenDataInjectorModule.natsToken,
      instanceName: 'natsToken');
  gh.factory<String>(() => tokenDataInjectorModule.deviceVirtualId,
      instanceName: 'deviceVirtualId');
  gh.factory<String>(() => urls.natsCluster, instanceName: 'natsCluster');
  gh.factory<String>(() => urls.natsWssUrl, instanceName: 'natsWssUrl');
  gh.factory<String>(() => fileConstants.logFile, instanceName: 'logFile');
  gh.singleton<_i74.TagsListCubit>(_i74.TagsListCubit());
  gh.singleton<_i75.TagsListNetworkRequest>(_i75.TagsListNetworkRequest());
  gh.lazySingleton<_i76.TokenDataHolder>(() => _i76.TokenDataHolder());
  gh.singleton<_i77.AuthHandler>(_i77.AuthHandler(get<_i13.BootCubit>()));
  gh.singleton<_i78.FileLogAppender>(
      _i78.FileLogAppender(get<String>(instanceName: 'logFile')));
  gh.lazySingleton<_i79.NatsProvider>(() => _i79.NatsProvider(
      natsWssUrl: get<String>(instanceName: 'natsWssUrl'),
      natsCluster: get<String>(instanceName: 'natsCluster'),
      natsCertPath: get<String>(instanceName: 'natsCertPath'),
      userId: get<String>(instanceName: 'userId'),
      deviceVirtualId: get<String>(instanceName: 'deviceVirtualId'),
      natsToken: get<String>(instanceName: 'natsToken')));
  return get;
}

class _$Urls extends _i80.Urls {}

class _$TokenDataInjectorModule extends _i76.TokenDataInjectorModule {}

class _$FileConstants extends _i81.FileConstants {}
