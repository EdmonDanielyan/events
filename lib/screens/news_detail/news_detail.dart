import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/screens/news_detail/components/body.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsDetailCubit>(
        create: (BuildContext context) => NewsDetailCubit(),
        child: Scaffold(
            body: Body(),
        )
    );
  }
}
