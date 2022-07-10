import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapptask/models/weather_model.dart';
import 'package:weatherapptask/service/dio_helper.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
  static WeatherDataCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherData;

  getWeatherData() {
    DioHelper.getCurrentWeather(city: 'tanta').then((value) {
      emit(WeatherLoadingState());
      weatherData = WeatherModel.fromJson(value.data);
      print(weatherData!.main!.feelsLike);
      emit(WeatherSuccessState());
      return weatherData;
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(WeatherErrorState());
    });
  }

  weatherNewRequest() {}
  weatherCityChanged() {}
}
