import 'self_link.dart';
import 'previous_episode_link.dart';

class Links {
  final SelfLink? self;
  final PreviousEpisodeLink? previousEpisode;

  Links({this.self, this.previousEpisode});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] != null ? SelfLink.fromJson(json['self']) : null,
      previousEpisode: json['previousepisode'] != null ? PreviousEpisodeLink.fromJson(json['previousepisode']) : null,
    );
  }
}
