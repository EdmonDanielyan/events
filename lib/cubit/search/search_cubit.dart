import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/cubit/search/search_state.dart';
import 'package:main_api_client/api.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/search_api.dart';
import 'package:main_api_client/model/get_search_success.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState(type: SearchStateType.STARTING));

  Future<void> search(String query) async {
    emit(SearchState(type: SearchStateType.LOADING));
    MainApiClient api = MainApiClient();

    try {
      await Token.setNewTokensIfExpired();

      SearchApi search = api.getSearchApi();
      Response<GetSearchSuccess> response = await search.searchGet(
          query: query
      );

      if (response.data?.data == null) {
        emitState(type: SearchStateType.EMPTY);
      } else {
        Map? data = response.data?.data.asMap;

        List? users = data?['users'];
        List? events = data?['events'];
        List? announcements = data?['announcement'];
        List? news = data?['news'];

        List<UsersSearchData> usersList = [];
        List<EventsSearchData> eventsList = [];
        List<AnnouncementsSearchData> announcementsList = [];
        List<NewsSearchData> newsList = [];

        ImageProvider<Object> avatar;

        users?.forEach((user) {
            if (user['avatar'] != null) {
              avatar = NetworkImage(user['avatar']);
            } else {
              avatar = AssetImage('assets/images/avatars/avatar_default.png');
            }

            usersList.add(
                UsersSearchData(
                  id: user['id'], fullName: user['name'], avatar: avatar
                )
            );
        });

        events?.forEach((event) {
          eventsList.add(EventsSearchData(
              id: event['id'],
              title: event['title']
          ));
        });

        announcements?.forEach((announcement) {
          announcementsList.add(AnnouncementsSearchData(
              id: announcement['id'],
              title: announcement['title']
          ));
        });

        news?.forEach((newsItem) {
          newsList.add(NewsSearchData(
              id: newsItem['id'],
              title: newsItem['title']
          ));
        });

        if (
          newsList.isEmpty &&
          eventsList.isEmpty &&
          announcementsList.isEmpty &&
          newsList.isEmpty &&
          usersList.isEmpty
        ) {
          emitState(type: SearchStateType.EMPTY);
        } else {
          emitState(
              type: SearchStateType.LOADED,
              users: usersList,
              announcements: announcementsList,
              events: eventsList,
              news: newsList
          );
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
            type: SearchStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: SearchStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: SearchStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: SearchStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void emitState({
    required SearchStateType type,
    List<UsersSearchData>? users,
    List<NewsSearchData>? news,
    List<EventsSearchData>? events,
    List<AnnouncementsSearchData>? announcements,
    String? errorMessage
  }) {
    emit(SearchState(
        type: type,
        users: users,
        news: news,
        events: events,
        announcements: announcements,
        errorMessage: errorMessage
    ));
  }

  void refresh() {
    emit(SearchState(type: SearchStateType.STARTING));
  }
}
