import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/home/model/product_model.dart';

class HomeProductRepository {
  ApiClient apiClient = ApiClient();

  HomeProductRepository(this.apiClient);

  Future<ProductListResponse?> fetchProductData(String type) async {
    try {
      var response = await apiClient.request(
        RequestType.GET,
        '${ApiEndPoint.homeProductUrl}$type',
      );
      print("Response from API: $response");

      if (response['status'] == true) {
        return ProductListResponse.fromJson(response);
      } else {
        print("API status false: ${response['message']}");
      }
    } catch (e) {
      print("Fetch error: $e");
    }
    return null;
  }
}
