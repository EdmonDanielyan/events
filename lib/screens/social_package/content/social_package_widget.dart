import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/get_page/get_page_cubit.dart';
import 'package:ink_mobile/cubit/get_page/get_page_state.dart';
import 'package:openapi/openapi.dart';

//TODO migration
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
  String data = '';
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

                if (state.data?.oneOf.value is TextPage) {
                  TextPage textPage = state.data?.oneOf.value as TextPage;
                  data = textPage.detail;
                }
                // if (state.data?.oneOf.value is WebViewPage) {
                //   WebViewPage webViewPage =
                //       state.data?.oneOf.value as WebViewPage;
                //   String data = webViewPage.;
                // }

                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 32.0),
                  child: SingleChildScrollView(
                    child: CustomHtml(
                      data: data,
                    ),
                  ),
                );
              case GetPageCubitStateEnums.ERROR:
                return widget.errorWidget;
            }
          }),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}

