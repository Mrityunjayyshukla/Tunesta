import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/utils/utilities.dart';

import '../models/custom_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        //backgroundColor: const Color(0xFF230438),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 122.0),
          child: CustomAppBar(scrollOffset: _scrollOffset),
        ),

        //body
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [CustomColors.colorShade2, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Welcome Joseph Joestar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Gap(5),
                    Text(
                      "Here's some music to get you Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: CustomColors.colorShade4),
                    ),
                    Gap(10),
                  ],
                ),
              ),
              const ArtistsList(
                artistImage: CustomImages.imageDefault,
                artistName: "Artist Name",
                itemLength: 10,
              ),
              const Gap(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("Recommended for You",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              const Gap(20),
              const GridB(
                  gridMusicName: "Music Name",
                  gridArtistName: "Artist Name",
                  gridMusicIcon: CustomImages.imageDefault,
                  gridNumber: 15,
                  gridInRow: 3),
              const Gap(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("Artists You Like",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              const Gap(20),
              const ArtistsList(
                  artistImage: CustomImages.imageDefault,
                  artistName: "Artist Name",
                  itemLength: 6),
              const Gap(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("Created Playlists",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              const Gap(20),
              const AlbumsCard(
                  albumImage: CustomImages.imageDefault,
                  playlistName: "Playlist Name",
                  playlistCreator: "Joseph Joestar",
                  itemLength: 8),
              const Gap(40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("Top Charts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              const Gap(20),
              const AlbumsCard(
                  albumImage: CustomImages.imageDefault,
                  playlistName: "Playlist Name",
                  playlistCreator: "",
                  itemLength: 6),
              const Gap(40),
            ]),
          ),
        ));
  }
}
