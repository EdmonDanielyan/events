import 'package:dio/dio.dart';
import 'package:ink_mobile/functions/files.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:intl/intl.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/model/order_reference_success.dart';
import 'dependency.dart';

class SendReferenceFormNetworkRequest
    extends SendReferenceFormRequestDependency {
  ReferencesFormEntities entities;
  ReferencesItem referencesItem;
  DeliveryItem deliveryItem;
  SendReferenceFormNetworkRequest({
    required this.entities,
    required this.referencesItem,
    required this.deliveryItem,
  });

  @override
  Future<Response<OrderReferenceSuccess>> makeRequest() async =>
      await MainApiClient()
          .getUserApi()
          .userOrderreferencePost(
            referencesItem.referencesType,
            entities.phone,
            deliveryItem.deliveryType,
            postalCode: entities.postCode,
            address: entities.address,
            period: entities.period,
            destination: entities.toProvideIn,
            filesLeftSquareBracketRightSquareBracket: entities.files.length > 0
                ? getFilesAsMultipart(entities.files)
                : null,
            num_: entities.quantity,
            child: entities.fioChildren,
            dateStart: DateFormat('dd.MM.yyyy').format(entities.periodFrom),
            dateEnd: DateFormat('dd.MM.yyyy').format(entities.periodTo),
          )
          .timeout(Duration(seconds: 10));
}
