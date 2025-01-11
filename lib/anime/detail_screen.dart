import 'package:apis/anime/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailScreen extends StatelessWidget {
  final Anime anime;
  const DetailScreen({required this.anime, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            title: Text(
              anime.title,
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Iconsax.arrow_left_2,
                  color: Colors.white,
                )),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Hero(
                  tag: anime.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.network(
                        anime.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                anime.title,
                style: GoogleFonts.poppins(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Ranking: ${anime.ranking}',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Episodes: ${anime.episodes}',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Genres: ${anime.genres.join(', ')}',
                style: GoogleFonts.poppins(color: Colors.grey[300]),
              ),
              const SizedBox(height: 8),
              Text(
                'Status: ${anime.status}',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  anime.synopsis,
                  style: GoogleFonts.poppins(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
