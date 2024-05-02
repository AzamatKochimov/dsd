class ApiConst {
  static const connectionTimeout = 20000;
  static const sendTimeout = 20000;

  static const baseUrl = 'https://dominant-soft-development.up.railway.app/';
  static const version = '';

  // Courses api
  static const getAllProduct = '/product/list';

}

class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
