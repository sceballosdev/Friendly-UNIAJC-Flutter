import 'package:get_it/get_it.dart';

import 'local_storage_service.dart';
GetIt locator = GetIt.instance;

void setupLocator() async {
  var localStorageInstance = await LocalStorageService.getInstance();

  locator.registerLazySingleton(() => localStorageInstance);
}
