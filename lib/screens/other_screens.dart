// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/main.dart';
import 'package:tunesta/models/album_and_artist_page.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/library_widget.dart';
import 'package:tunesta/utils/utilities.dart';

class LikedSongs extends StatelessWidget {
  const LikedSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      floatingActionButton: const PlayerButton(),
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
            //title: const Text("Liked Songs"),
            centerTitle: true,
            backgroundColor: CustomColors.colorShade2,
            elevation: 0,
            expandedHeight: 320,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Column(
                  children: [
                    const Gap(40),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: const Image(
                          height: 125,
                          width: 125,
                          fit: BoxFit.cover,
                          image: AssetImage(CustomImages.imageDefault)),
                    ),
                    const Gap(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              //color: const Color(0xFF023535),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.download_outlined,
                              size: 28,
                            )),
                        const Gap(10),
                        Container(
                            decoration: BoxDecoration(
                              color: CustomColors.colorShade3,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.play_arrow,
                              size: 40,
                            )),
                        const Gap(10),
                        Container(
                            decoration: BoxDecoration(
                              //color: const Color(0xFF023535),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.more_vert_outlined,
                              size: 28,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              title: const Text(
                "Liked Songs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1,
            ),
          ),

          //sliverbody
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  CustomColors.colorShade2,
                  CustomColors.colorShade1,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: const TopPlayed(
                musicName: "Music Name",
                artistName: "Artist Name",
                trackImage: CustomImages.imageDefault,
                itemCount: 8,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [CustomColors.colorShade1, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(children: const [
                Gap(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Created Playlists",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(25),
                AlbumsCard(
                    albumImage: CustomImages.imageDefault,
                    playlistName: "Playlist Name",
                    playlistCreator: "Playlist Creator",
                    itemLength: 8),
                Gap(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Artists you follow",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Gap(25),
                ArtistsList(
                    artistImage: CustomImages.imageDefault,
                    artistName: "Artist Name",
                    itemLength: 6),
                Gap(40),
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class NotficationPage extends StatelessWidget {
  const NotficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade2,
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            Gap(25),
            NotificationMusics(
              musicName: "Music Name",
              musicImage: CustomImages.imageDefault,
              artistName: "Artist Name",
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationMusics extends StatefulWidget {
  final String musicName;
  final String artistName;
  final String musicImage;
  const NotificationMusics({
    Key? key,
    required this.musicName,
    required this.musicImage,
    required this.artistName,
  }) : super(key: key);

  @override
  State<NotificationMusics> createState() => _NotificationMusicsState();
}

class _NotificationMusicsState extends State<NotificationMusics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CustomColors.colorShade3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: AssetImage(widget.musicImage),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.musicName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    widget.artistName,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          const Gap(25),
          Row(
            children: const [
              Icon(Icons.play_arrow_outlined, size: 32),
              Gap(20),
              Icon(Icons.favorite_outline, size: 25),
            ],
          ),
        ],
      ),
    );
  }
}

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PlayerButton(),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, CustomColors.colorShade1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
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
                    genreCategoryItemNumber: 38,
                    genreItemInARow: 4,
                  ),
                  Gap(40),
                ],
              ),
            ),
          ],
        ),
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
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
                      color: CustomColors.colorShade3,
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
      backgroundColor: CustomColors.colorShade2,
      floatingActionButton: const PlayerButton(),
      appBar: AppBar(
        title: const Text("Genre Name"),
        elevation: 0,
        backgroundColor: CustomColors.colorShade2,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}

class NewReleasesPage extends StatelessWidget {
  const NewReleasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      floatingActionButton: const PlayerButton(),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
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
              "New Releases",
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AlbumPage(
                                    playlistItemNo: 7,
                                    playlistImage: CustomImages.imageDefault)));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage(CustomImages.imageDefault),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Gap(20),
                    const Text(
                      "New Releases",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Albums and Singles",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(25),
              const AlbumsCard(
                albumImage: CustomImages.imageDefault,
                playlistName: "Playlist Name",
                playlistCreator: "ArtistName",
                itemLength: 6,
              ),
              const Gap(25),
              const GridB(
                gridMusicName: "Music Name",
                gridArtistName: "ArtistName",
                gridMusicIcon: CustomImages.imageDefault,
                gridNumber: 8,
                gridInRow: 3,
              ),
              const Gap(50),
            ]),
          ),
        ),
      ]),
    );
  }
}

class ChartsPage extends StatelessWidget {
  const ChartsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      floatingActionButton: const PlayerButton(),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
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
