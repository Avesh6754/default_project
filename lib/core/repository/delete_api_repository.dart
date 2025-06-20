import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';

class DeleteApiRepository {
  ApiClient apiClient = ApiClient();

  DeleteApiRepository(this.apiClient);

  Future<bool> deleteApi() async {
    var response = await apiClient.request(
      RequestType.DELETE,
      ApiEndPoint.deleteApi,
    );
    if (response['status'] == true) {
      return true;
    }
    return false;
  }
}
