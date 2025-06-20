import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/addproperty/model/add_property_model.dart';
import 'package:dio/dio.dart';


class CreateProductApiRepository {
  ApiClient apiClient = ApiClient();

  CreateProductApiRepository(this.apiClient);

  Future<bool> getAllProduct(AddProductModal data) async {

    Map<String, dynamic> fromData= {
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
      'images':data.images
    };

    print("//////////////////////////////////${data.title}  ${fromData['images']}");
    var response = await apiClient.request(
      RequestType.POST,
      ApiEndPoint.productUrl,
      data: fromData,
    );
    if (response['status'] == true) {
      return true;
    } else {
      return false;
    }
  }
}
