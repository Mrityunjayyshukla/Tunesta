// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/search_widgets.dart';
import 'package:tunesta/screens/others/charts.dart';
import 'package:tunesta/screens/others/genre.dart';
import 'package:tunesta/screens/others/new_releases.dart';
import 'package:tunesta/utils/utilities.dart';

class SearchPageVal extends StatelessWidget {
  const SearchPageVal({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,

      // Appbar contains search bar
      // When clicked on search bar, it will take to search option
      // and the songs, artists and albums can be searched
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade0,
        title: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              Row(
                children: const [
                  Icon(Icons.search),
                  Gap(10),
                  Text(
                    "Search Songs, Albums, Artists",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
        automaticallyImplyLeading: false,
      ),

      //body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // New Releases
                  // Shows newly released songs and albums
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewReleasesPage()));
                    },
                    child: const Blocks(
                        blockIcon: Icons.playlist_add,
                        blockText: "New Releases"),
                  ),

                  // Genres
                  // User can explore various music genres
                  GestureDetector(
                    child: const Blocks(
                        blockIcon: Icons.mood, blockText: "Genres"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GenreScreen()));
                    },
                  ),

                  // Charts
                  // Shows top trending songs, artists and albums
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChartsPage()));
                    },
                    child: const Blocks(
                        blockIcon: Icons.show_chart, blockText: "Charts"),
                  ),
                ],
              ),
            ),
            const Gap(40),

            // New Albums And Singles
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "New Albums & Singles",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(25),
            const AlbumsCard(
              albumImage: CustomImages.imageDefault,
              playlistName: "Playlist Name",
              playlistCreator: "Playlist Creator",
              itemLength: 5,
            ),
            const Gap(40),

            // Moods and Genres
            // so that the user can explore various
            // categories of music
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Moods & Genres",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(25),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GenrePages()));
              },
              child: const GenreTabs(
                tileText: "Hello World",
                tileBorderColor: Colors.yellow,
              ),
            ),
            const Gap(40),

            // List Of Trending Songs on the App
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Trending",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const Gap(25),
            const GridB(
                gridMusicName: "Music Name",
                gridArtistName: "Artist Name",
                gridMusicIcon: CustomImages.imageDefault,
                gridNumber: 12,
                gridInRow: 3),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
