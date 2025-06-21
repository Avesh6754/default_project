import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';

class DeleteApiRepository {
  ApiClient apiClient = ApiClient();

  DeleteApiRepository(this.apiClient);

  Future<bool> deleteApi(String id) async {
    var response = await apiClient.request(
      RequestType.DELETE,
      '${ApiEndPoint.deleteApi}/$id',
    );
    if (response['status'] == true) {
      return true;
    }
    return false;
  }
}
