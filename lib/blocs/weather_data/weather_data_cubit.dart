import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapptask/models/weather_model.dart';
import 'package:weatherapptask/service/dio_helper.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
  static WeatherDataCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherData;
  String statusImage = 'clear';
  bool needSearchBar = false;
  String selectedCountry = 'tanta';
  TextEditingController txtController = TextEditingController();
  enableSearchBar() {
    needSearchBar = true;
    emit(WeatherSearchBarEnableState());
    print(needSearchBar);
  }

  selectCountry() {
    selectedCountry = txtController.text;
    weatherData = null;
    getWeatherData();
    needSearchBar = false;
    emit(WeatherCityChangedState());
  }

  getWeatherData() {
    DioHelper.getCurrentWeather(city: selectedCountry).then((value) {
      emit(WeatherLoadingState());
      weatherData = WeatherModel.fromJson(value.data);
      switch (weatherData!.weather![0].main!) {
        case 'Clear':
          statusImage = 'default';
          break;
        case 'Clouds':
          statusImage = 'wind';
          break;
        case 'Rain':
          statusImage = 'rainy';
          break;
        case 'Thunderstorm':
          statusImage = 'thunderstorm';
          break;
        default:
      }
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
