import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/centring_widget.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/screens/open_university/components/learning_materials_list_element.dart';

class LearningMaterialsList extends StatelessWidget {
  final LearningMaterialsListCubit cubit;

  final ScrollController controller;

  const LearningMaterialsList(
      {Key? key, required this.controller, required this.cubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    controller.addListener(_onScroll);

    return RefreshIndicator(
      onRefresh: () async {
        cubit.refresh();
      },
      color: Colors.green,
      displacement: 20,
      child:
          BlocBuilder<LearningMaterialsListCubit, LearningMaterialsListState>(
        bloc: cubit,
        builder: (context, state) {
          switch (state.type) {
            case LearningMaterialsListStateType.LOADING:
              {
                cubit.fetch();
                return const CentringWrapper(child: InkPageLoader());
              }

            case LearningMaterialsListStateType.LOADED:
              {
                List<LearningMaterialsListElement> items =
                    _getLearningMaterialsWidgetList(state.data!);
                return Container(
                  color: const Color(0xfff9f9f9),
                  child: Column(children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 24, bottom: 20),
                        child: Row(
                          children: [
                            Text(
                              _strings.learningMaterials,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            )
                          ],
                        )),
                    ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) =>
                          items[index],
                    )
                  ]),
                );
              }

            case LearningMaterialsListStateType.ERROR:
              {
                return CentringWrapper(
                    child: ErrorRefreshButton(
                  onTap: cubit.refresh,
                  text: state.errorMessage!,
                ));
              }
          }
        },
      ),
    );
  }

  Future<void> _onScroll() async {
    await cubit.onScroll(controller);
  }

  List<LearningMaterialsListElement> _getLearningMaterialsWidgetList(
      List<LearningMaterialsData> learningMaterialsList) {
    List<LearningMaterialsListElement> _learningMaterialsWidgetList = [];

    for (var value in learningMaterialsList) {
      _learningMaterialsWidgetList
          .add(LearningMaterialsListElement(learningMaterial: value));
    }

    return _learningMaterialsWidgetList;
  }
}
