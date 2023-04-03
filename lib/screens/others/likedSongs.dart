// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/library_widget.dart';
import 'package:tunesta/utils/utilities.dart';

class LikedSongs extends StatefulWidget {
  const LikedSongs({super.key});

  @override
  State<LikedSongs> createState() => _LikedSongsState();
}

class _LikedSongsState extends State<LikedSongs> {
  bool _isPlayingSong = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade2,
      //floatingActionButton: const PlayerButton(),
      body: CustomScrollView(
        slivers: [
          // back button to go back
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
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
                              Icons.download_rounded,
                              size: 28,
                            )),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_isPlayingSong == true) {
                                _isPlayingSong = false;
                              } else {
                                _isPlayingSong = true;
                              }
                            });
                          },
                          child: _isPlayingSong
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: CustomColors.colorShade3,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: const Icon(
                                    Icons.pause_rounded,
                                    size: 32,
                                  ))
                              : Container(
                                  decoration: BoxDecoration(
                                    color: CustomColors.colorShade3,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                    size: 32,
                                  )),
                        ),
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

          // Shows the list of songs in the User Liked
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

          // Shows the created Playlists
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

                // Followed Artists List
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
