import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/assets/constants.dart';

class ServiceListItem {
  final String title;
  final String svgPicturePath;
  final String link;
  final int? pageViewerId;

  ServiceListItem({
    required this.title,
    required this.svgPicturePath,
    required this.link,
    this.pageViewerId,
  });
}

class ServiceListItemListView {
  static List<ServiceListItem> getItems(AppLocalizations _strings) => [
        ServiceListItem(
          title: _strings.myData,
          svgPicturePath: IconLinks.USER_ICON_LINK,
          link: '/personal',
        ),
        ServiceListItem(
          title: _strings.feedback,
          svgPicturePath: IconLinks.COMMENT_ICON_LINK,
          link: '/feedback',
          pageViewerId: 1,
        ),
        ServiceListItem(
          title: _strings.orderInquiry,
          svgPicturePath: IconLinks.DOCUMENT_ICON_LINK,
          link: '/references',
          pageViewerId: 2,
        ),
        ServiceListItem(
          title: _strings.getMedicalInsurance,
          svgPicturePath: IconLinks.HEALTH_ICON_LINK,
          link: '/medical_insurance',
          pageViewerId: 3,
        ),
        ServiceListItem(
          title: _strings.socialPackage,
          svgPicturePath: IconLinks.UMBRELLA_ICON_LINK,
          link: '/social_package',
        ),
        ServiceListItem(
          title: _strings.staffMovements,
          svgPicturePath: IconLinks.TEAM_ICON_LINK,
          link: '/personnel_movements',
        ),
        ServiceListItem(
          title: _strings.birthdays,
          svgPicturePath: IconLinks.CAKE_ICON_LINK,
          link: '/birthdays',
        ),
      ];
}
