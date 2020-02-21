import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:nasa_api/data/network/pod_datasource.dart';

class PodRepository {
  PodDataSource _podDataSource;

  PodRepository(this._podDataSource);

  Future<PictureOfTheDayResponse> getPictureOfTheDayData(String date) async {
    final result = await _podDataSource.getPictureOfTheDayData(date: date);

    if (result == null) throw NoResultFetchedException();

    return result;
  }
}

class NoResultFetchedException implements Exception {
  final message = "No result fetched.";
}
