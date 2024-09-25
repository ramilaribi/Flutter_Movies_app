class Country {
  final String? name;
  final String? code;
  final String? timezone;

  Country({this.name, this.code, this.timezone});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String?,
      code: json['code'] as String?,
      timezone: json['timezone'] as String?,
    );
  }
}
