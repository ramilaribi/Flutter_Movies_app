class SelfLink {
  final String? href;

  SelfLink({this.href});

  factory SelfLink.fromJson(Map<String, dynamic> json) {
    return SelfLink(
      href: json['href'] as String?,
    );
  }
}
