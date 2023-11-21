import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/app_metrics_events.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/main_page/video_links_service.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/news_list/components/news_list_element.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/setup.dart';

class Body extends StatefulWidget {
  final NewsListCubit cubit;

  Body({Key? key, required this.cubit}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final mapService = getIt<IVideoLinksService>();
  final ScrollController _controller = ScrollController();
  static late AppLocalizations _strings;

  @override
  void initState() {
    super.initState();
    widget.cubit.pagination.clear();
    widget.cubit.emitState(type: NewsListStateType.LOADING);
    AppMetricsEvents().newsEvent();
  }

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    _controller.addListener(_onScroll);

    return RefreshIndicator(
      onRefresh: () async {
        widget.cubit.refresh();
      },
      color: Palette.greenE4A,
      displacement: 20,
      child: BlocBuilder<NewsListCubit, NewsListState>(
        bloc: widget.cubit,
        builder: (context, state) {
          Map? arg = ModalRoute.of(context)!.settings.arguments as Map?;

          if (arg != null && arg.isNotEmpty) {
            widget.cubit.filter = arg['filter'];
          }

          switch (state.type) {
            case (NewsListStateType.LOADING):
              {
                widget.cubit.fetch();
                return _getLoadingStateWidget();
              }

            case (NewsListStateType.LOADED):
              {
                List<NewsItemData> newsList = state.data!;

                return _getLoadedStateWidget(newsList, widget.cubit.filter);
              }

            case (NewsListStateType.ERROR):
              {
                return _getErrorStateWidget(context, state);
              }
          }
        },
      ),
    );
  }

  Future<void> _onScroll() async {
    await widget.cubit.onScroll(_controller);
  }

  List<Widget> _getNewsWidgetList(List<NewsItemData> newsList) {
    List<Widget> _newsWidgetList = [];

    newsList.forEach((value) {
      _newsWidgetList.add(NewsListElement(newsItem: value));
    });

    return _newsWidgetList;
  }

  Widget _getLoadingStateWidget() {
    return InkPageLoader();
  }

  Widget _getLoadedStateWidget(List<NewsItemData> newsList, String title) {
    List<Widget> items = _getNewsWidgetList(newsList);
    return Container(
      color: Palette.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  titles['$title'] ?? _strings.news,
                  style: FontStyles.rubikH2(color: Palette.textBlack),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(keepScrollOffset: false),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => items[index],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getErrorStateWidget(BuildContext context, NewsListState state) {
    return ErrorRefreshButton(
      onTap: widget.cubit.refresh,
      text: state.errorMessage!,
    );
  }

  static final Map<String, String> titles = {
    'news': _strings.allNews,
    'stable_development': _strings.sustainableDevelopment,
    'safety': _strings.safety,
    'it': _strings.it,
    'volunteer_news': _strings.volunteerNews,
    'information_sport': _strings.sportNews,
    'news-idea': _strings.newsIdea,
  };
}
