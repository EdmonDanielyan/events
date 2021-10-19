import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/static_slider/static_slider_effect.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_filter_slider.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element_placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsBlock extends StatelessWidget {
  NewsBlock({Key? key}) : super(key: key);
  static late Size size;
  static late NewsBlockCubit newsCubit;

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    size = MediaQuery.of(context).size;
    return BlocProvider<NewsBlockCubit>(
      create: (BuildContext context) => NewsBlockCubit(),
      child: BlocBuilder<NewsBlockCubit, NewsBlockState>(
        builder: (context, state) {
          newsCubit = BlocProvider.of<NewsBlockCubit>(context);

          return Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      _strings.news,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 30.0),
                    ),
                  ],
                ),
                getCurrentStateWidget(context, state)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget getCurrentStateWidget(BuildContext context, NewsBlockState state) {
    switch (state.type) {
      case NewsBlockStateType.LOADED:
        {
          return getLoadedStateWidget(state.data!);
        }

      case NewsBlockStateType.LOADING:
        {
          newsCubit.fetchNews();
          return getLoadingStateWidget();
        }

      case NewsBlockStateType.ERROR:
        {
          final MainPageCubit mainPageCubit =
              BlocProvider.of<MainPageCubit>(context);
          mainPageCubit.emitErrorState();

          return Container();
        }
    }
  }

  Widget getLoadedStateWidget(List<NewsItemData> data) {
    return Container(
      child: Column(
        children: [NewsFilterSlider(), NewsListSlider(newsList: data)],
      ),
    );
  }

  Widget getLoadingStateWidget() {
    final PageController _controllerOne = PageController();

    return Column(
      children: [
        NewsFilterSlider(),
        Container(
          height: 390,
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 334,
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(top: 20.0),
                clipBehavior: Clip.none,
                child: ListView(
                  controller: _controllerOne,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        child: NewsListSliderElementPlaceholder()),
                    Container(child: NewsListSliderElementPlaceholder()),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: SmoothPageIndicator(
                    controller: _controllerOne,
                    count: 5,
                    axisDirection: Axis.horizontal,
                    effect: StaticSliderEffect(
                        activeDotColor: Color(0xff2c4155),
                        rowWidth: 700,
                        dotWidth: size.width * 0.6),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
