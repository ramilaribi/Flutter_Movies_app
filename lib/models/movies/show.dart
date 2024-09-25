import 'image_data.dart';
import 'schedule.dart';
import 'rating.dart';
import 'network.dart';
import 'web_channel.dart';
import 'externals.dart';
import 'links.dart';

class Show {
  final int id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final WebChannel? webChannel;
  final String? dvdCountry;
  final Externals? externals;
  final ImageData? image;
  final String? summary;
  final int? updated;
  final Links? links;

  Show({
    required this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int,
      url: json['url'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      language: json['language'] as String?,
      genres: List<String>.from(json['genres'] ?? []),
      status: json['status'] as String?,
      runtime: json['runtime'] as int?,
      averageRuntime: json['averageRuntime'] as int?,
      premiered: json['premiered'] as String?,
      ended: json['ended'] as String?,
      officialSite: json['officialSite'] as String?,
      schedule: json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'] as int?,
      network: json['network'] != null ? Network.fromJson(json['network']) : null,
      webChannel: json['webChannel'] != null ? WebChannel.fromJson(json['webChannel']) : null,
      dvdCountry: json['dvdCountry'] as String?,
      externals: json['externals'] != null ? Externals.fromJson(json['externals']) : null,
      image: json['image'] != null ? ImageData.fromJson(json['image']) : null,
      summary: json['summary'] as String?,
      updated: json['updated'] as int?,
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }
}
