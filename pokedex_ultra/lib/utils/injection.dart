import 'package:get_it/get_it.dart';
import 'package:pokedex_ultra/dataBase/isar.dart';

class Injection {

  static initialize() {
    GetIt getIt = GetIt.instance;

    //Database
    getIt.registerLazySingleton(() => IsarRepository());



  }
}