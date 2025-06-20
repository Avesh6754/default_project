class AddProductModal {
  final String title;
  final String description;
  final String address;
  final int price;
  final double discountPercentage;
  final int rating;
  final int plot;
  final String thumbnail;
  final String type;
  final int bedroom;
  final int hall;
  final int kitchen;
  final int washroom;
  final List<String>? images;

  AddProductModal({
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.plot,
    required this.thumbnail,
    required this.type,
    required this.bedroom,
    required this.hall,
    required this.kitchen,
    required this.washroom,
    this.images,
  });

  /// ✅ Factory constructor with safe parsing
  factory AddProductModal.fromMap(Map<String, dynamic> m1) {
    return AddProductModal(
      title: m1['title'] ?? '',
      description: m1['description'] ?? '',
      address: m1['address'] ?? '',
      price: m1['price'] is int ? m1['price'] : int.tryParse(m1['price'].toString()) ?? 0,
      discountPercentage: m1['discountPercentage'] is double
          ? m1['discountPercentage']
          : double.tryParse(m1['discountPercentage'].toString()) ?? 0.0,
      rating: m1['rating'] is int ? m1['rating'] : int.tryParse(m1['rating'].toString()) ?? 0,
      plot: m1['plot'] is int ? m1['plot'] : int.tryParse(m1['plot'].toString()) ?? 0,
      thumbnail: m1['thumbnail'] ?? '',
      type: m1['type'] ?? '',
      bedroom: m1['bedroom'] ?? 0,
      hall: m1['hall'] ?? 0,
      kitchen: m1['kitchen'] ?? 0,
      washroom: m1['washroom'] ?? 0,
      images: (m1['images'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'address': address,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'plot': plot,
    'thumbnail': thumbnail,
    'type': type,
    'bedroom': bedroom,
    'hall': hall,
    'kitchen': kitchen,
    'washroom': washroom,
    'images': images,
  };
}
