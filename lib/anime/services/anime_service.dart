import 'dart:convert';
import 'package:apis/anime/models/anime.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  final String baseUrl = 'anime-db.p.rapidapi.com';
  final String path = '/anime';

  final Map<String, String> headers = {
    'x-rapidapi-key': '744d00017fmshf7724215ca19740p12b0d6jsnd6045a9af933',
    'x-rapidapi-host': 'anime-db.p.rapidapi.com'
  };

  Future<List<Anime>> fetchAnimeList({
    int page = 1,
    int size = 10,
    String? search,
    String? genres,
    String sortBy = 'ranking',
    String sortOrder = 'asc',
  }) async {
    final uri = Uri.https(baseUrl, path, {
      'page': page.toString(),
      'size': size.toString(),
      if (search != null) 'search': search,
      if (genres != null) 'genres': genres,
      'sortBy': sortBy,
      'sortOrder': sortOrder,
    });

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      final List<dynamic> data = jsonResponse['data'] ?? [];

      return data.map((animeJson) => Anime.fromJson(animeJson)).toList();
    } else {
      throw Exception('Failed to fetch anime list: ${response.reasonPhrase}');
    }
  }
}
