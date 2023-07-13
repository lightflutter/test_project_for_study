import 'package:test_project_for_study/generated/json/base/json_convert_content.dart';
import 'package:test_project_for_study/model/forecast_entity.dart';

ForecastEntity $ForecastEntityFromJson(Map<String, dynamic> json) {
	final ForecastEntity forecastEntity = ForecastEntity();
	final String? cod = jsonConvert.convert<String>(json['cod']);
	if (cod != null) {
		forecastEntity.cod = cod;
	}
	final int? message = jsonConvert.convert<int>(json['message']);
	if (message != null) {
		forecastEntity.message = message;
	}
	final int? cnt = jsonConvert.convert<int>(json['cnt']);
	if (cnt != null) {
		forecastEntity.cnt = cnt;
	}
	final List<ForecastList>? list = jsonConvert.convertListNotNull<ForecastList>(json['list']);
	if (list != null) {
		forecastEntity.list = list;
	}
	final ForecastCity? city = jsonConvert.convert<ForecastCity>(json['city']);
	if (city != null) {
		forecastEntity.city = city;
	}
	return forecastEntity;
}

Map<String, dynamic> $ForecastEntityToJson(ForecastEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['cod'] = entity.cod;
	data['message'] = entity.message;
	data['cnt'] = entity.cnt;
	data['list'] =  entity.list.map((v) => v.toJson()).toList();
	data['city'] = entity.city.toJson();
	return data;
}

ForecastList $ForecastListFromJson(Map<String, dynamic> json) {
	final ForecastList forecastList = ForecastList();
	final int? dt = jsonConvert.convert<int>(json['dt']);
	if (dt != null) {
		forecastList.dt = dt;
	}
	final ForecastListMain? main = jsonConvert.convert<ForecastListMain>(json['main']);
	if (main != null) {
		forecastList.main = main;
	}
	final List<ForecastListWeather>? weather = jsonConvert.convertListNotNull<ForecastListWeather>(json['weather']);
	if (weather != null) {
		forecastList.weather = weather;
	}
	final ForecastListClouds? clouds = jsonConvert.convert<ForecastListClouds>(json['clouds']);
	if (clouds != null) {
		forecastList.clouds = clouds;
	}
	final ForecastListWind? wind = jsonConvert.convert<ForecastListWind>(json['wind']);
	if (wind != null) {
		forecastList.wind = wind;
	}
	final int? visibility = jsonConvert.convert<int>(json['visibility']);
	if (visibility != null) {
		forecastList.visibility = visibility;
	}
	final int? pop = jsonConvert.convert<int>(json['pop']);
	if (pop != null) {
		forecastList.pop = pop;
	}
	final ForecastListSys? sys = jsonConvert.convert<ForecastListSys>(json['sys']);
	if (sys != null) {
		forecastList.sys = sys;
	}
	final String? dtTxt = jsonConvert.convert<String>(json['dt_txt']);
	if (dtTxt != null) {
		forecastList.dtTxt = dtTxt;
	}
	return forecastList;
}

Map<String, dynamic> $ForecastListToJson(ForecastList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['dt'] = entity.dt;
	data['main'] = entity.main.toJson();
	data['weather'] =  entity.weather.map((v) => v.toJson()).toList();
	data['clouds'] = entity.clouds.toJson();
	data['wind'] = entity.wind.toJson();
	data['visibility'] = entity.visibility;
	data['pop'] = entity.pop;
	data['sys'] = entity.sys.toJson();
	data['dt_txt'] = entity.dtTxt;
	return data;
}

ForecastListMain $ForecastListMainFromJson(Map<String, dynamic> json) {
	final ForecastListMain forecastListMain = ForecastListMain();
	final double? temp = jsonConvert.convert<double>(json['temp']);
	if (temp != null) {
		forecastListMain.temp = temp;
	}
	final double? feelsLike = jsonConvert.convert<double>(json['feels_like']);
	if (feelsLike != null) {
		forecastListMain.feelsLike = feelsLike;
	}
	final double? tempMin = jsonConvert.convert<double>(json['temp_min']);
	if (tempMin != null) {
		forecastListMain.tempMin = tempMin;
	}
	final double? tempMax = jsonConvert.convert<double>(json['temp_max']);
	if (tempMax != null) {
		forecastListMain.tempMax = tempMax;
	}
	final int? pressure = jsonConvert.convert<int>(json['pressure']);
	if (pressure != null) {
		forecastListMain.pressure = pressure;
	}
	final int? seaLevel = jsonConvert.convert<int>(json['sea_level']);
	if (seaLevel != null) {
		forecastListMain.seaLevel = seaLevel;
	}
	final int? grndLevel = jsonConvert.convert<int>(json['grnd_level']);
	if (grndLevel != null) {
		forecastListMain.grndLevel = grndLevel;
	}
	final int? humidity = jsonConvert.convert<int>(json['humidity']);
	if (humidity != null) {
		forecastListMain.humidity = humidity;
	}
	final double? tempKf = jsonConvert.convert<double>(json['temp_kf']);
	if (tempKf != null) {
		forecastListMain.tempKf = tempKf;
	}
	return forecastListMain;
}

