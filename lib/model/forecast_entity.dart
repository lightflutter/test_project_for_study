import 'package:test_project_for_study/generated/json/base/json_field.dart';
import 'package:test_project_for_study/generated/json/forecast_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ForecastEntity {
	late String cod;
	late int message;
	late int cnt;
	late List<ForecastList> list;
	late ForecastCity city;

	ForecastEntity();

	factory ForecastEntity.fromJson(Map<String, dynamic> json) => $ForecastEntityFromJson(json);

	Map<String, dynamic> toJson() => $ForecastEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastList {
	late int dt;
	late ForecastListMain main;
	late List<ForecastListWeather> weather;
	late ForecastListClouds clouds;
	late ForecastListWind wind;
	late int visibility;
	late int pop;
	late ForecastListSys sys;
	@JSONField(name: "dt_txt")
	late String dtTxt;

	ForecastList();

	factory ForecastList.fromJson(Map<String, dynamic> json) => $ForecastListFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastListMain {
	late double temp;
	@JSONField(name: "feels_like")
	late double feelsLike;
	@JSONField(name: "temp_min")
	late double tempMin;
	@JSONField(name: "temp_max")
	late double tempMax;
	late int pressure;
	@JSONField(name: "sea_level")
	late int seaLevel;
	@JSONField(name: "grnd_level")
	late int grndLevel;
	late int humidity;
	@JSONField(name: "temp_kf")
	late double tempKf;

	ForecastListMain();

	factory ForecastListMain.fromJson(Map<String, dynamic> json) => $ForecastListMainFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListMainToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastListWeather {
	late int id;
	late String main;
	late String description;
	late String icon;

	ForecastListWeather();

	factory ForecastListWeather.fromJson(Map<String, dynamic> json) => $ForecastListWeatherFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListWeatherToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastListClouds {
	late int all;

	ForecastListClouds();

	factory ForecastListClouds.fromJson(Map<String, dynamic> json) => $ForecastListCloudsFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListCloudsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastListWind {
	late double speed;
	late int deg;
	late double gust;

	ForecastListWind();

	factory ForecastListWind.fromJson(Map<String, dynamic> json) => $ForecastListWindFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListWindToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastListSys {
	late String pod;

	ForecastListSys();

	factory ForecastListSys.fromJson(Map<String, dynamic> json) => $ForecastListSysFromJson(json);

	Map<String, dynamic> toJson() => $ForecastListSysToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastCity {
	late int id;
	late String name;
	late ForecastCityCoord coord;
	late String country;
	late int population;
	late int timezone;
	late int sunrise;
	late int sunset;

	ForecastCity();

	factory ForecastCity.fromJson(Map<String, dynamic> json) => $ForecastCityFromJson(json);

	Map<String, dynamic> toJson() => $ForecastCityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ForecastCityCoord {
	late double lat;
	late double lon;

	ForecastCityCoord();

	factory ForecastCityCoord.fromJson(Map<String, dynamic> json) => $ForecastCityCoordFromJson(json);

	Map<String, dynamic> toJson() => $ForecastCityCoordToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}