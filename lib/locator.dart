
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:star_wars/services/api.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => NavigationService());
}