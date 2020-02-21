library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PictureOfTheDayResponse,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
