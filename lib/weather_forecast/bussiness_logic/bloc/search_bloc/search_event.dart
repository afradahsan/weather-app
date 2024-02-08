part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherbyCity extends SearchEvent{
  final String city;

  const FetchWeatherbyCity(this.city);

  @override
  List<Object> get props => [city];
}