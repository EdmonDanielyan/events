import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_state.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/news_detail/components/content.dart';
import 'package:ink_mobile/screens/news_detail/components/header.dart';
import 'package:ink_mobile/screens/news_detail/components/header_info.dart';
import '../../../extensions/list_news_item_data.dart';

class Body extends StatelessWidget {
  final NewsDetailCubit newsDetailCubit;
  final NewsBlockCubit newsBlockCubit;
  final NewsListCubit newsListCubit;
  const Body(
      {Key? key,
      required this.newsDetailCubit,
      required this.newsBlockCubit,
      required this.newsListCubit})
      : super(key: key);

  Future<void> _onLike(NewsItemData item) async {
    final newItem = item.isLiked != null && item.isLiked!
        ? item.copyWith(isLiked: false, likeCount: (item.likeCount ?? 1) - 1)
        : item.copyWith(isLiked: true, likeCount: (item.likeCount ?? 0) + 1);
    newsBlockCubit.updateItem(newItem);
    newsListCubit.updateItem(newItem);
    await newsDetailCubit.like(item.id ?? 0);
  }

  void _updateWatchedCounter(NewsItemData item) {
    final itemFromList = newsListCubit.getItem(item);
    final itemFromBlock = newsBlockCubit.getItem(item);

    if (itemFromList != null) {
      newsListCubit.updateItem(
          itemFromList.copyWith(viewCount: (itemFromList.viewCount ?? -1) + 1));
    }

    if (itemFromBlock != null) {
      newsBlockCubit.updateItem(itemFromBlock.copyWith(
          viewCount: (itemFromBlock.viewCount ?? -1) + 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<NewsDetailCubit, NewsDetailState>(
        bloc: newsDetailCubit,
        builder: (context, state) {
          switch (state.type) {
            case NewsDetailStateType.LOADING:
              {
                var arg = ModalRoute.of(context)!.settings.arguments as Map;
                var newsId;
                if (arg.isNotEmpty) {
                  newsId = arg['id'];
                }
                newsDetailCubit.load(newsId);
                return Center(
                  child: InkPageLoader(),
                );
              }

            case NewsDetailStateType.LOADED:
              {
                NewsItemData newsItem = state.data!;

                _updateWatchedCounter(newsItem);

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Header(
                        imageLinks: newsItem.detailPictureLinks,
                        videoLinks: newsItem.videoLinks,
                      ),
                      HeaderInfo(
                        viewCount: newsItem.viewCount ?? 0,
                        dateCreate: newsItem.dateCreate,
                      ),
                      Container(
                        width: size.width,
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 24.0),
                        child: Text(
                          newsItem.title ?? '',
                          style: FontStyles.rubikH3(color: Palette.textBlack),
                        ),
                      ),
                      BlocBuilder<NewsBlockCubit, NewsBlockState>(
                        bloc: newsBlockCubit,
                        builder: (context, state) {
                          final getElementFromList =
                              state.data.getItem(newsItem.id ?? 0);
                          return Content(
                            onLike: () =>
                                _onLike(getElementFromList ?? newsItem),
                            id: newsItem.id ?? 0,
                            viewCount: newsItem.viewCount ?? 0,
                            commentsCount: getElementFromList != null
                                ? getElementFromList.commentCount ?? 0
                                : newsItem.commentCount ?? 0,
                            likeCount: getElementFromList != null
                                ? getElementFromList.likeCount ?? 0
                                : (newsItem.likeCount ?? 0),
                            text: newsItem.detailText ?? '',
                            isLiked: getElementFromList != null
                                ? getElementFromList.isLiked ?? false
                                : newsItem.isLiked ?? false,
                            cubit: newsDetailCubit,
                          );
                        },
                      ),
                    ],
                  ),
                );
              }

            case NewsDetailStateType.ERROR:
              {
                return ErrorRefreshButton(onTap: _refreshPage);
              }
          }
        });
  }

  void _refreshPage() {
    newsDetailCubit.refresh();
  }
}
