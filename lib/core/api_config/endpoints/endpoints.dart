class ApiEndPoint {
  static String get baseUrl => 'https://interview.flexioninfotech.com';

  static String get loginUrl =>
      'https://interview.flexioninfotech.com/public/auth/login';

  static String get deleteApi =>
      "https://interview.flexioninfotech.com/private/products/product";

  static String get signUpUrl =>
      'https://interview.flexioninfotech.com/public/auth/register';

  static String get productUrl =>
      'https://interview.flexioninfotech.com/private/products/create-product';

  static String get homeProductUrl =>
      'https://interview.flexioninfotech.com/private/products/all-product?search=';

  static String get details => '''
https://interview.flexioninfotech.com/private/products/get-product''';
  static String get updateProduct => 'https://interview.flexioninfotech.com/private/products/product';
}
