import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weathe_event.dart';
import 'package:weather_app/bloc/weathe_state.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/data/my_data.dart';

class WeatherBlocBloc extends Bloc<WeatherBlockEvent, WeatherBlockState>{
  WeatherBlocBloc(): super(WeatherBlocInitial()){
    on<FetchWeather>((event, emit) async{
      emit(WeatherBlocLoading());

      try{
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);
        print('The weather is $weather');
        emit(WeatherBlocSuccess(weather));

      }
      catch(e){
        emit(WeatherBlocFailure());
      }

    });
  }


}