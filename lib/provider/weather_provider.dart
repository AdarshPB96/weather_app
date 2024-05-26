import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/constants/widgets/error_toast.dart';
import 'package:weather_app/models/daily_forecast.dart';
import 'package:weather_app/controllers/weather_controller.dart';

class WeatherProvider extends ChangeNotifier {
  Position? _currentPosition;
  List<DailyForecast>? _weatherForecasts;
  bool _isLocationPermissionGranted = false;
  Position? get currentPosition => _currentPosition;
  bool get isLocationPermissionGranted => _isLocationPermissionGranted;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // String? _city;
  Map<String, String>? _areadetails;
  get areadetails => _areadetails;

  List<DailyForecast>? get weatherForecasts => _weatherForecasts;

  Future<void> fetchCurrentLocation() async {
    _isLoading = true;
    notifyListeners();
    try {
      LocationPermission permission = await _checkLocationPermission();
      if (permission == LocationPermission.denied) {
        permission = await _requestLocationPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        print("Location permission is permanently denied.");
        _isLoading = false;
        notifyListeners();
        return;
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        _isLocationPermissionGranted = true;
        _currentPosition = await Geolocator.getCurrentPosition();
        notifyListeners();

        await fetchWeatherDetails();
      }
    } catch (e) {
      showErrorToast(e.toString());
    }
  }

  Future<LocationPermission> _checkLocationPermission() async {
    return await Geolocator.checkPermission();
  }

  Future<LocationPermission> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print("Location permission is denied.");
    }
    return permission;
  }

  Future<void> fetchWeatherDetails() async {
    if (_currentPosition != null) {
      try {
        final locationDetails = await WeatherService().getGeoPosition(
            _currentPosition!.latitude, _currentPosition!.longitude);
        if (locationDetails != null) {
          final weatherForecasts =
              await WeatherService().getWeatherForecasts(locationDetails.key);
          _areadetails = {
            "district": locationDetails.administrativeArea,
            "locality": locationDetails.localizedName,
            'city': locationDetails.parentCity
          };
          _weatherForecasts = weatherForecasts;
          notifyListeners();
        }
      } catch (e) {
        showErrorToast(e.toString()); 
      }
    }
    _isLoading = false;
    notifyListeners();
  }
}
