import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/references/reference_list.dart';

enum DeliveryType { BUH, SECURITY_UK, OK_IRK, OK_UK, INKTKRS, POST }

class DeliveryList {
  final LanguageStrings strings;
  DeliveryList({required this.strings});

  DeliveryItem buh() =>
      DeliveryItem(title: strings.deliveryMethodBuh, deliveryType: 'BUH');
  DeliveryItem securityUk() => DeliveryItem(
      title: strings.deliveryMethodSecurityUk, deliveryType: 'SECURITY_UK');
  DeliveryItem okIrk() =>
      DeliveryItem(title: strings.deliveryMethodOkIrk, deliveryType: 'OK_IRK');
  DeliveryItem okUk() =>
      DeliveryItem(title: strings.deliveryMethodOkUk, deliveryType: 'OK_UK');
  DeliveryItem inktkrs() => DeliveryItem(
      title: strings.deliveryMethodInkTkrs, deliveryType: 'INKTKRS');
  DeliveryItem post() =>
      DeliveryItem(title: strings.deliveryMethodPostMail, deliveryType: 'POST');

  DeliveryItem? getDeliveryItem(DeliveryType type) {
    switch (type) {
      case DeliveryType.BUH:
        return buh();
      case DeliveryType.SECURITY_UK:
        return securityUk();
      case DeliveryType.OK_IRK:
        return okIrk();
      case DeliveryType.OK_UK:
        return okUk();
      case DeliveryType.INKTKRS:
        return inktkrs();
      case DeliveryType.POST:
        return post();
      default:
        return null;
    }
  }

  List<DeliveryType> getDeliveryTypeList(ReferencesItem item) {
    return item.deliveryList;
  }

  List<String> getDeliveryItemsList(ReferencesItem item) {
    List<String> delivery = [];
    getDeliveryTypeList(item).forEach((deliveryType) {
      String name = getDeliveryItem(deliveryType)?.title ?? 'NAN';
      delivery.add(name);
    });
    return delivery;
  }

  DeliveryType getCurrentDeliveryType(ReferencesItem item, int index) {
    return getDeliveryTypeList(item).elementAt(index);
  }

  DeliveryItem? getCurrentDeliveryItem(
      ReferencesItem referencesItem, int? index) {
    if (index == null) return null;
    DeliveryType type = getCurrentDeliveryType(referencesItem, index);
    return getDeliveryItem(type)!;
  }

  bool canBeAddressDelivered(ReferencesItem referencesItem, int? deliveryType) {
    if (deliveryType != null) {
      return getCurrentDeliveryType(referencesItem, deliveryType) ==
          DeliveryType.POST;
    }

    return false;
  }
}

class DeliveryItem {
  String title;
  String deliveryType;

  DeliveryItem({required this.title, required this.deliveryType});
}
