import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/search/search_query.dart';
import 'package:ink_mobile/screens/search/components/background.dart';
import 'package:ink_mobile/screens/search/components/search_container.dart';
import 'package:ink_mobile/components/fields/search_field.dart';
import 'package:ink_mobile/screens/search/components/search_item_text.dart';
import 'package:ink_mobile/screens/search/components/search_item_user.dart';
import 'package:ink_mobile/cubit/search/search_cubit.dart';
import 'package:ink_mobile/cubit/search/search_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Body extends StatelessWidget {
  final SearchCubit searchCubit;
  const Body({Key? key, required this.searchCubit}) : super(key: key);
  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Background(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              top: 24.0,
              bottom: 16.0,
            ),
            child: SearchField(
              hint: _strings.searchHint,
              onChanged: (query) {
                if (query.length >= 3) {
                  SearchQuery.query = query;
                  searchCubit.search(query);
                } else {
                  searchCubit.refresh();
                }
              },
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            bloc: searchCubit,
            builder: (context, state) {
              switch (state.type) {
                case SearchStateType.LOADING:
                  {
                    return InkPageLoader();
                  }

                case SearchStateType.LOADED:
                  {
                    List<SearchContainer> searchResult =
                        _getSearchResult(state);

                    return ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: searchResult.length,
                      itemBuilder: (BuildContext context, int index) =>
                          searchResult[index],
                    );
                  }

                case SearchStateType.EMPTY:
                  {
                    return Text(
                      _strings.nothingFound,
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    );
                  }

                case SearchStateType.STARTING:
                  {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _strings.searchEmptyString,
                        style: FontStyles.rubikP2(color: Palette.textBlack50),
                      ),
                    );
                  }

                case SearchStateType.ERROR:
                  {
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
            },
          ),
        ],
      ),
    );
  }

  List<SearchContainer> _getSearchResult(SearchState state) {
    List<SearchItemUser> users = getUsers(state.users);
    List<SearchItemText> announcements = getAnnouncements(state.announcements);
    List<SearchItemText> events = getEvents(state.events);
    List<SearchItemText> news = getNews(state.news);

    List<SearchContainer> searchResult = [];

    if (users.length > 0) {
      searchResult.add(SearchContainer(
        label: _strings.employees,
        items: users,
      ));
    }

    if (announcements.length > 0) {
      searchResult.add(SearchContainer(
        label: _strings.announcements,
        items: announcements,
      ));
    }

    if (events.length > 0) {
      searchResult.add(SearchContainer(
        label: _strings.events,
        items: events,
      ));
    }

    if (news.length > 0) {
      searchResult.add(SearchContainer(
        label: _strings.news,
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
          user: user,
          query: SearchQuery.query,
        ));
      });
    }

    return users;
  }

  List<SearchItemText> getAnnouncements(
      List<AnnouncementsSearchData>? announcementsFromState) {
    return getTextItemList(
        itemsFromState: announcementsFromState, route: '/announcement_detail');
  }

  List<SearchItemText> getEvents(List<EventsSearchData>? eventsFromState) {
    return getTextItemList(
        itemsFromState: eventsFromState, route: '/event_detail');
  }

  List<SearchItemText> getNews(List<NewsSearchData>? newsFromState) {
    return getTextItemList(
        itemsFromState: newsFromState, route: '/news_detail');
  }

  List<SearchItemText> getTextItemList(
      {required List<TextSearchData>? itemsFromState, required String route}) {
    List<SearchItemText> items = [];

    if (itemsFromState != null) {
      itemsFromState.forEach(
        (item) {
          items.add(
            SearchItemText(
              id: item.id,
              title: item.title,
              query: SearchQuery.query,
              route: route,
              isLastItem: itemsFromState.last == item,
            ),
          );
        },
      );
    }

    return items;
  }
}
