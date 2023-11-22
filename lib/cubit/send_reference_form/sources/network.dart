import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/send_reference_form_entities.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:intl/intl.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class SendReferenceFormNetworkRequest
    extends SendReferenceFormRequestDependency {
  @override
  SendReferenceFormEntities? entities;

  SendReferenceFormNetworkRequest({@factoryParam required this.entities})
      : assert(entities != null);

  @override
  Future<Response<OrderReferenceSuccess>> call() async =>
      await getIt.get<MainApiProvider>().getUserApi().userOrderreferencePost(
            referenceType: entities!.referencesItem.referencesType,
            phone: entities!.entities.phone,
            way: entities!.deliveryItem.deliveryType,
            postalCode: entities!.entities.postCode,
            address: entities!.entities.address,
            period: entities!.entities.period,
            destination: entities!.entities.toProvideIn,
            num_: entities!.entities.quantity,
            child: entities!.entities.fioChildren,
            dateStart:
                DateFormat('dd.MM.yyyy').format(entities!.entities.periodFrom),
            dateEnd:
                DateFormat('dd.MM.yyyy').format(entities!.entities.periodTo),
          );
}
