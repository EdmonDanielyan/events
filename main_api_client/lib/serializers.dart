//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:main_api_client/model/add_event_member.dart';
import 'package:main_api_client/model/already_event_member.dart';
import 'package:main_api_client/model/already_thanked.dart';
import 'package:main_api_client/model/announcement_property.dart';
import 'package:main_api_client/model/announcements_not_found.dart';
import 'package:main_api_client/model/announcements_property.dart';
import 'package:main_api_client/model/auth_params.dart';
import 'package:main_api_client/model/auth_success.dart';
import 'package:main_api_client/model/auto_fill_form.dart';
import 'package:main_api_client/model/bad_auth_params.dart';
import 'package:main_api_client/model/bad_id.dart';
import 'package:main_api_client/model/bad_request.dart';
import 'package:main_api_client/model/birthdays_not_found.dart';
import 'package:main_api_client/model/birthdays_success.dart';
import 'package:main_api_client/model/birthdays_success_data.dart';
import 'package:main_api_client/model/can_inquire.dart';
import 'package:main_api_client/model/comment.dart';
import 'package:main_api_client/model/comment_like_success.dart';
import 'package:main_api_client/model/comment_parent.dart';
import 'package:main_api_client/model/comments_not_found.dart';
import 'package:main_api_client/model/contacts_not_found.dart';
import 'package:main_api_client/model/contacts_property.dart';
import 'package:main_api_client/model/empty_search.dart';
import 'package:main_api_client/model/event_property.dart';
import 'package:main_api_client/model/events_not_found.dart';
import 'package:main_api_client/model/events_property.dart';
import 'package:main_api_client/model/feedback_form.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';
import 'package:main_api_client/model/forbidden.dart';
import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:main_api_client/model/get_announcements.dart';
import 'package:main_api_client/model/get_comments_by_id.dart';
import 'package:main_api_client/model/get_contacts.dart';
import 'package:main_api_client/model/get_event_by_id.dart';
import 'package:main_api_client/model/get_events.dart';
import 'package:main_api_client/model/get_keys_success.dart';
import 'package:main_api_client/model/get_news.dart';
import 'package:main_api_client/model/get_news_by_id.dart';
import 'package:main_api_client/model/get_pub_key_success.dart';
import 'package:main_api_client/model/get_publications.dart';
import 'package:main_api_client/model/get_reference_order_form.dart';
import 'package:main_api_client/model/get_search_success.dart';
import 'package:main_api_client/model/get_transport_order_form.dart';
import 'package:main_api_client/model/get_user_fail.dart';
import 'package:main_api_client/model/get_user_success.dart';
import 'package:main_api_client/model/get_users.dart';
import 'package:main_api_client/model/get_users_success.dart';
import 'package:main_api_client/model/logout_params.dart';
import 'package:main_api_client/model/movements_fail.dart';
import 'package:main_api_client/model/movements_object.dart';
import 'package:main_api_client/model/movements_success.dart';
import 'package:main_api_client/model/news_like_success.dart';
import 'package:main_api_client/model/news_not_found.dart';
import 'package:main_api_client/model/news_property.dart';
import 'package:main_api_client/model/news_property_by_id.dart';
import 'package:main_api_client/model/not_found.dart';
import 'package:main_api_client/model/order_dms.dart';
import 'package:main_api_client/model/order_dms_fail.dart';
import 'package:main_api_client/model/order_dms_success.dart';
import 'package:main_api_client/model/order_reference_fail.dart';
import 'package:main_api_client/model/order_reference_success.dart';
import 'package:main_api_client/model/order_transport_fail.dart';
import 'package:main_api_client/model/order_transport_success.dart';
import 'package:main_api_client/model/post_comment.dart';
import 'package:main_api_client/model/post_comment_params_fail.dart';
import 'package:main_api_client/model/post_comment_success.dart';
import 'package:main_api_client/model/publications_property.dart';
import 'package:main_api_client/model/questions_list.dart';
import 'package:main_api_client/model/questions_list_data.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';
import 'package:main_api_client/model/refresh_token_params.dart';
import 'package:main_api_client/model/register_confirm_params.dart';
import 'package:main_api_client/model/register_confirm_success.dart';
import 'package:main_api_client/model/register_params.dart';
import 'package:main_api_client/model/register_success.dart';
import 'package:main_api_client/model/required_error.dart';
import 'package:main_api_client/model/required_success.dart';
import 'package:main_api_client/model/send_feedback_fail.dart';
import 'package:main_api_client/model/send_feedback_success.dart';
import 'package:main_api_client/model/server_error.dart';
import 'package:main_api_client/model/thank_by_id.dart';
import 'package:main_api_client/model/thank_self.dart';
import 'package:main_api_client/model/transport_form.dart';
import 'package:main_api_client/model/user_not_found.dart';
import 'package:main_api_client/model/user_properties.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AddEventMember,
  AlreadyEventMember,
  AlreadyThanked,
  AnnouncementProperty,
  AnnouncementsNotFound,
  AnnouncementsProperty,
  AuthParams,
  AuthSuccess,
  AutoFillForm,
  BadAuthParams,
  BadId,
  BadRequest,
  BirthdaysNotFound,
  BirthdaysSuccess,
  BirthdaysSuccessData,
  CanInquire,
  Comment,
  CommentLikeSuccess,
  CommentParent,
  CommentsNotFound,
  ContactsNotFound,
  ContactsProperty,
  EmptySearch,
  EventProperty,
  EventsNotFound,
  EventsProperty,
  FeedbackForm,
  FeedbackTagsList,
  Forbidden,
  GetAnnouncementById,
  GetAnnouncements,
  GetCommentsById,
  GetContacts,
  GetEventById,
  GetEvents,
  GetKeysSuccess,
  GetNews,
  GetNewsById,
  GetPubKeySuccess,
  GetPublications,
  GetReferenceOrderForm,
  GetSearchSuccess,
  GetTransportOrderForm,
  GetUserFail,
  GetUserSuccess,
  GetUsers,
  GetUsersSuccess,
  LogoutParams,
  MovementsFail,
  MovementsObject,
  MovementsSuccess,
  NewsLikeSuccess,
  NewsNotFound,
  NewsProperty,
  NewsPropertyById,
  NotFound,
  OrderDMS,
  OrderDMSFail,
  OrderDMSSuccess,
  OrderReferenceFail,
  OrderReferenceSuccess,
  OrderTransportFail,
  OrderTransportSuccess,
  PostComment,
  PostCommentParamsFail,
  PostCommentSuccess,
  PublicationsProperty,
  QuestionsList,
  QuestionsListData,
  ReferenceAutoFill,
  RefreshTokenParams,
  RegisterConfirmParams,
  RegisterConfirmSuccess,
  RegisterParams,
  RegisterSuccess,
  RequiredError,
  RequiredSuccess,
  SendFeedbackFail,
  SendFeedbackSuccess,
  ServerError,
  ThankById,
  ThankSelf,
  TransportForm,
  UserNotFound,
  UserProperties,
])
Serializers serializers =
    (_$serializers.toBuilder()..add(Iso8601DateTimeSerializer())).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
