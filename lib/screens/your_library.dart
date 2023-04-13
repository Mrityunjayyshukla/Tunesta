import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/library_widget.dart';
import 'package:tunesta/screens/others/likedSongs.dart';
import 'package:tunesta/utils/utilities.dart';
import 'package:tunesta/utils/variables.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    final screensizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,

      appBar: AppBar(
        backgroundColor: CustomColors.colorShade0,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Your Library",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(100),

              // Introduction Text for Your Library
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Hello, Joseph Joestar!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(25),

              // Liked Songs Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LikedSongs()));
                },
                child: Center(
                  child: Container(
                      width: screensizewidth - 40,
                      height: 80,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(colors: [
                          CustomColors.colorShade2,
                          CustomColors.colorShade3,
                        ]),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.favorite_border),
                            Gap(10),
                            Text(
                              "Liked Songs",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const Gap(40),

              // Created Playlists
              // Shows the Playlists created by the user
              isPlaylistMade
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Created Playlists",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              isPlaylistMade ? const Gap(25) : const SizedBox.shrink(),
              isPlaylistMade
                  ? const AlbumsCard(
                      albumImage: CustomImages.imageDefault,
                      playlistName: "Playlist Name",
                      playlistCreator: "Playlist Creator",
                      itemLength: 8)
                  : const SizedBox.shrink(),
              isPlaylistMade ? const Gap(40) : const SizedBox.shrink(),

              // Liked Albums
              // Shows the Albums user liked
              isLikedPlaylist
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Liked Playlists",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              isLikedPlaylist ? const Gap(25) : const SizedBox.shrink(),
              isLikedPlaylist
                  ? const AlbumsCard(
                      albumImage: CustomImages.imageDefault,
                      playlistName: "Playlist Name",
                      playlistCreator: "Playlist Creator",
                      itemLength: 2)
                  : const SizedBox.shrink(),
              isLikedPlaylist ? const Gap(40) : const SizedBox.shrink(),

              // Artists you Follow
              // Shows the List of artists who are
              // followed by the user
              isFollowingArtist
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "Artists you follow",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              isFollowingArtist ? const Gap(25) : const SizedBox.shrink(),
              isFollowingArtist
                  ? const ArtistsList(
                      artistImage: CustomImages.imageDefault,
                      artistName: "Artist Name",
                      itemLength: 6)
                  : const SizedBox.shrink(),
              isFollowingArtist ? const Gap(40) : const SizedBox.shrink(),

              // Top 5 Most Played
              // The App will keep track of 5 most played music
              // by the user and those most played 5 songs will
              // be displayed here
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Top 5 Most Played",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(25),
              const TopPlayed(
                musicName: "Music Name",
                artistName: "Artist Name",
                trackImage: CustomImages.imageDefault,
                itemCount: 5,
              ),
              const Gap(40)
            ],
          ),
        ),
      ),
    );
  }
}
