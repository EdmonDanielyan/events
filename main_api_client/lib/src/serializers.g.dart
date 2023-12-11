// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add($Comment.serializer)
      ..add($DirectoryMeta.serializer)
      ..add($GlobalSettingsResponseBodyAllOf.serializer)
      ..add($ListPageSuccessResponseBodyAllOf.serializer)
      ..add($ListSectionSuccessResponseBodyAllOf.serializer)
      ..add($ListSnippetSuccessResponseBodyAllOf.serializer)
      ..add($OrganisationDirectoryAllOf.serializer)
      ..add($OrganisationDirectoryResponseBodyAllOf.serializer)
      ..add($RequiredError.serializer)
      ..add($RequiredSuccess.serializer)
      ..add($SinglePageSuccessResponseBodyAllOf.serializer)
      ..add($SingleSectionSuccessResponseBodyAllOf.serializer)
      ..add($UniEventsGetDetailRespBodyAllOf.serializer)
      ..add($UniEventsGetListRespBodyAllOf.serializer)
      ..add($UniSubGetStateRespBodyAllOf.serializer)
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
      ..add(CommentLikeSuccess.serializer)
      ..add(CommentParent.serializer)
      ..add(CommentsNotFound.serializer)
      ..add(ContactsNotFound.serializer)
      ..add(ContactsProperty.serializer)
      ..add(ContactsPropertyAbsenceInner.serializer)
      ..add(DirectoryMetaSelect.serializer)
      ..add(EmptySearch.serializer)
      ..add(EventProperty.serializer)
      ..add(EventsNotFound.serializer)
      ..add(EventsProperty.serializer)
      ..add(FeedbackForm.serializer)
      ..add(FeedbackTagsList.serializer)
      ..add(Forbidden.serializer)
      ..add(GenericError.serializer)
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
      ..add(ListPageResponseData.serializer)
      ..add(ListPageSuccessResponseBody.serializer)
      ..add(ListSectionResponseData.serializer)
      ..add(ListSectionSuccessResponseBody.serializer)
      ..add(ListSnippetSuccessResponseBody.serializer)
      ..add(LogoutParams.serializer)
      ..add(MovementsFail.serializer)
      ..add(MovementsObject.serializer)
      ..add(MovementsSuccess.serializer)
      ..add(NewsLikeSuccess.serializer)
      ..add(NewsNotFound.serializer)
      ..add(NewsProperty.serializer)
      ..add(NewsPropertyById.serializer)
      ..add(NewsTab.serializer)
      ..add(NotEventMember.serializer)
      ..add(NotFound.serializer)
      ..add(NotificationFullList.serializer)
      ..add(NotificationSubState.serializer)
      ..add(OrderDMS.serializer)
      ..add(OrderDMSFail.serializer)
      ..add(OrderDMSSuccess.serializer)
      ..add(OrderReferenceFail.serializer)
      ..add(OrderReferenceSuccess.serializer)
      ..add(OrderTransportFail.serializer)
      ..add(OrderTransportSuccess.serializer)
      ..add(Organisation.serializer)
      ..add(OrganisationDirectory.serializer)
      ..add(OrganisationDirectoryResponseBody.serializer)
      ..add(Page.serializer)
      ..add(PageSection.serializer)
      ..add(PatchComment.serializer)
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
      ..add(SendFeedbackFail.serializer)
      ..add(SendFeedbackSuccess.serializer)
      ..add(ServerError.serializer)
      ..add(SinglePageResponseData.serializer)
      ..add(SinglePageSuccessResponseBody.serializer)
      ..add(SingleSectionResponseData.serializer)
      ..add(SingleSectionSuccessResponseBody.serializer)
      ..add(Snippet.serializer)
      ..add(SnippetListResponseData.serializer)
      ..add(SnippetTypeEnum.serializer)
      ..add(SubscriptionConfig.serializer)
      ..add(SubscriptionConfigChildren.serializer)
      ..add(SubscriptionConfigOptions.serializer)
      ..add(SubscriptionConfigOptionsDisplayModeEnum.serializer)
      ..add(SubscriptionConfigVisitors.serializer)
      ..add(SubscriptionField.serializer)
      ..add(SubscriptionFieldTypeEnum.serializer)
      ..add(SubscriptionOption.serializer)
      ..add(SubscriptionState.serializer)
      ..add(TextPage.serializer)
      ..add(ThankById.serializer)
      ..add(ThankSelf.serializer)
      ..add(TransportForm.serializer)
      ..add(UniEventDetail.serializer)
      ..add(UniEventShort.serializer)
      ..add(UniEventsGetDetailRespBody.serializer)
      ..add(UniEventsGetDetailRespBodyAllOfData.serializer)
      ..add(UniEventsGetListRespBody.serializer)
      ..add(UniEventsGetListRespBodyAllOfData.serializer)
      ..add(UniSubCancelRequest.serializer)
      ..add(UniSubGetStateRespBody.serializer)
      ..add(UniSubRequest.serializer)
      ..add(UniSubRequestField.serializer)
      ..add(UniSubRequestOption.serializer)
      ..add(UniSubRequestVersionEnum.serializer)
      ..add(UniSubRequestVisitor.serializer)
      ..add(UniSubRequestVisitorNew.serializer)
      ..add(UserNotFound.serializer)
      ..add(UserProfileBadge.serializer)
      ..add(UserProperties.serializer)
      ..add(WebViewPage.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Comment)]),
          () => new ListBuilder<Comment>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(CommentParent)]),
          () => new ListBuilder<CommentParent>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ContactsPropertyAbsenceInner)]),
          () => new ListBuilder<ContactsPropertyAbsenceInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Date)]),
          () => new ListBuilder<Date>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Date)]),
          () => new ListBuilder<Date>())
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
          const FullType(BuiltList, const [const FullType(Organisation)]),
          () => new ListBuilder<Organisation>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Organisation)]),
          () => new ListBuilder<Organisation>())
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
          const FullType(BuiltList, const [const FullType(SubscriptionField)]),
          () => new ListBuilder<SubscriptionField>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SubscriptionOption)]),
          () => new ListBuilder<SubscriptionOption>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(TransportForm)]),
          () => new ListBuilder<TransportForm>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UniEventShort)]),
          () => new ListBuilder<UniEventShort>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UniSubRequestField)]),
          () => new ListBuilder<UniSubRequestField>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UniSubRequestOption)]),
          () => new ListBuilder<UniSubRequestOption>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UniSubRequestVisitor)]),
          () => new ListBuilder<UniSubRequestVisitor>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UniSubRequestVisitor)]),
          () => new ListBuilder<UniSubRequestVisitor>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserProfileBadge)]),
          () => new ListBuilder<UserProfileBadge>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserProperties)]),
          () => new ListBuilder<UserProperties>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserProperties)]),
          () => new ListBuilder<UserProperties>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(bool)]),
          () => new ListBuilder<bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(String)]),
          () => new ListBuilder<String?>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType.nullable(String)]),
          () => new ListBuilder<String?>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
