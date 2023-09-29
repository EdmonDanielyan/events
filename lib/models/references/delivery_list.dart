import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/references/reference_list.dart';

enum DeliveryType { BUH, OK_IRK, OK_UK, INKTKRS, POST, EMAIL }

class DeliveryList {
  DeliveryList();

  DeliveryItem buh() => DeliveryItem(
      title: localizationInstance.deliveryMethodBuh, deliveryType: 'BUH');
  DeliveryItem okIrk() => DeliveryItem(
      title: localizationInstance.deliveryMethodOkIrk, deliveryType: 'OK_IRK');
  DeliveryItem okUk() => DeliveryItem(
      title: localizationInstance.deliveryMethodOkUk, deliveryType: 'OK_UK');
  DeliveryItem inktkrs() => DeliveryItem(
      title: localizationInstance.deliveryMethodInkTkrs,
      deliveryType: 'INKTKRS');
  DeliveryItem post() => DeliveryItem(
      title: localizationInstance.deliveryMethodPostMail, deliveryType: 'POST');
  DeliveryItem email() => DeliveryItem(
      title: localizationInstance.deliveryMethodEmail, deliveryType: 'EMAIL');

  DeliveryItem? getDeliveryItem(DeliveryType type) {
    switch (type) {
      case DeliveryType.BUH:
        return buh();
      case DeliveryType.OK_IRK:
        return okIrk();
      case DeliveryType.OK_UK:
        return okUk();
      case DeliveryType.INKTKRS:
        return inktkrs();
      case DeliveryType.POST:
        return post();
      case DeliveryType.EMAIL:
        return email();
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
