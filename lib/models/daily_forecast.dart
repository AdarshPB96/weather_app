class DailyForecast {
  final String date;
  final int epochDate;
  final Temperature temperature;
  final Day day;
  final Night night;
  final String mobileLink;
  final String link;

  DailyForecast({
    required this.date,
    required this.epochDate,
    required this.temperature,
    required this.day,
    required this.night,

    required this.mobileLink,
    required this.link,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['Date'],
      epochDate: json['EpochDate'],
      temperature: Temperature.fromJson(json['Temperature']),
      day: Day.fromJson(json['Day']),
      night: Night.fromJson(json['Night']),
 
      mobileLink: json['MobileLink'],
      link: json['Link'],
    );
  }
}

class Temperature {
  final TemperatureData minimum;
  final TemperatureData maximum;

  Temperature({required this.minimum, required this.maximum});

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      minimum: TemperatureData.fromJson(json['Minimum']),
      maximum: TemperatureData.fromJson(json['Maximum']),
    );
  }
}

class TemperatureData {
  final double value;
  final String unit;
  final int unitType;

  TemperatureData({required this.value, required this.unit, required this.unitType});

  factory TemperatureData.fromJson(Map<String, dynamic> json) {
    return TemperatureData(
      value: json['Value'],
      unit: json['Unit'],
      unitType: json['UnitType'],
    );
  }
}

class Day {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;

  Day({required this.icon, required this.iconPhrase, required this.hasPrecipitation});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
    );
  }
}

class Night {
  final int icon;
  final String iconPhrase;
  final bool hasPrecipitation;
  final String? precipitationType;
  final String? precipitationIntensity;

  Night({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
    this.precipitationType,
    this.precipitationIntensity,
  });

  factory Night.fromJson(Map<String, dynamic> json) {
    return Night(
      icon: json['Icon'],
      iconPhrase: json['IconPhrase'],
      hasPrecipitation: json['HasPrecipitation'],
      precipitationType: json['PrecipitationType'],
      precipitationIntensity: json['PrecipitationIntensity'],
    );
  }
}
