// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart'
    as _i68;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_cubit.dart'
    as _i47;
import 'core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart'
    as _i48;
import 'core/cubit/selectable/selectable_cubit.dart' as _i50;
import 'core/cubit/selectfield/selectfield_cubit.dart' as _i51;
import 'core/handlers/AuthHandler.dart' as _i77;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i58;
import 'cubit/boot/boot_cubit.dart' as _i59;
import 'cubit/chat/chat_cubit.dart' as _i61;
import 'cubit/chat_db/chat_table_cubit.dart' as _i63;
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i64;
import 'cubit/chat_person_list/sources/network.dart' as _i12;
import 'cubit/events_detail/events_detail_cubit.dart' as _i13;
import 'cubit/events_detail/sources/fetch/network.dart' as _i16;
import 'cubit/events_detail/sources/invite/network.dart' as _i14;
import 'cubit/events_list/events_list_cubit.dart' as _i17;
import 'cubit/events_list/sources/network.dart' as _i18;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i20;
import 'cubit/feedback_answer_list/sources/network.dart' as _i21;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i26;
import 'cubit/learning_materials_list/sources/network.dart' as _i24;
import 'cubit/main_page/announcements_list_cubit.dart' as _i27;
import 'cubit/main_page/events_and_announcements_block_cubit.dart' as _i15;
import 'cubit/main_page/events_list_cubit.dart' as _i28;
import 'cubit/main_page/main_cubit.dart' as _i29;
import 'cubit/main_page/news_block_cubit.dart' as _i30;
import 'cubit/news_comments/news_comments_cubit.dart' as _i33;
import 'cubit/news_comments/sources/comment/network.dart' as _i31;
import 'cubit/news_comments/sources/fetch/network.dart' as _i34;
import 'cubit/news_comments/sources/like/network.dart' as _i35;
import 'cubit/news_detail/news_detail_cubit.dart' as _i36;
import 'cubit/news_detail/sources/fetch/network.dart' as _i37;
import 'cubit/news_detail/sources/like/network.dart' as _i38;
import 'cubit/news_list/news_list_cubit.dart' as _i39;
import 'cubit/news_list/sources/network.dart' as _i40;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i43;
import 'cubit/personnel_movements/sources/network.dart' as _i74;
import 'cubit/profile/profile_cubit.dart' as _i44;
import 'cubit/profile/sources/fetch/network.dart' as _i45;
import 'cubit/profile/sources/thank/network.dart' as _i46;
import 'cubit/references/references_cubit.dart' as _i69;
import 'cubit/references/sources/check_permission/network.dart' as _i60;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i65;
import 'cubit/search/search_cubit.dart' as _i70;
import 'cubit/search/sources/network.dart' as _i49;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i71;
import 'cubit/send_feedback_form/sources/network.dart' as _i52;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i72;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i54;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i73;
import 'cubit/send_reference_form/sources/network.dart' as _i56;
import 'cubit/tags_list/sources/network.dart' as _i76;
import 'cubit/tags_list/tags_list_cubit.dart' as _i75;
import 'models/announcement_data.dart' as _i8;
import 'models/chat/database/chat_db.dart' as _i62;
import 'models/event_data.dart' as _i19;
import 'models/feedback/management_answer.dart' as _i22;
import 'models/learning_materials_data.dart' as _i25;
import 'models/new_comment_entities.dart' as _i32;
import 'models/news_data.dart' as _i41;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i57;
import 'providers/main_api.dart' as _i66;
import 'providers/nats_provider.dart' as _i67;
import 'screens/feedback/components/form/entities.dart' as _i53;
import 'screens/initial/cubit/initial_cubit.dart' as _i23;
import 'screens/medical_insurance/components/form/entities.dart' as _i55;
import 'screens/open_university/cubit/open_university_cubit.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
  gh.factoryParam<_i12.ContactsNetworkRequest, String?, dynamic>(
      (query, _) => _i12.ContactsNetworkRequest(query: query));
  gh.factory<_i13.EventDetailCubit>(() => _i13.EventDetailCubit());
  gh.factoryParam<_i14.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i14.EventInviteNetworkRequest(eventId: eventId));
  gh.factory<_i15.EventsAndAnnouncementsBlockCubit>(
      () => _i15.EventsAndAnnouncementsBlockCubit());
  gh.factoryParam<_i16.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i16.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i17.EventsListCubit>(() => _i17.EventsListCubit());
  gh.factoryParam<_i18.EventsListNetworkRequest,
          _i7.Pagination<_i19.EventData>?, dynamic>(
      (pagination, _) => _i18.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i20.FeedbackAnswerListCubit>(
      () => _i20.FeedbackAnswerListCubit());
  gh.factoryParam<_i21.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i22.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i21.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.factory<_i23.InitialCubit>(() => _i23.InitialCubit());
  gh.factoryParam<_i24.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i25.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i24.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i26.LearningMaterialsListCubit>(
      () => _i26.LearningMaterialsListCubit());
  gh.factory<_i27.MainAnnouncementsListCubit>(
      () => _i27.MainAnnouncementsListCubit());
  gh.factory<_i28.MainEventsListCubit>(() => _i28.MainEventsListCubit());
  gh.factory<_i29.MainPageCubit>(() => _i29.MainPageCubit());
  gh.factory<_i30.NewsBlockCubit>(() => _i30.NewsBlockCubit());
  gh.factoryParam<_i31.NewsCommentsAddNetworkRequest, _i32.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i31.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i33.NewsCommentsCubit>(() => _i33.NewsCommentsCubit());
  gh.factoryParam<_i34.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i34.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i35.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i35.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i36.NewsDetailCubit>(() => _i36.NewsDetailCubit());
  gh.factoryParam<_i37.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i37.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i38.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i38.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i39.NewsListCubit>(() => _i39.NewsListCubit());
  gh.factoryParam<_i40.NewsListNetworkRequest,
          _i7.Pagination<_i41.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i40.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i42.OpenUniversityCubit>(() => _i42.OpenUniversityCubit());
  gh.factory<_i43.PersonnelMovementsCubit>(
      () => _i43.PersonnelMovementsCubit());
  gh.factory<_i44.ProfileCubit>(() => _i44.ProfileCubit());
  gh.factoryParam<_i45.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i45.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i46.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i46.ProfileThankNetworkRequest(id: id));
  gh.factoryParam<_i47.ScrollBottomLoadMoreCubit,
          _i48.ScrollBottomLoadMoreState?, dynamic>(
      (initialState, _) => _i47.ScrollBottomLoadMoreCubit(initialState));
  gh.factoryParam<_i49.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i49.SearchNetworkRequest(query: query));
  gh.factory<_i50.SelectableCubit<dynamic>>(
      () => _i50.SelectableCubit<dynamic>());
  gh.factory<_i51.SelectfieldCubit>(() => _i51.SelectfieldCubit());
  gh.factoryParam<_i52.SendFeedbackFormNetworkRequest,
          _i53.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i52.SendFeedbackFormNetworkRequest(entities: entities));
  gh.factoryParam<_i54.SendMedicalInsFormNetworkRequest,
          _i55.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i54.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.factoryParam<_i56.SendReferenceFormNetworkRequest,
          _i57.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i56.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i58.BirthdaysNetworkRequest>(_i58.BirthdaysNetworkRequest());
  gh.singleton<_i59.BootCubit>(_i59.BootCubit());
  gh.singleton<_i60.CanInquireNetworkRequest>(_i60.CanInquireNetworkRequest());
  gh.singleton<_i61.ChatCubit>(_i61.ChatCubit());
  gh.singleton<_i62.ChatDatabase>(_i62.ChatDatabase());
  gh.singleton<_i63.ChatDatabaseCubit>(_i63.ChatDatabaseCubit());
  gh.singleton<_i64.ChatPersonListCubit>(_i64.ChatPersonListCubit());
  gh.singleton<_i65.GetAutofillNetworkRequest>(
      _i65.GetAutofillNetworkRequest());
  gh.singleton<_i66.MainApiProvider>(_i66.MainApiProvider());
  gh.singleton<_i67.NatsProvider>(_i67.NatsProvider());
  gh.singleton<_i68.NewBottomNavBarCubit>(_i68.NewBottomNavBarCubit());
  gh.singleton<_i69.ReferencesPageCubit>(_i69.ReferencesPageCubit());
  gh.singleton<_i70.SearchCubit>(_i70.SearchCubit());
  gh.singleton<_i71.SendManagementFormCubit>(_i71.SendManagementFormCubit());
  gh.singleton<_i72.SendMedicalInsFormCubit>(_i72.SendMedicalInsFormCubit());
  gh.singleton<_i73.SendReferenceFormCubit>(_i73.SendReferenceFormCubit());
  gh.singleton<_i74.StaffMovementsNetworkRequest>(
      _i74.StaffMovementsNetworkRequest());
  gh.singleton<_i75.TagsListCubit>(_i75.TagsListCubit());
  gh.singleton<_i76.TagsListNetworkRequest>(_i76.TagsListNetworkRequest());
  gh.singleton<_i77.AuthHandler>(_i77.AuthHandler(get<_i59.BootCubit>()));
  return get;
}
