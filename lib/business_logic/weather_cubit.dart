import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/models/waether_data.dart';
import '../data/repo/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.getWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Could not fetch weather. Please try again.'));
    }
  }
}
