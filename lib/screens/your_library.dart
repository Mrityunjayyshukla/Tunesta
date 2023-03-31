import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/models/library_widget.dart';
import 'package:tunesta/screens/other_screens.dart';
import 'package:tunesta/utils/utilities.dart';

class YourLibrary extends StatefulWidget {
  const YourLibrary({super.key});

  @override
  State<YourLibrary> createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  @override
  Widget build(BuildContext context) {
    final screensizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade2,
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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.perm_identity,
                          size: 25,
                        ),
                      ),
                      const Gap(10),
                      const Text(
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
                        child: const Center(
                          child: Text(
                            "Liked Songs",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),
                ),
                const Gap(40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Created Playlists",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(25),
                const AlbumsCard(
                    albumImage: CustomImages.imageDefault,
                    playlistName: "Playlist Name",
                    playlistCreator: "Playlist Creator",
                    itemLength: 8),
                const Gap(40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Artists you follow",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(25),
                const ArtistsList(
                    artistImage: CustomImages.imageDefault,
                    artistName: "Artist Name",
                    itemLength: 6),
                const Gap(40),
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
      ),
    );
  }
}
