import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/constants/app_metrics_events.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';
import 'package:ink_mobile/screens/service_list/service_list_page_viewer.dart';

class ServiceListElement extends StatelessWidget {
  final ServiceListItem item;
  const ServiceListElement({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _metrica();
        if (item.pageViewerId != null) {
          ServiceListPageViewerState.pageViewer.pageController
              .jumpToPage(item.pageViewerId!);
        } else {
          Navigator.pushNamed(context, item.link);
        }
      },
      child: SizedBox(
        height: 70,
        child: Row(
          children: [
            const SizedBox(width: 22),
            SvgPicture.asset(item.svgPicturePath,
                width: 24.0,
                height: 24.0,
                colorFilter:
                    ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn)),
            const SizedBox(width: 14),
            Text(
              item.title,
              style: FontStyles.rubikP1(color: Palette.textBlack),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20.0, color: Palette.greenE4A),
            const SizedBox(width: 32),
          ],
        ),
      ),
    );
  }

  _metrica() {
    switch (item.link) {
      case '/feedback':
        AppMetricsEvents().feedbackEvent();
        break;
      case '/references':
        AppMetricsEvents().referencesEvent();
        break;
      case '/medical_insurance':
        AppMetricsEvents().medicalInsuranceEvent();
        break;
      case '/social_package':
        AppMetricsEvents().socialPackageEvent();
        break;
      case '/personnel_movements':
        AppMetricsEvents().personnelMovementsEvent();
        break;
      case '/birthdays':
        AppMetricsEvents().birthdaysEvent();
        break;
    }
  }
}
