import 'package:get_it/get_it.dart';
import 'package:my_bloc_work/data/services/api_services.dart';

final getit = GetIt.instance;

void setUpGetIT() {
  getit.registerLazySingleton(() => ApiServices());
}
