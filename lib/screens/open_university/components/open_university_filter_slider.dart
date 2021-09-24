import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/filter_slider_element.dart';
import 'package:ink_mobile/cubit/open_university/open_university_cubit.dart';
import 'package:ink_mobile/cubit/open_university/open_university_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class OpenUniversityFilterSlider extends StatefulWidget {
  final OpenUniversityFilterCodes selectedFilter;

  const OpenUniversityFilterSlider(
      {Key? key, this.selectedFilter = OpenUniversityFilterCodes.about_project})
      : super(key: key);

  @override
  _OpenUniversityFilterSliderState createState() =>
      _OpenUniversityFilterSliderState(selectedFilter: selectedFilter);
}

class _OpenUniversityFilterSliderState
    extends State<OpenUniversityFilterSlider> {
  late LanguageStrings _strings;
  OpenUniversityFilterCodes? selectedFilter;

  _OpenUniversityFilterSliderState({required this.selectedFilter}) : super();

  @override
  Widget build(BuildContext context) {
    _strings = BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Container(
        height: 30,
        margin: EdgeInsets.only(top: 8.0),
        child: Container(child: _getFilterListView(context)));
  }

  ListView _getFilterListView(BuildContext context) {
    List<FilterItem> items = _getFilterItems();

    return ListView.separated(
        addAutomaticKeepAlives: false,
        physics: AlwaysScrollableScrollPhysics(),
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<OpenUniversityCubit, OpenUniversityState>(
              builder: (context, state) {
            OpenUniversityCubit cubit =
                BlocProvider.of<OpenUniversityCubit>(context);

            return Container(
                child: FilterSliderElement(
              title: items[index].title,
              onTap: () async {
                await cubit.load(items[index].code);
                setState(() {
                  selectedFilter = items[index].code;
                });
              },
              isSelected: items[index].code == selectedFilter,
              selectedColor: Theme.of(context).primaryColor,
            ));
          });
        },
        separatorBuilder: (context, index) {
          return Container(margin: EdgeInsets.only(right: 10.0));
        },
        itemCount: items.length);
  }

  List<FilterItem> _getFilterItems() {
    return [
      FilterItem(
          title: _strings.aboutProject,
          code: OpenUniversityFilterCodes.about_project),
      FilterItem(
          title: _strings.events, code: OpenUniversityFilterCodes.events),
      FilterItem(
          title: _strings.inkLiteracy,
          code: OpenUniversityFilterCodes.ink_literacy),
      FilterItem(
          title: _strings.learningMaterials,
          code: OpenUniversityFilterCodes.learning_materials)
    ];
  }
}

enum OpenUniversityFilterCodes {
  about_project,
  events,
  ink_literacy,
  learning_materials
}

class FilterItem {
  final String title;
  final OpenUniversityFilterCodes code;

  const FilterItem({required this.title, required this.code});
}
