class LocationDetails {
  final String key;
  final String localizedName;
  final String englishName;
  final String administrativeArea;
  final String country;

  final bool isAlias;
  final String parentCity;
  final String supplementalAdminAreas;

  LocationDetails({
    required this.key,
    required this.localizedName,
    required this.englishName,
    required this.administrativeArea,
    required this.country,

    required this.isAlias,
    required this.parentCity,
    required this.supplementalAdminAreas,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) {
    return LocationDetails(
      key: json['Key'],
      localizedName: json['LocalizedName'],
      englishName: json['EnglishName'],
      administrativeArea: json['AdministrativeArea']['LocalizedName'],
      country: json['Country']['LocalizedName'],
    
      isAlias: json['IsAlias'],
      parentCity: json['ParentCity']['LocalizedName'],
      supplementalAdminAreas: json['SupplementalAdminAreas'][0]['LocalizedName'],
    );
  }
}