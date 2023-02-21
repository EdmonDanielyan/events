import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/html.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/get_page/get_page_cubit.dart';
import 'package:ink_mobile/cubit/get_page/get_page_state.dart';

class SocialPackageWidget extends StatefulWidget {
  final String appBarTitle;
  final Widget errorWidget;

  SocialPackageWidget({
    this.appBarTitle = "",
    this.errorWidget = const SizedBox.shrink(),
  });
  @override
  State<SocialPackageWidget> createState() => _SocialPackageWidgetState();
}

class _SocialPackageWidgetState extends State<SocialPackageWidget> {
  final _getPageCubit = GetPageCubit();
  String _code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBarWithText(context, title: widget.appBarTitle),
      body: SingleChildScrollView(
        child: BlocBuilder<GetPageCubit, GetPageCubitState>(
          bloc: _getPageCubit,
            builder: (context, state) {
              final args = ModalRoute.of(context)!.settings.arguments as Map?;
              if (args != null && args.isNotEmpty) {
                _code = args["code"];
              }
              switch (state.type) {
                case GetPageCubitStateEnums.LOADING:
                  _getPageCubit.fetch(_code);
                  return Center(
                    child: InkPageLoader(),
                  );
                case GetPageCubitStateEnums.SUCCESS:
                  return CustomHtml(data: state.data?.detail,);
                case GetPageCubitStateEnums.ERROR:
                  return widget.errorWidget;
              }
            }
        ),
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
