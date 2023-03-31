// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/search_widgets.dart';
import 'package:tunesta/screens/other_screens.dart';
import 'package:tunesta/utils/utilities.dart';

class SearchPageVal extends StatefulWidget {
  const SearchPageVal({super.key});

  @override
  State<SearchPageVal> createState() => _SearchPageValState();
}

class _SearchPageValState extends State<SearchPageVal> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade2,
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
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      //body
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
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
      ),
    );
  }
}
