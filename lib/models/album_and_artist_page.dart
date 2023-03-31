// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/main.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class AlbumPage extends StatefulWidget {
  final playlistItemNo;
  final playlistImage;
  const AlbumPage({
    Key? key,
    required this.playlistItemNo,
    required this.playlistImage,
  }) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    return Scaffold(
      floatingActionButton: const PlayerButton(),
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade2,
        title: const Text("Playlist Name"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: AssetImage(widget.playlistImage),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(25),
              const Text(
                "Playlist Title",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.download_outlined),
                  const Gap(32),
                  const Icon(Icons.add_to_photos_outlined),
                  const Gap(32),
                  GestureDetector(
                    onTap: () {
                      if (isPlaying == false) {
                        setState(() {
                          isPlaying = true;
                        });
                      } else {
                        setState(() {
                          isPlaying = false;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: CustomColors.colorShade3,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        Icons.play_arrow_outlined,
                        size: 32,
                      ),
                    ),
                  ),
                  const Gap(32),
                  const Icon(Icons.send_outlined),
                  const Gap(32),
                  const Icon(Icons.more_vert),
                ],
              ),
              const Gap(40),
              SizedBox(
                height: (widget.playlistItemNo * 78.0),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: CustomColors.colorShade1,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: const Image(
                                      image: AssetImage(
                                        CustomImages.imageDefault,
                                      ),
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )),
                                const Gap(12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "Music Name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "Artist Name",
                                      style: TextStyle(
                                          color: CustomColors.colorShade4,
                                          fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Icon(Icons.more_vert)
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 12),
                    itemCount: widget.playlistItemNo),
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Related Playlists",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                ],
              ),
              const Gap(25),
              const AlbumsCard(
                  albumImage: CustomImages.imageDefault,
                  playlistName: "Playlist Name",
                  playlistCreator: "12 Songs",
                  itemLength: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistWidget extends StatefulWidget {
  const ArtistWidget({super.key});

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  bool isfollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PlayerButton(),
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade2,
        title: const Text("Artist Name"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(150),
              const Center(
                child: Text(
                  "Artist Name",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isfollowing == true) {
                        setState(() {
                          isfollowing = false;
                        });
                      } else {
                        setState(() {
                          isfollowing = true;
                        });
                      }
                    },
                    child: ButtonIconText(
                        buttonIcon: Icons.perm_identity,
                        buttonText: isfollowing ? "Following" : "Follow"),
                  ),
                  const Gap(20),
                  const ButtonIconText(
                      buttonIcon: Icons.shuffle, buttonText: "Shuffle Play"),
                ],
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColors.colorShade4),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("More"),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const GridB(
                  gridMusicName: "Music Name",
                  gridArtistName: "Artust Name",
                  gridMusicIcon: CustomImages.imageDefault,
                  gridNumber: 6,
                  gridInRow: 3),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Albums",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColors.colorShade4),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("More"),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const AlbumsCard(
                  albumImage: CustomImages.imageDefault,
                  playlistName: "Playlist Name",
                  playlistCreator: "Playlist Creator",
                  itemLength: 4),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Singles",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomColors.colorShade4),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(8),
                      child: const Text("More"),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const AlbumsCard(
                  albumImage: CustomImages.imageDefault,
                  playlistName: "Playlist Name",
                  playlistCreator: "Playlist Creator",
                  itemLength: 4),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "More Artists",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const ArtistsList(
                artistImage: CustomImages.imageDefault,
                artistName: "Artist Name",
                itemLength: 5,
              ),
              const Gap(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "About the Artist",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text("Lorem Ipsum"),
              ),
              const Gap(100),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonIconText extends StatelessWidget {
  final buttonIcon;
  final buttonText;
  const ButtonIconText({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: CustomColors.colorShade3,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(buttonIcon),
          const Gap(12),
          Text(
            buttonText,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
