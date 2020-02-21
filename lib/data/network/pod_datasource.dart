import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa_api/data/model/picture_of_the_day_error.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:nasa_api/data/network/api_key.dart';

class PodDataSource {
  final http.Client client;

  final String _baseUrl =
      'https://api.nasa.gov/planetary/apod?api_key=$API_KEY';

  PodDataSource(this.client);

  Future<PictureOfTheDayResponse> getPictureOfTheDayData({
    String date = '',
  }) async {
    final url = _baseUrl + (date.isNotEmpty ? '&date=$date' : '');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      return PictureOfTheDayResponse.fromJson(response.body);
    } else {
      throw PictureOfTheDayError(json.decode(response.body)['msg']);
    }
  }
}
