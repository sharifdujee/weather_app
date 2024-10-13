import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

sealed class WeatherBlockState extends Equatable {
  const WeatherBlockState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlockState {}
final class WeatherBlocLoading extends WeatherBlockState {}
final class WeatherBlocFailure extends WeatherBlockState {}
final class WeatherBlocSuccess extends WeatherBlockState {
  final Weather weather;
  const WeatherBlocSuccess(this.weather);
  @override
  List<Object> get props => [weather];
}

