class Anime {
  final String id;
  final String title;
  final List<String> alternativeTitles;
  final int ranking;
  final List<String> genres;
  final int episodes;
  final String image;
  final String status;
  final String synopsis;
  final String type;

  Anime({
    required this.id,
    required this.title,
    required this.alternativeTitles,
    required this.ranking,
    required this.genres,
    required this.episodes,
    required this.image,
    required this.status,
    required this.synopsis,
    required this.type,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['_id'],
      title: json['title'],
      alternativeTitles: List<String>.from(json['alternativeTitles']),
      ranking: json['ranking'],
      genres: List<String>.from(json['genres']),
      episodes: json['episodes'],
      image: json['image'],
      status: json['status'],
      synopsis: json['synopsis'],
      type: json['type'],
    );
  }
}
