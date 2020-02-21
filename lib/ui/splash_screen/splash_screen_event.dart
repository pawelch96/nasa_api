library splash_screen_event;

import 'package:built_value/built_value.dart';

part 'splash_screen_event.g.dart';

abstract class SplashScreenEvent {}

abstract class SplashScreenInitiated extends SplashScreenEvent
    implements Built<SplashScreenInitiated, SplashScreenInitiatedBuilder> {
  String get date;

  SplashScreenInitiated._();

  factory SplashScreenInitiated([updates(SplashScreenInitiatedBuilder b)]) =
      _$SplashScreenInitiated;
}
