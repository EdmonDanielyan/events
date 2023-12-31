import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/centring_widget.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/news_list/components/news_list_element.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OpenUniversityLiteracyList extends StatelessWidget {
  final NewsListCubit cubit;
  static late AppLocalizations _strings;

  final ScrollController controller;

  const OpenUniversityLiteracyList({
    Key? key,
    required this.controller,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    controller.addListener(_onScroll);

    return RefreshIndicator(
      onRefresh: () async {
        cubit.refresh();
      },
      color: Colors.green,
      displacement: 20,
      child: BlocBuilder<NewsListCubit, NewsListState>(
        bloc: cubit,
        builder: (context, state) {
          cubit.filter = 'literacy';

          switch (state.type) {
            case NewsListStateType.LOADING:
              {
                cubit.fetch();
                return _getLoadingStateWidget();
              }

            case NewsListStateType.LOADED:
              {
                List<NewsItemData> newsList = state.data!;

                return _getLoadedStateWidget(newsList, context);
              }

            case NewsListStateType.ERROR:
              {
                return _getErrorStateWidget(context, state);
              }
          }
        },
      ),
    );
  }

  Future<void> _onScroll() async {
    await cubit.onScroll(controller);
  }

  List<Widget> _getNewsWidgetList(List<NewsItemData> newsList) {
    List<Widget> _newsWidgetList = [];

    for (var value in newsList) {
      _newsWidgetList.add(NewsListElement(newsItem: value));
    }

    return _newsWidgetList;
  }

  Widget _getLoadingStateWidget() {
    return const CentringWrapper(child: InkPageLoader());
  }

  Widget _getLoadedStateWidget(
      List<NewsItemData> newsList, BuildContext context) {
    return Container(
      color: const Color(0xfff9f9f9),
      child: Column(children: [
        Container(
            // color: Colors.white,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 20),
            child: Row(
              children: [
                Text(_strings.inkLiteracy,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig(context, 24.0)
                            .getProportionateScreenHeight)),
              ],
            )),
        Column(children: _getNewsWidgetList(newsList))
      ]),
    );
  }

  Widget _getErrorStateWidget(BuildContext context, NewsListState state) {
    return CentringWrapper(
        child: ErrorRefreshButton(
      onTap: cubit.refresh,
      text: state.errorMessage!,
    ));
  }
}
