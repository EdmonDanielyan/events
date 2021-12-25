import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_state.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/news_detail/components/content.dart';
import 'package:ink_mobile/screens/news_detail/components/header.dart';
import 'package:ink_mobile/screens/news_detail/components/header_info.dart';

class Body extends StatelessWidget {
  final NewsDetailCubit newsDetailCubit;
  const Body({Key? key, required this.newsDetailCubit}) : super(key: key);

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

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Header(
                            imageLinks: newsItem.detailPictureLinks,
                            videoLinks: newsItem.videoLinks),
                      ),
                      HeaderInfo(
                          viewCount: newsItem.viewCount ?? 0,
                          dateCreate: newsItem.dateCreate),
                      Container(
                          width: size.width,
                          color: Colors.white,
                          padding:
                              EdgeInsets.only(left: 20, right: 50, bottom: 10),
                          child: Text(
                            newsItem.title ?? '',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      Content(
                        id: newsItem.id ?? 0,
                        viewCount: newsItem.viewCount ?? 0,
                        commentsCount: newsItem.commentCount ?? 0,
                        likeCount: newsItem.likeCount ?? 0,
                        text: newsItem.detailText ?? '',
                        isLiked: newsItem.isLiked ?? false,
                        cubit: newsDetailCubit,
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
