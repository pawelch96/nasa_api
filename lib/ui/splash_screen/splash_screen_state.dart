library splash_screen_state;

import 'package:built_value/built_value.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';

part 'splash_screen_state.g.dart';

abstract class SplashScreenState
    implements Built<SplashScreenState, SplashScreenStateBuilder> {
  bool get isLoading;
  PictureOfTheDayResponse get result;
  String get error;

  bool get isInitial => !isLoading && result == null && error == '';
  bool get isSuccessful => !isLoading && result != null && error == '';
  bool get isFailure => error != '';

  SplashScreenState._();

  factory SplashScreenState([updates(SplashScreenStateBuilder b)]) =
      _$SplashScreenState;

  factory SplashScreenState.initial() {
    return SplashScreenState((b) => b
      ..isLoading = false
      ..result.replace(PictureOfTheDayResponse())
      ..error = '');
  }

  factory SplashScreenState.loading() {
    return SplashScreenState((b) => b
      ..isLoading = true
      ..result.replace(PictureOfTheDayResponse())
      ..error = '');
  }

  factory SplashScreenState.failure(String error) {
    return SplashScreenState((b) => b
      ..isLoading = false
      ..result.replace(PictureOfTheDayResponse())
      ..error = error);
  }

  factory SplashScreenState.success(PictureOfTheDayResponse response) {
    return SplashScreenState((b) => b
      ..isLoading = false
      ..result.replace(response)
      ..error = '');
  }
}
