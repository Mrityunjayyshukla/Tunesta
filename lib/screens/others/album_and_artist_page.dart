// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  bool isPlayingSong = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade0,
        title: const Text("Playlist Name"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: const Image(
                image: AssetImage(CustomImages.imageDefault),
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
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: CustomColors.colorShade1,
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isPlayingSong == true) {
                              isPlayingSong = false;
                            } else {
                              isPlayingSong = true;
                            }
                          });
                        },
                        icon: isPlayingSong
                            ? const Icon(
                                Icons.pause_rounded,
                                size: 32,
                              )
                            : const Icon(
                                Icons.play_arrow_rounded,
                                size: 32,
                              ))),
                const Gap(32),
                const Icon(Icons.send_outlined),
                const Gap(32),
                const Icon(Icons.more_vert),
              ],
            ),
            const Gap(40),
            const PlaylistSongs(
                playlistImage: CustomImages.imageDefault, playlistItemNo: 8),
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
    );
  }
}

class PlaylistSongs extends StatelessWidget {
  final playlistItemNo;
  final playlistImage;
  const PlaylistSongs(
      {super.key, required this.playlistImage, required this.playlistItemNo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (playlistItemNo * 78.0),
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
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Text(
                            "Artist Name",
                            style: TextStyle(
                                color: CustomColors.colorShade4, fontSize: 12),
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
          itemCount: playlistItemNo),
    );
  }
}

class ArtistWidget extends StatefulWidget {
  const ArtistWidget({super.key});

  @override
  State<ArtistWidget> createState() => _ArtistWidgetState();
}

class _ArtistWidgetState extends State<ArtistWidget> {
  late ScrollController _scrollController;
  double _scrollOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  bool isfollowing = false;
  bool isShufflePlay = false;
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore\nmagna aliqua. Ut enim ad minim veniam, quis nostrud\nexercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur\nsint occaecat cupidatat non proident, sunt in culpa qui\nofficia deserunt mollit anim id est laborum.\n";

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColors.colorShade0,

      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70.0),
        child: CustomAppBar(scrollOffset: _scrollOffset),
      ),

      //body
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      CustomImages.imageDefault,
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                CustomColors.colorShade0
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.4, 1])),
                    ),
                    const Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        "Artist Name",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
                    GestureDetector(
                      onTap: () {
                        if (isShufflePlay == true) {
                          setState(() {
                            isShufflePlay = false;
                          });
                        } else {
                          setState(() {
                            isShufflePlay = true;
                          });
                        }
                      },
                      child: isShufflePlay
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: CustomColors.colorShade3,
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              child: Row(
                                children: const [
                                  Icon(Icons.shuffle),
                                  Gap(12),
                                  Text(
                                    "Shuffle Play",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const ButtonIconText(
                              buttonIcon: Icons.shuffle,
                              buttonText: "Shuffle Play"),
                    ),
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
                    gridArtistName: "Artist Name",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    loremIpsum,
                    textAlign: TextAlign.left,
                  ),
                ),
                const Gap(80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color: CustomColors.colorShade0
          .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ],
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
