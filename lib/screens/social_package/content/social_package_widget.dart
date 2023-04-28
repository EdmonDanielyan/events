import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/get_page/get_page_cubit.dart';
import 'package:ink_mobile/cubit/get_page/get_page_state.dart';

class SocialPackageWidget extends StatefulWidget {
  final Widget errorWidget;

  SocialPackageWidget({
    this.errorWidget = const SizedBox.shrink(),
  });
  @override
  State<SocialPackageWidget> createState() => _SocialPackageWidgetState();
}

class _SocialPackageWidgetState extends State<SocialPackageWidget> {
  final _getPageCubit = GetPageCubit();
  String _id = "";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map?;
    String? _appBarTitle;
    if (args != null && args.isNotEmpty) {
      _id = args["id"];
      _appBarTitle = args["app_bar_title"];
    }
    return Scaffold(
      appBar: InkAppBarWithText(context, title: _appBarTitle ?? ""),
      body: BlocBuilder<GetPageCubit, GetPageCubitState>(
        bloc: _getPageCubit,
          builder: (context, state) {
            switch (state.type) {
              case GetPageCubitStateEnums.LOADING:
                _getPageCubit.fetch(_id);
                return Center(child: InkPageLoader());
              case GetPageCubitStateEnums.SUCCESS:
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
                  child: SingleChildScrollView(child: CustomHtml(data: state.data?.detail,), ),
                );
              case GetPageCubitStateEnums.ERROR:
                return widget.errorWidget;
            }
          }
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
