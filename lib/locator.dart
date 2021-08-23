import 'package:get_it/get_it.dart';
import 'package:smooth/services/firebase/firestore.service.dart';

import 'services/api/api.service.dart';
import 'services/local/local.service.dart';
import 'viewmodels/addclient.viewmodel.dart';
import 'viewmodels/clientdashboard.viewmodel.dart';
import 'viewmodels/command.viewmodel.dart';
import 'viewmodels/home.viewmodel.dart';
import 'viewmodels/login.viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Here you register all your services
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => LocalService());

  // Here you register all your viewmodels
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CommandViewModel());
  locator.registerFactory(() => AddClientViewModel());
  locator.registerFactory(() => ClientDashboardViewModel());
}
