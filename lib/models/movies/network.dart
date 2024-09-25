import 'country.dart';

class Network {
  final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'] as int?,
      name: json['name'] as String?,
      country: json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'] as String?,
    );
  }
}
