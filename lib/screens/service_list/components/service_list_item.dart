import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          svgPicturePath: 'assets/images/services_profile_icon.svg',
          link: '/personal',
        ),
        ServiceListItem(
          title: _strings.feedback,
          svgPicturePath: 'assets/images/services_feedback_icon.svg',
          link: '/feedback',
          pageViewerId: 1,
        ),
        ServiceListItem(
          title: _strings.orderInquiry,
          svgPicturePath: 'assets/images/services_inquiry_request_icon.svg',
          link: '/references',
          pageViewerId: 2,
        ),
        ServiceListItem(
          title: _strings.getMedicalInsurance,
          svgPicturePath: 'assets/images/services_medical_insurance_icon.svg',
          link: '/medical_insurance',
          pageViewerId: 3,
        ),
        ServiceListItem(
          title: _strings.socialPackage,
          svgPicturePath: 'assets/images/services_social_package_icon.svg',
          link: '/social_package',
        ),
        ServiceListItem(
          title: _strings.staffMovements,
          svgPicturePath: 'assets/images/services_personnel_movement_icon.svg',
          link: '/personnel_movements',
        ),
        ServiceListItem(
          title: _strings.birthdays,
          svgPicturePath: 'assets/images/services_birthdays_icon.svg',
          link: '/birthdays',
        ),
      ];
}
