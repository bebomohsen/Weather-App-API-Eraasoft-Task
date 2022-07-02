import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  WeatherDataCubit() : super(WeatherDataInitial());
  static WeatherDataCubit get(context)=>BlocProvider.of(context);




  weatherNewRequest(){}
  weatherCityChanged(){}
}
