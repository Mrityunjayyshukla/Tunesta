import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: CustomColors.colorShade2,
          elevation: 0,
          expandedHeight: 150,
          floating: true,
          pinned: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              "Charts",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [CustomColors.colorShade2, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Gap(40),

                  // Top Trending Musics
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Top Music",
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
                      gridInRow: 3),
                  Gap(40),

                  // Top Trending Artists
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Top Artists",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(25),
                  ArtistsList(
                    artistImage: CustomImages.imageDefault,
                    artistName: "Artist Name",
                    itemLength: 10,
                  ),
                  Gap(40),

                  // Trending Original Albums
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Most Played Albums",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(25),
                  AlbumsCard(
                    albumImage: CustomImages.imageDefault,
                    playlistName: "Album Name",
                    playlistCreator: "ArtistName",
                    itemLength: 6,
                  ),
                  Gap(50),
                ]),
          ),
        ),
      ]),
    );
  }
}
