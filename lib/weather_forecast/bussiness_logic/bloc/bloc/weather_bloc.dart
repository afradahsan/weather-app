import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/weather_forecast/secrets.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf =
            WeatherFactory(apiKey, language: Language.ENGLISH);
        print('wf ${wf}');
        Weather weatherbyLoc = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
            print('object');
            print('weatherbyLoc $weatherbyLoc');
        emit(WeatherSuccess(weatherbyLoc));
      } catch (e) {
        emit(WeatherFailure());
      }
    });
  }
}

// class WeatherCityBloc extends Bloc<WeatherEvent, WeatherState>{
//   WeatherCityBloc() : super(WeatherInitial()){
//     on
//   }
// }