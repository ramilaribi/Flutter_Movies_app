class PreviousEpisodeLink {
  final String? href;
  final String? name;

  PreviousEpisodeLink({this.href, this.name});

  factory PreviousEpisodeLink.fromJson(Map<String, dynamic> json) {
    return PreviousEpisodeLink(
      href: json['href'] as String?,
      name: json['name'] as String?,
    );
  }
}
