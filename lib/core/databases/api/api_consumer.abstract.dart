abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});
  Future<dynamic> put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false});
  Future<dynamic> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
}
