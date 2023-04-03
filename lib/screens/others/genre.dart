// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: CustomColors.colorShade0,
              elevation: 0,
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
              )),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                Gap(20),

                // Genres Page is divided into 3 parts
                // One is "For You" which shows Genres according
                // to what the user listens mostly
                Text(
                  "For You",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(25),
                GenrePageTabs(
                  genreName: "Workout",
                  genreColor: Colors.blueAccent,
                  genreCategoryItemNumber: 6,
                  genreItemInARow: 3,
                ),
                Gap(50),

                // Moods and Genres Shows some randomly
                // selected genres for the user
                Text(
                  "Moods and Moments",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(25),
                GenrePageTabs(
                  genreName: "Chill",
                  genreColor: Colors.purpleAccent,
                  genreCategoryItemNumber: 9,
                  genreItemInARow: 3,
                ),
                Gap(50),

                // Genres will show the Whole list of Genres
                Text(
                  "Genres",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(25),
                GenrePageTabs(
                  genreName: "Family",
                  genreColor: Colors.yellow,
                  genreCategoryItemNumber: 36,
                  genreItemInARow: 4,
                ),
                Gap(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GenrePageTabs extends StatefulWidget {
  final genreName;
  final genreColor;
  final genreCategoryItemNumber;
  final genreItemInARow;
  const GenrePageTabs({
    Key? key,
    required this.genreName,
    required this.genreColor,
    required this.genreCategoryItemNumber,
    required this.genreItemInARow,
  }) : super(key: key);

  @override
  State<GenrePageTabs> createState() => _GenrePageTabsState();
}

class _GenrePageTabsState extends State<GenrePageTabs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60.0 * widget.genreItemInARow,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: widget.genreCategoryItemNumber,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.genreItemInARow,
              crossAxisSpacing: 15,
              mainAxisExtent: 170,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GenrePages()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //width: 120,
                  decoration: BoxDecoration(
                      color: CustomColors.colorShade2,
                      //borderRadius: BorderRadius.circular(20),
                      border: Border(
                          left:
                              BorderSide(color: widget.genreColor, width: 4))),
                  child: Center(
                    child: Text(
                      widget.genreName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

class GenrePages extends StatelessWidget {
  const GenrePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      appBar: AppBar(
        title: const Text("Genre Name"),
        elevation: 0,
        backgroundColor: CustomColors.colorShade0,
      ),

      // This page shows the Songs, artists and albums
      // related to that particular genre
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Gap(40),

            // Top trending songs of that genre
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Songs",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gap(25),
            GridB(
              gridMusicName: "Music Name",
              gridArtistName: "Artist Name",
              gridMusicIcon: CustomImages.imageDefault,
              gridNumber: 12,
              gridInRow: 4,
            ),
            Gap(40),

            // Featured Playlists
            // Playlists that are related to the genres
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Featured Playlists",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gap(25),
            AlbumsCard(
              albumImage: CustomImages.imageDefault,
              playlistName: "Playlist Name",
              playlistCreator: "Playlist Creator",
              itemLength: 6,
            ),
            Gap(40),

            // Albums of the Genre
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Albums",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gap(25),
            AlbumsCard(
              albumImage: CustomImages.imageDefault,
              playlistName: "Playlist Name",
              playlistCreator: "Playlist Creator",
              itemLength: 6,
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}
