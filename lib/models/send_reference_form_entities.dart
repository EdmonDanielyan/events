import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';

class SendReferenceFormEntities {
  ReferencesFormEntities entities;
  ReferencesItem referencesItem;
  DeliveryItem deliveryItem;
  SendReferenceFormEntities(
      {required this.entities,
      required this.referencesItem,
      required this.deliveryItem});
}