Map<String, dynamic> $ForecastListMainToJson(ForecastListMain entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['temp'] = entity.temp;
	data['feels_like'] = entity.feelsLike;
	data['temp_min'] = entity.tempMin;
	data['temp_max'] = entity.tempMax;
	data['pressure'] = entity.pressure;
	data['sea_level'] = entity.seaLevel;
	data['grnd_level'] = entity.grndLevel;
	data['humidity'] = entity.humidity;
	data['temp_kf'] = entity.tempKf;
	return data;
}

ForecastListWeather $ForecastListWeatherFromJson(Map<String, dynamic> json) {
	final ForecastListWeather forecastListWeather = ForecastListWeather();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		forecastListWeather.id = id;
	}
	final String? main = jsonConvert.convert<String>(json['main']);
	if (main != null) {
		forecastListWeather.main = main;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		forecastListWeather.description = description;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		forecastListWeather.icon = icon;
	}
	return forecastListWeather;
}

Map<String, dynamic> $ForecastListWeatherToJson(ForecastListWeather entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['main'] = entity.main;
	data['description'] = entity.description;
	data['icon'] = entity.icon;
	return data;
}

ForecastListClouds $ForecastListCloudsFromJson(Map<String, dynamic> json) {
	final ForecastListClouds forecastListClouds = ForecastListClouds();
	final int? all = jsonConvert.convert<int>(json['all']);
	if (all != null) {
		forecastListClouds.all = all;
	}
	return forecastListClouds;
}

Map<String, dynamic> $ForecastListCloudsToJson(ForecastListClouds entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['all'] = entity.all;
	return data;
}

ForecastListWind $ForecastListWindFromJson(Map<String, dynamic> json) {
	final ForecastListWind forecastListWind = ForecastListWind();
	final double? speed = jsonConvert.convert<double>(json['speed']);
	if (speed != null) {
		forecastListWind.speed = speed;
	}
	final int? deg = jsonConvert.convert<int>(json['deg']);
	if (deg != null) {
		forecastListWind.deg = deg;
	}
	final double? gust = jsonConvert.convert<double>(json['gust']);
	if (gust != null) {
		forecastListWind.gust = gust;
	}
	return forecastListWind;
}

Map<String, dynamic> $ForecastListWindToJson(ForecastListWind entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['speed'] = entity.speed;
	data['deg'] = entity.deg;
	data['gust'] = entity.gust;
	return data;
}

ForecastListSys $ForecastListSysFromJson(Map<String, dynamic> json) {
	final ForecastListSys forecastListSys = ForecastListSys();
	final String? pod = jsonConvert.convert<String>(json['pod']);
	if (pod != null) {
		forecastListSys.pod = pod;
	}
	return forecastListSys;
}

Map<String, dynamic> $ForecastListSysToJson(ForecastListSys entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['pod'] = entity.pod;
	return data;
}

ForecastCity $ForecastCityFromJson(Map<String, dynamic> json) {
	final ForecastCity forecastCity = ForecastCity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		forecastCity.id = id;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		forecastCity.name = name;
	}
	final ForecastCityCoord? coord = jsonConvert.convert<ForecastCityCoord>(json['coord']);
	if (coord != null) {
		forecastCity.coord = coord;
	}
	final String? country = jsonConvert.convert<String>(json['country']);
	if (country != null) {
		forecastCity.country = country;
	}
	final int? population = jsonConvert.convert<int>(json['population']);
	if (population != null) {
		forecastCity.population = population;
	}
	final int? timezone = jsonConvert.convert<int>(json['timezone']);
	if (timezone != null) {
		forecastCity.timezone = timezone;
	}
	final int? sunrise = jsonConvert.convert<int>(json['sunrise']);
	if (sunrise != null) {
		forecastCity.sunrise = sunrise;
	}
	final int? sunset = jsonConvert.convert<int>(json['sunset']);
	if (sunset != null) {
		forecastCity.sunset = sunset;
	}
	return forecastCity;
}

Map<String, dynamic> $ForecastCityToJson(ForecastCity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['coord'] = entity.coord.toJson();
	data['country'] = entity.country;
	data['population'] = entity.population;
	data['timezone'] = entity.timezone;
	data['sunrise'] = entity.sunrise;
	data['sunset'] = entity.sunset;
	return data;
}

ForecastCityCoord $ForecastCityCoordFromJson(Map<String, dynamic> json) {
	final ForecastCityCoord forecastCityCoord = ForecastCityCoord();
	final double? lat = jsonConvert.convert<double>(json['lat']);
	if (lat != null) {
		forecastCityCoord.lat = lat;
	}
	final double? lon = jsonConvert.convert<double>(json['lon']);
	if (lon != null) {
		forecastCityCoord.lon = lon;
	}
	return forecastCityCoord;
}

Map<String, dynamic> $ForecastCityCoordToJson(ForecastCityCoord entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	return data;
}