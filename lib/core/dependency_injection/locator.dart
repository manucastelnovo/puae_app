import 'package:puae_app/features/user/data/repositories/user_repository_implementation.dart';
import 'package:puae_app/features/user/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImplementation());
}
