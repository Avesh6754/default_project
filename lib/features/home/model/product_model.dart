class ProductListResponse {
  final bool status;
  final String message;
  final int page;
  final int limit;
  final int? prePage;
  final int? nextPage;
  final int total;
  final int totalPages;
  final List<ProductModel> data;

  ProductListResponse({
    required this.status,
    required this.message,
    required this.page,
    required this.limit,
    required this.prePage,
    required this.nextPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      status: json['status'],
      message: json['message'],
      page: json['page'],
      limit: json['limit'],
      prePage: json['pre_page'],
      nextPage: json['next_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: List<ProductModel>.from(
        json['data'].map((item) => ProductModel.fromJson(item)),
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'page': page,
      'limit': limit,
      'pre_page': prePage,
      'next_page': nextPage,
      'total': total,
      'total_pages': totalPages,
      'data': data.map((product) => product.toJson()).toList(),
    };
  }

}
class ProductModel {
  final String id;
  final String title;
  final String description;
  final String address;
  final double price;
  final double discountPercentage;
  final double rating;
  final int plot;
  final String type;
  final int bedroom;
  final int hall;
  final int kitchen;
  final int washroom;
  final String thumbnail;
  final List<String> images;
  final String userId;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.plot,
    required this.type,
    required this.bedroom,
    required this.hall,
    required this.kitchen,
    required this.washroom,
    required this.thumbnail,
    required this.images,
    required this.userId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      plot: json['plot'],
      type: json['type'],
      bedroom: json['bedroom'],
      hall: json['hall'],
      kitchen: json['kitchen'],
      washroom: json['washroom'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
      userId: json['userId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'address': address,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'plot': plot,
      'type': type,
      'bedroom': bedroom,
      'hall': hall,
      'kitchen': kitchen,
      'washroom': washroom,
      'thumbnail': thumbnail,
      'images': images,
      'userId': userId,
    };
  }

}
