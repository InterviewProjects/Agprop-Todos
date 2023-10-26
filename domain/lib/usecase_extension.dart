import 'package:domain_package/src/domain_layer.dart';
import 'package:domain_package/usecase/authentication_use_case.dart';
import 'package:domain_package/usecase/profile_use_case.dart';
import 'package:domain_package/usecase/todos_use_case.dart';
import 'package:domain_package/usecase/todos_use_case.dart';

mixin UseCaseExtension {
  AuthenticationUseCase get authenticationUseCase {
    return injector<AuthenticationUseCase>();
  }

  TodosUseCase get todosUseCase {
    return injector<TodosUseCase>();
  }

  ProfileUseCase get profileUseCase {
    return injector<ProfileUseCase>();
  }
}