import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/addproperty/model/add_property_model.dart';
import 'package:default_project/features/home/model/product_model.dart';

class UpdateRepository {
  ApiClient apiClient = ApiClient();

  UpdateRepository(this.apiClient);

  Future<ProductModel> updateProductData(
    String id,
    AddProductModal data,
  ) async {
    Map<String, dynamic> fromData = {
      'title': data.title,
      'thumbnail': data.thumbnail,
      'description': data.description,
      'address': data.address,
      'price': data.price,
      'discountPercentage': data.discountPercentage,
      'rating': data.rating,
      'plot': data.plot,
      'type': data.type,
      'bedroom': data.bedroom,
      'hall': data.hall,
      'kitchen': data.kitchen,
      'washroom': data.washroom,
      'images': data.images,
    };
    var response = await apiClient.request(
      RequestType.PUT,
      '${ApiEndPoint.updateProduct}/$id',
      data: fromData,
    );

    if (response['status'] == true) {
      // Handle success
      return ProductModel.fromJson(response['data']);
    } else {
      // Handle failure
      throw Exception('Failed to update product');
    }
  }
}
