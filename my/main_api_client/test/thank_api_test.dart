import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ThankApi
void main() {
  final instance = Openapi().getThankApi();

  group(ThankApi, () {
    // Поблагодарить
    //
    //Future<ThankById> thankIdGet(int id, int heart) async
    test('test thankIdGet', () async {
      // TODO
    });

  });
}
