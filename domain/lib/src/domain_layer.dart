import 'package:data_package/data_export.dart';
import 'package:domain_package/enums/environment.dart';
import 'package:domain_package/usecase/authentication_use_case.dart';
import 'package:domain_package/usecase/profile_use_case.dart';
import 'package:domain_package/usecase/todos_use_case.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
class DomainLayer {
  static Future<void> initializeDependencies(Environment environment) async {
    await DataLayer.initializeDependencies(environment);

    injector.registerLazySingleton<AuthenticationUseCase>(() => AuthenticationUseCase(injector(), injector(), injector()));

    injector.registerLazySingleton<TodosUseCase>(() => TodosUseCase(injector(), injector()));

    injector.registerLazySingleton<ProfileUseCase>(() => ProfileUseCase(injector(), injector()));
  }
}