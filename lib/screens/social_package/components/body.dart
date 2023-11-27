import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/get_section/get_section_cubit.dart';
import 'package:ink_mobile/cubit/get_section/get_section_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_element.dart';
import 'package:ink_mobile/screens/social_package/components/social_package_list_item.dart';
import 'package:openapi/openapi.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);
  static const double _horizontalPadding = 15.0;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final getSectionCubit = GetSectionCubit();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _strings = localizationInstance;

    // TODO: remove if we get all necessary social package items
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
              return const Center(
                child: InkPageLoader(),
              );
            case GetSectionCubitStateEnums.SUCCESS:
              final pages = state.data;
              //TODO refactoring after migration
              String getSocialElementField(Page pag, String returnType) {
                if (pag.oneOf.value is TextPage) {
                  TextPage textPage = pag.oneOf.value as TextPage;
                  switch (returnType) {
                    case 'name':
                      return textPage.name;
                    case 'url':
                      return '';
                    case 'id':
                      return textPage.id.toString();

                    case 'iconUrl':
                      return textPage.iconUrl.toString();

                    default:
                      return '';
                  }
                } else if (pag.oneOf.value is WebViewPage) {
                  WebViewPage webViewPage = pag.oneOf.value as WebViewPage;
                  switch (returnType) {
                    case 'name':
                      return webViewPage.name;
                    case 'url':
                      return webViewPage.url;
                    case 'id':
                      return webViewPage.id.toString();

                    case 'iconUrl':
                      return webViewPage.iconUrl.toString();

                    default:
                      return '';
                  }
                } else
                  return '';
              }
              return Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Body._horizontalPadding, vertical: 25),
                    color: Colors.white,
                    child: Text(
                      _strings.socialPackage,
                      style: FontStyles.rubikH2(color: Palette.textBlack),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width,
                      child: ColoredBox(
                        color: Palette.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Body._horizontalPadding),
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(color: Colors.grey);
                            },
                            itemCount: pages.length,
                            itemBuilder: (context, index) {
                              return SocialPackageListElement(
                                title:
                                    getSocialElementField(pages[index], 'name'),
                                link:
                                    getSocialElementField(pages[index], 'url'),
                                id: getSocialElementField(pages[index], 'id'),
                                iconUrl: getSocialElementField(
                                    pages[index], 'iconUrl'),
                              );
                            },
                          ),
                        ),
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
