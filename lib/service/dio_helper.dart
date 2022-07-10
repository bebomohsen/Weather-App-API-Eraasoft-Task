import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static String apiKey = 'ebccf4fdd2ecaecb835f52fa59f57c92';
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getCurrentWeather({required String city}) async {
    print(dio);
    Response response = await dio!.get('/weather', queryParameters: {
      'units': 'metric',
      'q': city,
      'appid': DioHelper.apiKey
    });
    print(response.data.toString());
    return response;
  }
}
