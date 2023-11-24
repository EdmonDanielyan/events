import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/cubit/references/references_cubit.dart';
import 'package:ink_mobile/cubit/send_reference_form/send_form_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

import 'components/body.dart';

class ReferencesScreen extends StatefulWidget {
  final ReferencesPageCubit referencesPageCubit;
  final SendReferenceFormCubit sendReferenceFormCubit;
  final PreferredSizeWidget? appBar;
  const ReferencesScreen({
    Key? key,
    this.appBar,
    required this.referencesPageCubit,
    required this.sendReferenceFormCubit,
  }) : super(key: key);

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final _strings = localizationInstance;

    return Scaffold(
      appBar: widget.appBar ??
          InkAppBarWithText(context, title: _strings.orderInquiry),
      body: CustomLayoutBuilder(builder: (context, constraints, isTablet) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
                child: Text(_strings.orderInquiry,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Body(
                  isTablet: isTablet,
                  referencesPageCubit: widget.referencesPageCubit,
                  sendReferenceFormCubit: widget.sendReferenceFormCubit),
            ],
          ),
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
