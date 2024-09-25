class Externals {
  final String? tvrage;
  final int? thetvdb;
  final String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'] as String?,
      thetvdb: json['thetvdb'] as int?,
      imdb: json['imdb'] as String?,
    );
  }
}
