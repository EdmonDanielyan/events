// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i67;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i49;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i50;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i52;
import 'core/handlers/AuthHandler.dart' as _i76;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i59;
import 'cubit/boot/boot_cubit.dart' as _i60;
import 'cubit/chat/chat_cubit.dart' as _i12;
import 'cubit/chat_db/chat_table_cubit.dart' as _i63;
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i13;
import 'cubit/chat_person_list/sources/network.dart' as _i14;
import 'cubit/events_detail/events_detail_cubit.dart' as _i15;
import 'cubit/events_detail/sources/fetch/network.dart' as _i18;
import 'cubit/events_detail/sources/invite/network.dart' as _i16;
import 'cubit/events_list/events_list_cubit.dart' as _i19;
import 'cubit/events_list/sources/network.dart' as _i20;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i22;
import 'cubit/feedback_answer_list/sources/network.dart' as _i23;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i28;
import 'cubit/learning_materials_list/sources/network.dart' as _i26;
import 'cubit/main_page/announcements_list_cubit.dart' as _i29;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i17;
import 'cubit/main_page/events_list_cubit.dart' as _i30;
import 'cubit/main_page/main_cubit.dart' as _i31;
import 'cubit/main_page/news_block_cubit.dart' as _i32;
import 'cubit/news_comments/news_comments_cubit.dart' as _i35;
import 'cubit/news_comments/sources/comment/network.dart' as _i33;
import 'cubit/news_comments/sources/fetch/network.dart' as _i36;
import 'cubit/news_comments/sources/like/network.dart' as _i37;
import 'cubit/news_detail/news_detail_cubit.dart' as _i38;
import 'cubit/news_detail/sources/fetch/network.dart' as _i39;
import 'cubit/news_detail/sources/like/network.dart' as _i40;
import 'cubit/news_list/news_list_cubit.dart' as _i41;
import 'cubit/news_list/sources/network.dart' as _i42;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i45;
import 'cubit/personnel_movements/sources/network.dart' as _i73;
import 'cubit/profile/profile_cubit.dart' as _i46;
import 'cubit/profile/sources/fetch/network.dart' as _i47;
import 'cubit/profile/sources/thank/network.dart' as _i48;
import 'cubit/references/references_cubit.dart' as _i68;
import 'cubit/references/sources/check_permission/network.dart' as _i61;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i64;
import 'cubit/search/search_cubit.dart' as _i69;
import 'cubit/search/sources/network.dart' as _i51;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i70;
import 'cubit/send_feedback_form/sources/network.dart' as _i53;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i71;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i55;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i72;
import 'cubit/send_reference_form/sources/network.dart' as _i57;
import 'cubit/tags_list/sources/network.dart' as _i75;
import 'cubit/tags_list/tags_list_cubit.dart' as _i74;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i62;
import 'models/event_data.dart' as _i21;
import 'models/feedback/management_answer.dart' as _i24;
import 'models/learning_materials_data.dart' as _i27;
import 'models/new_comment_entities.dart' as _i34;
import 'models/news_data.dart' as _i43;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i58;
import 'providers/main_api.dart' as _i65;
import 'providers/nats_provider.dart' as _i66;
import 'screens/feedback/components/form/entities.dart' as _i54;
import 'screens/initial/cubit/initial_cubit.dart' as _i25;
import 'screens/medical_insurance/components/form/entities.dart' as _i56;
import 'screens/open_university/cubit/open_university_cubit.dart'
    as _i44; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
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
  gh.factory<_i12.ChatCubit>(() => _i12.ChatCubit());
  gh.factory<_i13.ChatPersonListCubit>(() => _i13.ChatPersonListCubit());
  gh.factoryParam<_i14.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i14.ContactsNetworkRequest(query: query));
  gh.factory<_i15.EventDetailCubit>(() => _i15.EventDetailCubit());
  gh.factoryParam<_i16.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i16.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i17.EventsAndAnnouncementsBlockCubit>(
      () => _i17.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i18.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i18.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i19.EventsListCubit>(() => _i19.EventsListCubit());
  gh.factoryParam<_i20.EventsListNetworkRequest,
          _i7.Pagination<_i21.EventData>?, dynamic>(
      (pagination, _) => _i20.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i22.FeedbackAnswerListCubit>(
      () => _i22.FeedbackAnswerListCubit());
  gh.factoryParam<_i23.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i24.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i23.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.factory<_i25.InitialCubit>(() => _i25.InitialCubit());
  gh.factoryParam<_i26.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i27.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i26.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i28.LearningMaterialsListCubit>(
      () => _i28.LearningMaterialsListCubit());
  gh.factory<_i29.MainAnnouncementsListCubit>(
      () => _i29.MainAnnouncementsListCubit());
  gh.factory<_i30.MainEventsListCubit>(() => _i30.MainEventsListCubit());
  gh.factory<_i31.MainPageCubit>(() => _i31.MainPageCubit());
  gh.factory<_i32.NewsBlockCubit>(() => _i32.NewsBlockCubit());
  gh.factoryParam<_i33.NewsCommentsAddNetworkRequest, _i34.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i33.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i35.NewsCommentsCubit>(() => _i35.NewsCommentsCubit());
  gh.factoryParam<_i36.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i36.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i37.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i37.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i38.NewsDetailCubit>(() => _i38.NewsDetailCubit());
  gh.factoryParam<_i39.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i39.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i40.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i40.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i41.NewsListCubit>(() => _i41.NewsListCubit());
  gh.factoryParam<_i42.NewsListNetworkRequest,
          _i7.Pagination<_i43.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i42.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i44.OpenUniversityCubit>(() => _i44.OpenUniversityCubit());
  gh.factory<_i45.PersonnelMovementsCubit>(
      () => _i45.PersonnelMovementsCubit());
  gh.factory<_i46.ProfileCubit>(() => _i46.ProfileCubit());
  gh.factoryParam<_i47.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i47.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i48.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i48.ProfileThankNetworkRequest(id: id));
  gh.factoryParam<_i49.ScrollBottomLoadMoreCubit,
          _i50.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i49.ScrollBottomLoadMoreCubit(initialState));
  gh.factoryParam<_i51.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i51.SearchNetworkRequest(query: query));
  gh.factory<_i52.SelectfieldCubit>(() => _i52.SelectfieldCubit());
  gh.factoryParam<_i53.SendFeedbackFormNetworkRequest,
          _i54.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i53.SendFeedbackFormNetworkRequest(entities: entities));
  gh.factoryParam<_i55.SendMedicalInsFormNetworkRequest,
          _i56.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i55.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.factoryParam<_i57.SendReferenceFormNetworkRequest,
          _i58.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i57.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i59.BirthdaysNetworkRequest>(_i59.BirthdaysNetworkRequest());
  gh.singleton<_i60.BootCubit>(_i60.BootCubit());
  gh.singleton<_i61.CanInquireNetworkRequest>(_i61.CanInquireNetworkRequest());
  gh.singleton<_i62.ChatDatabase>(_i62.ChatDatabase());
  gh.singleton<_i63.ChatDatabaseCubit>(_i63.ChatDatabaseCubit());
  gh.singleton<_i64.GetAutofillNetworkRequest>(
      _i64.GetAutofillNetworkRequest());
  gh.singleton<_i65.MainApiProvider>(_i65.MainApiProvider());
  gh.singleton<_i66.NatsProvider>(_i66.NatsProvider());
  gh.singleton<_i67.NewBottomNavBarCubit>(_i67.NewBottomNavBarCubit());
  gh.singleton<_i68.ReferencesPageCubit>(_i68.ReferencesPageCubit());
  gh.singleton<_i69.SearchCubit>(_i69.SearchCubit());
  gh.singleton<_i70.SendManagementFormCubit>(_i70.SendManagementFormCubit());
  gh.singleton<_i71.SendMedicalInsFormCubit>(_i71.SendMedicalInsFormCubit());
  gh.singleton<_i72.SendReferenceFormCubit>(_i72.SendReferenceFormCubit());
  gh.singleton<_i73.StaffMovementsNetworkRequest>(
      _i73.StaffMovementsNetworkRequest());
  gh.singleton<_i74.TagsListCubit>(_i74.TagsListCubit());
  gh.singleton<_i75.TagsListNetworkRequest>(_i75.TagsListNetworkRequest());
  gh.singleton<_i76.AuthHandler>(_i76.AuthHandler(get<_i60.BootCubit>()));
  return get;
}
