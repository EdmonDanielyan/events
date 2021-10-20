// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/handlers/AuthHandler.dart' as _i68;
import 'cubit/announcements_detail/announcements_detail_cubit.dart' as _i3;
import 'cubit/announcements_detail/sources/network.dart' as _i4;
import 'cubit/announcements_list/announcements_list_cubit.dart' as _i5;
import 'cubit/announcements_list/sources/network.dart' as _i6;
import 'cubit/auth/auth_cubit.dart' as _i9;
import 'cubit/auth/sources/network.dart' as _i10;
import 'cubit/birthdays/birthdays_cubit.dart' as _i11;
import 'cubit/birthdays/sources/network.dart' as _i58;
import 'cubit/boot/boot_cubit.dart' as _i59;
import 'cubit/chat/chat_cubit.dart' as _i12;
import 'cubit/chat_list/chat_list_cubit.dart' as _i13;
import 'cubit/chat_person_list/chat_person_list_cubit.dart' as _i14;
import 'cubit/events_detail/events_detail_cubit.dart' as _i15;
import 'cubit/events_detail/sources/fetch/network.dart' as _i17;
import 'cubit/events_detail/sources/invite/network.dart' as _i16;
import 'cubit/events_list/events_list_cubit.dart' as _i18;
import 'cubit/events_list/sources/network.dart' as _i19;
import 'cubit/feedback_answer_list/answer_list_cubit.dart' as _i21;
import 'cubit/feedback_answer_list/sources/network.dart' as _i22;
import 'cubit/learning_materials_list/learning_materials_list_cubit.dart'
    as _i27;
