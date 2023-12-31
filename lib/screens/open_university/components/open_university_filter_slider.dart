import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/filter_slider_element.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_state.dart';

class OpenUniversityFilterSlider extends StatefulWidget {
  final OpenUniversityFilterCodes selectedFilter;
  final OpenUniversityCubit openUniversityCubit;

  const OpenUniversityFilterSlider({
    Key? key,
    this.selectedFilter = OpenUniversityFilterCodes.about_project,
    required this.openUniversityCubit,
  }) : super(key: key);

  @override
  State<OpenUniversityFilterSlider> createState() =>
      _OpenUniversityFilterSliderState(selectedFilter: selectedFilter);
}

class _OpenUniversityFilterSliderState
    extends State<OpenUniversityFilterSlider> {
  late AppLocalizations _strings;
  OpenUniversityFilterCodes? selectedFilter;

  _OpenUniversityFilterSliderState({required this.selectedFilter}) : super();

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;

    return Container(
        height: 35,
        margin: const EdgeInsets.only(top: 8.0),
        child: Container(child: _getFilterListView(context)));
  }

  ListView _getFilterListView(BuildContext context) {
    List<FilterItem> items = _getFilterItems();

    return ListView.separated(
        addAutomaticKeepAlives: false,
        physics: const AlwaysScrollableScrollPhysics(),
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BlocBuilder<OpenUniversityCubit, OpenUniversityState>(
              bloc: widget.openUniversityCubit,
              builder: (context, state) {
                return FilterSliderElement(
                  selectedTextStyle: TextStyle(
                    fontSize:
                        SizeConfig(context, 14.0).getProportionateScreenHeight,
                  ),
                  title: items[index].title,
                  onTap: () async {
                    await widget.openUniversityCubit.load(items[index].code);
                    setState(() {
                      selectedFilter = items[index].code;
                    });
                  },
                  isSelected: items[index].code == selectedFilter,
                  selectedColor: Theme.of(context).primaryColor,
                );
              });
        },
        separatorBuilder: (context, index) {
          return Container(margin: const EdgeInsets.only(right: 10.0));
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
      // FilterItem(
      //     title: _strings.learningMaterials,
      //     code: OpenUniversityFilterCodes.learning_materials)
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
