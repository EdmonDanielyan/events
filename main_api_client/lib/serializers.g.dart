// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AddEventMember.serializer)
      ..add(AlreadyEventMember.serializer)
      ..add(AlreadyThanked.serializer)
      ..add(AnnouncementProperty.serializer)
      ..add(AnnouncementsNotFound.serializer)
      ..add(AnnouncementsProperty.serializer)
      ..add(AuthParams.serializer)
      ..add(AuthSuccess.serializer)
      ..add(AutoFillForm.serializer)
      ..add(BadAuthParams.serializer)
      ..add(BadId.serializer)
      ..add(BadRequest.serializer)
      ..add(BirthdaysNotFound.serializer)
      ..add(BirthdaysSuccess.serializer)
      ..add(BirthdaysSuccessData.serializer)
      ..add(CanInquire.serializer)
      ..add(Comment.serializer)
      ..add(CommentLikeSuccess.serializer)
      ..add(CommentParent.serializer)
      ..add(CommentsNotFound.serializer)
      ..add(ContactsNotFound.serializer)
      ..add(ContactsProperty.serializer)
      ..add(EmptySearch.serializer)
      ..add(EventProperty.serializer)
      ..add(EventsNotFound.serializer)
      ..add(EventsProperty.serializer)
      ..add(FeedbackForm.serializer)
      ..add(FeedbackTagsList.serializer)
      ..add(Forbidden.serializer)
      ..add(GetAnnouncementById.serializer)
      ..add(GetAnnouncements.serializer)
      ..add(GetCommentsById.serializer)
      ..add(GetContacts.serializer)
      ..add(GetEventById.serializer)
      ..add(GetEvents.serializer)
      ..add(GetKeysSuccess.serializer)
      ..add(GetNews.serializer)
      ..add(GetNewsById.serializer)
      ..add(GetPubKeySuccess.serializer)
      ..add(GetPublications.serializer)
      ..add(GetReferenceOrderForm.serializer)
      ..add(GetSearchSuccess.serializer)
      ..add(GetTransportOrderForm.serializer)
      ..add(GetUserFail.serializer)
      ..add(GetUserSuccess.serializer)
      ..add(GetUsers.serializer)
      ..add(GetUsersSuccess.serializer)
      ..add(GlobalSettings.serializer)
      ..add(GlobalSettingsResponseBody.serializer)
      ..add(GlobalSettingsResponseBodyAllOf.serializer)
      ..add(ListPageResponseData.serializer)
      ..add(ListPageSuccessResponseBody.serializer)
      ..add(ListPageSuccessResponseBodyAllOf.serializer)
      ..add(ListSectionResponseData.serializer)
      ..add(ListSectionSuccessResponseBody.serializer)
      ..add(ListSectionSuccessResponseBodyAllOf.serializer)
      ..add(ListSnippetSuccessResponseBody.serializer)
      ..add(ListSnippetSuccessResponseBodyAllOf.serializer)
      ..add(LogoutParams.serializer)
      ..add(MovementsFail.serializer)
      ..add(MovementsObject.serializer)
      ..add(MovementsSuccess.serializer)
      ..add(NewsLikeSuccess.serializer)
      ..add(NewsNotFound.serializer)
      ..add(NewsProperty.serializer)
      ..add(NewsPropertyById.serializer)
      ..add(NotEventMember.serializer)
      ..add(NotFound.serializer)
      ..add(OrderDMS.serializer)
      ..add(OrderDMSFail.serializer)
      ..add(OrderDMSSuccess.serializer)
      ..add(OrderReferenceFail.serializer)
      ..add(OrderReferenceSuccess.serializer)
      ..add(OrderTransportFail.serializer)
      ..add(OrderTransportSuccess.serializer)
      ..add(Page.serializer)
      ..add(PageSection.serializer)
      ..add(PostComment.serializer)
      ..add(PostCommentParamsFail.serializer)
      ..add(PostCommentSuccess.serializer)
      ..add(PublicationsProperty.serializer)
      ..add(QuestionsList.serializer)
      ..add(QuestionsListData.serializer)
      ..add(ReferenceAutoFill.serializer)
      ..add(RefreshTokenParams.serializer)
      ..add(RegisterConfirmParams.serializer)
      ..add(RegisterConfirmSuccess.serializer)
      ..add(RegisterParams.serializer)
      ..add(RegisterSuccess.serializer)
      ..add(RemoveEventMember.serializer)
      ..add(RequiredError.serializer)
      ..add(RequiredSuccess.serializer)
      ..add(SendFeedbackFail.serializer)
      ..add(SendFeedbackSuccess.serializer)
      ..add(ServerError.serializer)
      ..add(SinglePageResponseData.serializer)
      ..add(SinglePageSuccessResponseBody.serializer)
      ..add(SinglePageSuccessResponseBodyAllOf.serializer)
      ..add(SingleSectionResponseData.serializer)
      ..add(SingleSectionSuccessResponseBody.serializer)
      ..add(SingleSectionSuccessResponseBodyAllOf.serializer)
      ..add(Snippet.serializer)
      ..add(SnippetListResponseData.serializer)
      ..add(SnippetTypeEnum.serializer)
      ..add(TextPage.serializer)
      ..add(ThankById.serializer)
      ..add(ThankSelf.serializer)
      ..add(TransportForm.serializer)
      ..add(UserNotFound.serializer)
      ..add(UserProperties.serializer)
      ..add(WebViewPage.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Comment)]),
          () => new ListBuilder<Comment>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CommentParent)]),
          () => new ListBuilder<CommentParent>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(FeedbackForm)]),
          () => new ListBuilder<FeedbackForm>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(JsonObject)]),
          () => new ListBuilder<JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(MovementsObject)]),
          () => new ListBuilder<MovementsObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Page)]),
          () => new ListBuilder<Page>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Page)]),
          () => new ListBuilder<Page>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PageSection)]),
          () => new ListBuilder<PageSection>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(QuestionsListData)]),
          () => new ListBuilder<QuestionsListData>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Snippet)]),
          () => new ListBuilder<Snippet>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TransportForm)]),
          () => new ListBuilder<TransportForm>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserProperties)]),
          () => new ListBuilder<UserProperties>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserProperties)]),
          () => new ListBuilder<UserProperties>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
