import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/detail/model/details_modal.dart';

class DetailsApi {
  ApiClient apiClient = ApiClient();

  DetailsApi(this.apiClient);

  Future<DetailsSelectedModel> getSelectedIndex(String productId) async {
    var response = await apiClient.request(
      RequestType.GET,
      '${ApiEndPoint.details}/$productId',
    );
    if (response['status'] == true) {
      return DetailsSelectedModel.fromJson(response['data']);
    }
   throw Exception('Failed to load details for product ID: $productId');
  }
}