import 'cubit/learning_materials_list/sources/network.dart' as _i25;
import 'cubit/main_page/announcements_list_cubit.dart' as _i28;
import 'cubit/main_page/events_list_cubit.dart' as _i29;
import 'cubit/main_page/main_cubit.dart' as _i30;
import 'cubit/main_page/news_block_cubit.dart' as _i31;
import 'cubit/news_comments/news_comments_cubit.dart' as _i34;
import 'cubit/news_comments/sources/comment/network.dart' as _i32;
import 'cubit/news_comments/sources/fetch/network.dart' as _i35;
import 'cubit/news_comments/sources/like/network.dart' as _i36;
import 'cubit/news_detail/news_detail_cubit.dart' as _i37;
import 'cubit/news_detail/sources/fetch/network.dart' as _i38;
import 'cubit/news_detail/sources/like/network.dart' as _i39;
import 'cubit/news_list/news_list_cubit.dart' as _i40;
import 'cubit/news_list/sources/network.dart' as _i41;
import 'cubit/personnel_movements/personnel_movements_cubit.dart' as _i43;
import 'cubit/personnel_movements/sources/network.dart' as _i65;
import 'cubit/profile/profile_cubit.dart' as _i44;
import 'cubit/profile/sources/fetch/network.dart' as _i45;
import 'cubit/profile/sources/thank/network.dart' as _i46;
import 'cubit/references/references_cubit.dart' as _i64;
import 'cubit/references/sources/check_permission/network.dart' as _i60;
import 'cubit/references/sources/get_autofill_data/network.dart' as _i61;
import 'cubit/search/search_cubit.dart' as _i47;
import 'cubit/search/sources/network.dart' as _i48;
import 'cubit/send_feedback_form/send_form_cubit.dart' as _i51;
import 'cubit/send_feedback_form/sources/network.dart' as _i49;
import 'cubit/send_medical_ins_form/send_form_cubit.dart' as _i52;
import 'cubit/send_medical_ins_form/sources/network.dart' as _i53;
import 'cubit/send_reference_form/send_form_cubit.dart' as _i55;
import 'cubit/send_reference_form/sources/network.dart' as _i56;
import 'cubit/tags_list/sources/network.dart' as _i67;
import 'cubit/tags_list/tags_list_cubit.dart' as _i66;
import 'models/announcement_data.dart' as _i8;
import 'models/event_data.dart' as _i20;
import 'models/feedback/management_answer.dart' as _i23;
import 'models/learning_materials_data.dart' as _i26;
import 'models/new_comment_entities.dart' as _i33;
import 'models/news_data.dart' as _i42;
import 'models/pagination.dart' as _i7;
import 'models/send_reference_form_entities.dart' as _i57;
import 'providers/main_api.dart' as _i62;
import 'providers/nats_provider.dart' as _i63;
import 'screens/feedback/components/form/entities.dart' as _i50;
import 'screens/initial/cubit/initial_cubit.dart' as _i24;
import 'screens/medical_insurance/components/form/entities.dart'
    as _i54; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i13.ChatListCubit>(() => _i13.ChatListCubit());
  gh.factory<_i14.ChatPersonListCubit>(() => _i14.ChatPersonListCubit());
  gh.factory<_i15.EventDetailCubit>(() => _i15.EventDetailCubit());
  gh.factoryParam<_i16.EventInviteNetworkRequest, int?, dynamic>(
      (eventId, _) => _i16.EventInviteNetworkRequest(eventId: eventId));
  gh.factoryParam<_i17.EventsDetailNetworkRequest, int?, dynamic>(
      (eventId, _) => _i17.EventsDetailNetworkRequest(eventId: eventId));
  gh.factory<_i18.EventsListCubit>(() => _i18.EventsListCubit());
  gh.factoryParam<_i19.EventsListNetworkRequest,
          _i7.Pagination<_i20.EventData>?, dynamic>(
      (pagination, _) => _i19.EventsListNetworkRequest(pagination: pagination));
  gh.factory<_i21.FeedbackAnswerListCubit>(
      () => _i21.FeedbackAnswerListCubit());
  gh.factoryParam<_i22.FeedbackAnswerListNetworkRequest,
          _i7.Pagination<_i23.ManagementAnswer>?, dynamic>(
      (pagination, _) =>
          _i22.FeedbackAnswerListNetworkRequest(pagination: pagination));
  gh.factory<_i24.InitialCubit>(() => _i24.InitialCubit());
  gh.factoryParam<_i25.LearningMaterialListNetworkRequest,
          _i7.Pagination<_i26.LearningMaterialsData>?, dynamic>(
      (pagination, _) =>
          _i25.LearningMaterialListNetworkRequest(pagination: pagination));
  gh.factory<_i27.LearningMaterialsListCubit>(
      () => _i27.LearningMaterialsListCubit());
  gh.factory<_i28.MainAnnouncementsListCubit>(
      () => _i28.MainAnnouncementsListCubit());
  gh.factory<_i29.MainEventsListCubit>(() => _i29.MainEventsListCubit());
  gh.factory<_i30.MainPageCubit>(() => _i30.MainPageCubit());
  gh.factory<_i31.NewsBlockCubit>(() => _i31.NewsBlockCubit());
  gh.factoryParam<_i32.NewsCommentsAddNetworkRequest, _i33.NewCommentEntities?,
          dynamic>(
      (comment, _) => _i32.NewsCommentsAddNetworkRequest(comment: comment));
  gh.factory<_i34.NewsCommentsCubit>(() => _i34.NewsCommentsCubit());
  gh.factoryParam<_i35.NewsCommentsFetchNetworkRequest, int?, dynamic>(
      (newsId, _) => _i35.NewsCommentsFetchNetworkRequest(newsId: newsId));
  gh.factoryParam<_i36.NewsCommentsLikeNetworkRequest, int?, dynamic>(
      (commentId, _) =>
          _i36.NewsCommentsLikeNetworkRequest(commentId: commentId));
  gh.factory<_i37.NewsDetailCubit>(() => _i37.NewsDetailCubit());
  gh.factoryParam<_i38.NewsDetailNetworkRequest, int?, dynamic>(
      (newsId, _) => _i38.NewsDetailNetworkRequest(newsId: newsId));
  gh.factoryParam<_i39.NewsLikeNetworkRequest, int?, dynamic>(
      (newsId, _) => _i39.NewsLikeNetworkRequest(newsId: newsId));
  gh.factory<_i40.NewsListCubit>(() => _i40.NewsListCubit());
  gh.factoryParam<_i41.NewsListNetworkRequest,
          _i7.Pagination<_i42.NewsItemData>?, String?>(
      (pagination, filter) =>
          _i41.NewsListNetworkRequest(pagination: pagination, filter: filter));
  gh.factory<_i43.PersonnelMovementsCubit>(
      () => _i43.PersonnelMovementsCubit());
  gh.factory<_i44.ProfileCubit>(() => _i44.ProfileCubit());
  gh.factoryParam<_i45.ProfileFetchNetworkRequest, int?, dynamic>(
      (id, _) => _i45.ProfileFetchNetworkRequest(id: id));
  gh.factoryParam<_i46.ProfileThankNetworkRequest, int?, dynamic>(
      (id, _) => _i46.ProfileThankNetworkRequest(id: id));
  gh.factory<_i47.SearchCubit>(() => _i47.SearchCubit());
  gh.factoryParam<_i48.SearchNetworkRequest, String?, dynamic>(
      (query, _) => _i48.SearchNetworkRequest(query: query));
  gh.factoryParam<_i49.SendFeedbackFormNetworkRequest,
          _i50.ManagementFeedbackFormEntities?, dynamic>(
      (entities, _) => _i49.SendFeedbackFormNetworkRequest(entities: entities));
  gh.factory<_i51.SendManagementFormCubit>(
      () => _i51.SendManagementFormCubit());
  gh.factory<_i52.SendMedicalInsFormCubit>(
      () => _i52.SendMedicalInsFormCubit());
  gh.factoryParam<_i53.SendMedicalInsFormNetworkRequest,
          _i54.MedicalInsuranceFormEntities?, dynamic>(
      (entities, _) =>
          _i53.SendMedicalInsFormNetworkRequest(entities: entities));
  gh.factory<_i55.SendReferenceFormCubit>(() => _i55.SendReferenceFormCubit());
  gh.factoryParam<_i56.SendReferenceFormNetworkRequest,
          _i57.SendReferenceFormEntities?, dynamic>(
      (entities, _) =>
          _i56.SendReferenceFormNetworkRequest(entities: entities));
  gh.singleton<_i58.BirthdaysNetworkRequest>(_i58.BirthdaysNetworkRequest());
  gh.singleton<_i59.BootCubit>(_i59.BootCubit());
  gh.singleton<_i60.CanInquireNetworkRequest>(_i60.CanInquireNetworkRequest());
  gh.singleton<_i61.GetAutofillNetworkRequest>(
      _i61.GetAutofillNetworkRequest());
  gh.singleton<_i62.MainApiProvider>(_i62.MainApiProvider());
  gh.singleton<_i63.NatsProvider>(_i63.NatsProvider());
  gh.singleton<_i64.ReferencesPageCubit>(_i64.ReferencesPageCubit());
  gh.singleton<_i65.StaffMovementsNetworkRequest>(
      _i65.StaffMovementsNetworkRequest());
  gh.singleton<_i66.TagsListCubit>(_i66.TagsListCubit());
  gh.singleton<_i67.TagsListNetworkRequest>(_i67.TagsListNetworkRequest());
  gh.singleton<_i68.AuthHandler>(_i68.AuthHandler(get<_i59.BootCubit>()));
  return get;
}
