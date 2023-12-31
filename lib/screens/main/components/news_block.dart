import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/page_indicator/custom_page_indicator.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_filter_slider.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element_placeholder.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';

import '../../../constants/palette.dart';

class NewsBlock extends StatelessWidget {
  const NewsBlock({Key? key}) : super(key: key);
  static late Size size;
  static late NewsBlockCubit newsCubit;

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    size = MediaQuery.of(context).size;
    newsCubit = MainScreen.of(context).newsBlockCubit;
    return BlocBuilder<NewsBlockCubit, NewsBlockState>(
      bloc: newsCubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  _strings.news,
                  style: FontStyles.rubikH2(color: Palette.textBlack),
                ),
              ),
              const SizedBox(height: 16.0),
              const NewsFilterSlider(),
              const SizedBox(height: 16.0),
              getCurrentStateWidget(context, state),
            ],
          ),
        );
      },
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
          return getLoadingStateWidget(context);
        }

      case NewsBlockStateType.ERROR:
        {
          MainScreen.of(context).mainPageCubit.emitErrorState();

          return const SizedBox.shrink();
        }
    }
  }

  Widget getLoadedStateWidget(List<NewsItemData> data) {
    return NewsListSlider(newsList: data);
  }

  Widget getLoadingStateWidget(BuildContext context) {
    final PageController _controllerOne = PageController(keepPage: false);
    return SizedBox(
      height: SizeConfig(context, 350).getProportionateScreenHeight,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: SizeConfig(context, 290).getProportionateScreenHeight,
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              primary: true,
              child: Row(
                children: [
                  NewsListSliderElementPlaceholder(),
                  SizedBox(width: 30),
                  NewsListSliderElementPlaceholder(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: CustomPageIndicator(
                controller: _controllerOne,
                count: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
