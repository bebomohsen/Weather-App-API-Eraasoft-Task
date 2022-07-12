part of 'weather_data_cubit.dart';

@immutable
abstract class WeatherDataState {}

class WeatherDataInitial extends WeatherDataState {}

class WeatherLoadingState extends WeatherDataState {}

class WeatherSuccessState extends WeatherDataState {}

class WeatherErrorState extends WeatherDataState {}

class WeatherRefreshedState extends WeatherDataState {}

class WeatherCityChangedState extends WeatherDataState {}

class WeatherSearchBarEnableState extends WeatherDataState {}
