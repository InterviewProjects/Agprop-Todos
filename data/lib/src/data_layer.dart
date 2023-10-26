import 'package:data_package/configuration/app_configuration_impl.dart';
import 'package:data_package/local/local_storage.dart';
import 'package:data_package/notification/local_push_notifcaition.dart';
import 'package:data_package/notification/notification_service.dart';
import 'package:data_package/remote/api_controller.dart';
import 'package:data_package/repositories/authentication_repository_impl.dart';
import 'package:data_package/repositories/local_storage_repository_impl.dart';
import 'package:data_package/repositories/profile_repository_impl.dart';
import 'package:data_package/repositories/title_list_repository_impl.dart';
import 'package:data_package/repositories/todos_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain_package/configuration/app_configuration.dart';
import 'package:domain_package/enums/environment.dart';
import 'package:domain_package/repositories/authentication_repository.dart';
import 'package:domain_package/repositories/local_storage_repository.dart';
import 'package:domain_package/repositories/profile_repository.dart';
import 'package:domain_package/repositories/title_list_repository.dart';
import 'package:domain_package/repositories/todos_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
class DataLayer {
  static Future<void> initializeDependencies(Environment env) async {
    await Firebase.initializeApp();

    injector.registerLazySingleton<AppConfiguration>(() => AppConfigurationImpl(appEnv: env));

    injector.registerLazySingleton<Dio>(() => Dio());

    FirebaseDatabase.instance.setPersistenceEnabled(true);
    injector.registerLazySingleton<FirebaseDatabase>(() => FirebaseDatabase.instance);

    final storage = LocalStorage();
    await storage.initialize();
    injector.registerLazySingleton<LocalStorage>(() => storage);

    injector.registerLazySingleton<ApiController>(() => ApiController(apiClient: injector(), appConfiguration: injector()));

    injector.registerLazySingleton<TitleListRepository>(() => TitleListRepositoryImpl(injector()));

    injector.registerLazySingleton<LocalPushNotification>(() => LocalPushNotification());

    injector.registerSingleton<NotificationService>(NotificationService());

    injector.registerLazySingleton<LocalStorageRepository>(() => LocalStorageRepositoryImpl(injector()));

    injector.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl());

    injector.registerLazySingleton<TodosRepository>(() => TodosRepositoryImpl(injector()));

    injector.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(injector()));
  }
}