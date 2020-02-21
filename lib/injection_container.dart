import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;
import 'package:nasa_api/data/network/pod_datasource.dart';
import 'package:nasa_api/data/repository/pod_repository.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => PodDataSource(c.resolve()))
    ..registerFactory((c) => PodRepository(c.resolve()))
    ..registerFactory((c) => SplashScreenBloc(c.resolve()));
}
