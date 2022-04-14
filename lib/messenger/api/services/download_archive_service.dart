import 'package:ink_mobile/messenger/api/rest_client/rest_client.dart';

class DownloadArchiveService {
  const DownloadArchiveService();

  Future<List<int>?> call() async {
    final response = await MessengerApi().downloadArchive();
    return response.data;
  }
}
