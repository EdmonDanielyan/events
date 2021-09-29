import 'package:ink_mobile/cubit/send_reference_form/sources/dependency.dart';
import 'package:ink_mobile/cubit/send_reference_form/sources/network.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';

class SendReferenceFormRepository {
  final ReferencesFormEntities entities;
  final ReferencesItem referencesItem;
  final DeliveryItem deliveryItem;
  SendReferenceFormRepository(
      {required this.entities,
      required this.referencesItem,
      required this.deliveryItem});

  SendReferenceFormRequestDependency getDependency() {
    return SendReferenceFormNetworkRequest(
        entities: entities,
        referencesItem: referencesItem,
        deliveryItem: deliveryItem);
  }
}
