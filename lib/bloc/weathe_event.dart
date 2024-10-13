import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';


sealed class WeatherBlockEvent extends  Equatable{
  const WeatherBlockEvent();

  @override
  List<Object> get props =>[];

}

class FetchWeather extends WeatherBlockEvent{
  final Position position;
  const FetchWeather(this.position);


}