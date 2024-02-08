import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/weather_forecast/secrets.dart';

part 'search_state.dart';
part 'search_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  SearchBloc() : super(SearchInitial()) {
    on<FetchWeatherbyCity>((event, emit) async{
      emit(SearchLoading());
      try{
        WeatherFactory wf = WeatherFactory(apiKey, language: Language.ENGLISH);
        print('city: ${event.city}');
        Weather weatherbyCityName = await wf.currentWeatherByCityName(event.city);
        print(weatherbyCityName);
        emit(SearchSuccess(weatherbyCityName));
        print('emitted');
      } catch (e) {
        print('error');
        emit(SearchFailure());
      }
    });
  }
}
