// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/models/send_reference_form_entities.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:intl/intl.dart';
import 'package:main_api_client/model/order_reference_success.dart';
import 'dependency.dart';

@injectable
class SendReferenceFormNetworkRequest
    extends SendReferenceFormRequestDependency {
  SendReferenceFormEntities? entities;

  SendReferenceFormNetworkRequest({@factoryParam required this.entities})
      : assert(entities != null);

  @override
  Future<Response<OrderReferenceSuccess>> call() async =>
      await getIt.get<MainApiProvider>().getUserApi().userOrderreferencePost(
            entities!.referencesItem.referencesType,
            entities!.entities.phone,
            entities!.deliveryItem.deliveryType,
            postalCode: entities!.entities.postCode,
            address: entities!.entities.address,
            period: entities!.entities.period,
            destination: entities!.entities.toProvideIn,
            filesLeftSquareBracketRightSquareBracket:
                entities!.entities.files.length > 0
                    ? getFilesAsMultipart(entities!.entities.files)
                    : null,
            num_: entities!.entities.quantity,
            child: entities!.entities.fioChildren,
            dateStart:
                DateFormat('dd.MM.yyyy').format(entities!.entities.periodFrom),
            dateEnd:
                DateFormat('dd.MM.yyyy').format(entities!.entities.periodTo),
          );
}
