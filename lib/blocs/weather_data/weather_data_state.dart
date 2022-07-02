part of 'weather_data_cubit.dart';

@immutable
abstract class WeatherDataState {}

class WeatherDataInitial extends WeatherDataState {}


class WeatherRefreshedState extends WeatherDataState {}
class WeatherCityChangedState extends WeatherDataState {}
