import 'package:apis/anime/detail_screen.dart';
import 'package:apis/anime/models/anime.dart';
import 'package:apis/anime/services/anime_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AnimeList extends StatefulWidget {
  const AnimeList({super.key});

  @override
  State<AnimeList> createState() => AnimeListState();
}

class AnimeListState extends State<AnimeList> {
  final AnimeService animeService = AnimeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          title: Text(
            "flutter_devote",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder<List<Anime>>(
        future: animeService.fetchAnimeList(search: "Naruto"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(color: Colors.white),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: GoogleFonts.poppins(color: Colors.redAccent),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No anime found',
                style: GoogleFonts.poppins(color: Colors.grey[300]),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final anime = snapshot.data![index];
                return ListTile(
                  leading: Hero(
                    tag: anime.id,
                    child: Image.network(
                      anime.image,
                      width: 50,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    anime.title,
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Ranking: ${anime.ranking}',
                    style: GoogleFonts.poppins(color: Colors.lightBlueAccent),
                  ),
                  trailing: Icon(
                    Iconsax.arrow_right_3,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(anime: anime),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
