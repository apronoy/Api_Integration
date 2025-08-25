import 'package:dio/dio.dart';
import 'package:my_bloc_work/data/services/api_services.dart';
import 'package:my_bloc_work/data/services/get_it.dart';

class AuthenticationRepository {
  final _apiservice = getit.get<ApiServices>();

  // login to user function ..
  Future<Response> loginUser(String username, String password) async {
    try {
      Response response =
          await _apiservice.postApi('https://dummyjson.com/auth/login', {
        'username': username,
        'password': password,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
