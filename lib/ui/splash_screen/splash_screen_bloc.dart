import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:nasa_api/data/repository/pod_repository.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_event.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final PodRepository _podRepository;

  SplashScreenBloc(this._podRepository) : super();

  void onSplashScreenInitiated(String date) {
    dispatch(SplashScreenInitiated((b) => b..date = date));
  }

  @override
  SplashScreenState get initialState => SplashScreenState.initial();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenState currentState,
    SplashScreenEvent event,
  ) async* {
    if (event is SplashScreenInitiated) {
      yield* mapSplashScreenInitiated(event);
    }
  }

  Stream<SplashScreenState> mapSplashScreenInitiated(
      SplashScreenInitiated event) async* {
    yield SplashScreenState.loading();

    try {
      final result = await _podRepository.getPictureOfTheDayData(event.date);
      yield SplashScreenState.success(result);
    } catch (e) {
      yield SplashScreenState.failure(e.message);
    }
  }
}
