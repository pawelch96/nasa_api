library picture_of_the_day_response;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nasa_api/data/model/serializer/serializers.dart';

part 'picture_of_the_day_response.g.dart';

abstract class PictureOfTheDayResponse
    implements Built<PictureOfTheDayResponse, PictureOfTheDayResponseBuilder> {
  @nullable
  String get copyright;
  @nullable
  String get date;
  @nullable
  String get explanation;
  @nullable
  String get hdurl;
  @nullable
  String get url;
  @nullable
  String get title;

  PictureOfTheDayResponse._();

  factory PictureOfTheDayResponse([updates(PictureOfTheDayResponseBuilder b)]) =
      _$PictureOfTheDayResponse;

  String toJson() {
    return json.encode(
        serializers.serializeWith(PictureOfTheDayResponse.serializer, this));
  }

  static PictureOfTheDayResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        PictureOfTheDayResponse.serializer, json.decode(jsonString));
  }

  static Serializer<PictureOfTheDayResponse> get serializer =>
      _$pictureOfTheDayResponseSerializer;
}
