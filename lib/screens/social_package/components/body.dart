import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/get_section/get_section_cubit.dart';
import 'package:ink_mobile/cubit/get_section/get_section_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_element.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_item.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  static double _horizontalPadding = 15.0;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final getSectionCubit = GetSectionCubit();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _strings = localizationInstance;

    List<SocialPackageListItem> items = [
      SocialPackageListItem(
          title: _strings.voluntaryMedicalInsurance,
          link: '/voluntary_medical_insurance'),
      SocialPackageListItem(
          title: _strings.accidentInsurance, link: '/accident_insurance'),
      SocialPackageListItem(
          title: _strings.financialAid, link: '/financial_aid'),
      SocialPackageListItem(
          title: _strings.childrenRest, link: '/children_rest'),
      SocialPackageListItem(
          title: _strings.christmasGifts, link: '/christmas_gifts'),
      SocialPackageListItem(
        title: _strings.recreationalActivities,
        link: '/recreational_activities',
      ),
      SocialPackageListItem(
        title: "Премирование сотрудников",
        link: '/anniversary_bonus',
      ),
      SocialPackageListItem(
        title: "Компенсация проезда к месту отдыха",
        link: '/compensation_travel',
      ),
    ];

    return BlocBuilder<GetSectionCubit, GetSectionCubitState>(
        bloc: getSectionCubit,
        builder: (context, state) {
          switch (state.type) {
            case GetSectionCubitStateEnums.LOADING:
              getSectionCubit.fetch();
              return Center(
                child: InkPageLoader(),
              );
            case GetSectionCubitStateEnums.SUCCESS:
              final pages = state.data;
              return Column(
                children: [
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: Body._horizontalPadding, vertical: 25),
                    color: Colors.white,
                    child: Text(
                      _strings.socialPackage,
                      style: TextStyle(
                        fontSize: SizeConfig(context, 30)
                            .getProportionateScreenHeight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Body._horizontalPadding),
                      color: Colors.white,
                      width: size.width,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(color: Colors.grey);
                        },
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return SocialPackageListElement(
                            title: items[index].title,
                            link: items[index].link,
                            code: pages[index].code,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            case GetSectionCubitStateEnums.ERROR:
              return const SizedBox.shrink();
          }
        });
  }
}
