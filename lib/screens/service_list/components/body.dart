import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_element.dart';
import 'package:ink_mobile/screens/service_list/components/service_list_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    List<ServiceListItem> items = [
      ServiceListItem(
          title: _strings.myData,
          svgPicturePath: 'assets/images/services_profile_icon.svg',
          link: '/personal'),
      ServiceListItem(
          title: _strings.feedback,
          svgPicturePath: 'assets/images/services_feedback_icon.svg',
          link: '/feedback'),
      ServiceListItem(
          title: _strings.transportOrdering,
          svgPicturePath: 'assets/images/services_transport_request_icon.svg',
          link: '/personal'),
      ServiceListItem(
          title: _strings.orderInquiry,
          svgPicturePath: 'assets/images/services_inquiry_request_icon.svg',
          link: '/references'),
      ServiceListItem(
          title: _strings.getMedicalInsurance,
          svgPicturePath: 'assets/images/services_medical_insurance_icon.svg',
          link: '/personal'),
      ServiceListItem(
          title: _strings.socialPackage,
          svgPicturePath: 'assets/images/services_social_package_icon.svg',
          link: '/social_package'),
      ServiceListItem(
          title: _strings.staffMovements,
          svgPicturePath: 'assets/images/services_personnel_movement_icon.svg',
          link: '/personnel_movements'),
      ServiceListItem(
          title: _strings.birthdays,
          svgPicturePath: 'assets/images/services_birthdays_icon.svg',
          link: '/birthdays'),
    ];

    return Container(
        color: Colors.white,
        width: size.width,
        margin: EdgeInsets.only(top: 18),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(color: Colors.grey);
          },
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ServiceListElement(
                title: items[index].title,
                svgPicturePath: items[index].svgPicturePath,
                link: items[index].link);
          },
        ));
  }
}
