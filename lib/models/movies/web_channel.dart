import 'country.dart';

class WebChannel {
  final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  WebChannel({this.id, this.name, this.country, this.officialSite});

  factory WebChannel.fromJson(Map<String, dynamic> json) {
    return WebChannel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'] as String?,
    );
  }
}
