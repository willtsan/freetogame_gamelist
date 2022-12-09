import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pravaler_gamelist/features/details/page/details.page.dart';
import 'package:pravaler_gamelist/features/home/controller/home.controller.dart';
import 'package:pravaler_gamelist/features/home/page/home.page.dart';
import 'package:pravaler_gamelist/features/splash/page/splash.page.dart';
import 'package:pravaler_gamelist/shared/freetogame/data/datasources/get_game_list.datasource.dart';
import 'package:pravaler_gamelist/shared/freetogame/data/datasources/get_game_list_imp.datasource.dart';
import 'package:pravaler_gamelist/shared/freetogame/data/repositories/get_game_list_imp.repository.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/repositories/get_game_list.repository.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/usecases/get_game_list.usecase.dart';
import 'package:pravaler_gamelist/shared/freetogame/domain/usecases/get_game_list_imp.usecase.dart';

void main() {
  registerDependencies();

  runApp(const MyApp());
}

void registerDependencies() {
  GetIt.I.registerLazySingleton<GetGameListDatasource>(
      () => GetGameListDatasourceImp());

  GetIt.I.registerLazySingleton<GetGameListRepository>(
      () => GetGameListRepositoryImp(GetIt.I.get()));

  GetIt.I.registerLazySingleton<GetGameListUseCase>(
      () => GetGameListUseCaseImp(GetIt.I.get()));

  GetIt.I.registerSingleton<HomeController>(HomeController(GetIt.I.get()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pravaler GameList',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          Map<String, dynamic> args =
              settings.arguments as Map<String, dynamic>;

          return MaterialPageRoute(
            builder: (context) {
              return DetailsPage(
                id: args['id'],
              );
            },
          );
        }

        return null;
      },
    );
  }
}
