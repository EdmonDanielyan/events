import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/search/search_query.dart';
import 'package:ink_mobile/screens/search/components/background.dart';
import 'package:ink_mobile/screens/search/components/search_container.dart';
import 'package:ink_mobile/screens/search/components/search_field.dart';
import 'package:ink_mobile/screens/search/components/search_item_text.dart';
import 'package:ink_mobile/screens/search/components/search_item_user.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';
import 'package:ink_mobile/cubit/search/search_state.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  static const String NOTHING_FOUND_TEXT = 'Ничего не найдено';
  static const String TYPE_SEARCH_STRING_TEXT =
      'Введите запрос в поисковую строку';
  static const String NEWS_LABEL = 'Новости';
  static const String EVENTS_LABEL = 'События';
  static const String ANNOUNCEMENTS_LABEL = 'Объявления';
  static const String EMPLOYEES_LABEL = 'Сотрудники';

  @override
  Widget build(BuildContext context) {
    final SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);

    return Background(
        child: Column(
          children: [
            SearchField(),

            BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {

              switch (state.type) {
                case SearchStateType.LOADING: {
                  return InkPageLoader();
                }

                case SearchStateType.LOADED: {
                  List<SearchContainer> searchResult = _getSearchResult(state);

                  return Column(children: searchResult);
                }

                case SearchStateType.EMPTY: {
                  return Text(NOTHING_FOUND_TEXT);
                }

                case SearchStateType.STARTING: {
                  return Text(TYPE_SEARCH_STRING_TEXT);
                }

                case SearchStateType.ERROR: {
                  return ErrorRefreshButton(
                      onTap: () {
                        if (SearchQuery.query.length >= 3) {
                          searchCubit.search(SearchQuery.query);
                        } else {
                          searchCubit.refresh();
                        }
                      },
                      text: state.errorMessage!,
                  );
                }
              }
            })
          ],
        )
    );
  }

  List<SearchContainer> _getSearchResult(SearchState state) {
    List<SearchItemUser> users = getUsers(state.users);
    List<SearchItemText> announcements = getAnnouncements(
        state.announcements
    );
    List<SearchItemText> events = getEvents(state.events);
    List<SearchItemText> news = getNews(state.news);

    List<SearchContainer> searchResult = [];

    if (users.length > 0) {
      searchResult.add(SearchContainer(
        label: EMPLOYEES_LABEL,
        items: users,
      ));
    }

    if (announcements.length > 0) {
      searchResult.add(SearchContainer(
        label: ANNOUNCEMENTS_LABEL,
        items: announcements,
      ));
    }

    if (events.length > 0) {
      searchResult.add(SearchContainer(
        label: EVENTS_LABEL,
        items: events,
      ));
    }

    if (news.length > 0) {
      searchResult.add(SearchContainer(
        label: NEWS_LABEL,
        items: news,
      ));
    }

    return searchResult;
  }

  List<SearchItemUser> getUsers(List<UsersSearchData>? usersFromState) {
    List<SearchItemUser> users = [];

    if (usersFromState != null) {
      usersFromState.forEach((user) {
        users.add(SearchItemUser(
          id: user.id,
          fullName: user.fullName,
          avatar: user.avatar,
          query: SearchQuery.query,
          route: '/personal',
        ));
      });
    }

    return users;
  }

  List<SearchItemText> getAnnouncements(
      List<AnnouncementsSearchData>? announcementsFromState
  ) {
    return getTextItemList(
        itemsFromState: announcementsFromState,
        route: '/announcement_detail'
    );
  }

  List<SearchItemText> getEvents(List<EventsSearchData>? eventsFromState) {
    return getTextItemList(
        itemsFromState: eventsFromState,
        route: '/event_detail'
    );
  }

  List<SearchItemText> getNews(List<NewsSearchData>? newsFromState) {
    return getTextItemList(
        itemsFromState: newsFromState,
        route: '/news_detail'
    );
  }

  List<SearchItemText> getTextItemList({
    required List<TextSearchData>? itemsFromState,
    required String route
  }) {

    List<SearchItemText> items = [];

    if (itemsFromState != null) {
      itemsFromState.forEach((item) {
        items.add(SearchItemText(
          id: item.id,
          title: item.title,
          query: SearchQuery.query,
          route: route,
        ));
      });
    }

    return items;
  }
}
