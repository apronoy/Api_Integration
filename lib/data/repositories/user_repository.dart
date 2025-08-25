import 'package:dio/dio.dart';
import 'package:my_bloc_work/data/services/api_services.dart';
import 'package:my_bloc_work/data/services/get_it.dart';
import 'package:my_bloc_work/models/UserModel.dart';

class UserRepository {
  final _apiservice = getit.get<ApiServices>();

  Future<List<Usermodel>> loadallUsers() async {
    try {
      Response response =
          await _apiservice.getApi('https://dummyjson.com/users');
      if (response.statusCode == 200) {
        List<dynamic> users = response.data['users'];
        List<Usermodel> alluser =
            users.map((e) => Usermodel.fromJson(e)).toList();

        return alluser;
      }
      throw 'Users not found';
    } catch (e) {
      rethrow;
    }
  }
}
