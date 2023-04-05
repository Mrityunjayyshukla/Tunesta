// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/screens/others/album_and_artist_page.dart';
import 'package:tunesta/models/search_widgets.dart';
import 'package:tunesta/screens/others/notifications.dart';
import 'package:tunesta/utils/utilities.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color: CustomColors.colorShade0,
      //Colors.amber.withOpacity((scrollOffset / 100).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Column(
          children: [
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Tunesta",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SearchPage()));
                        },
                        child: const Icon(Icons.search),
                      ),
                      const Gap(20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotficationPage()));
                          },
                          child: const Icon(Icons.notifications_outlined))
                    ],
                  ),
                ),
              ],
            ),
            const Gap(15),
            Row(
              children: const [
                AppBarButtons(title: "Music"),
                Gap(10),
                AppBarButtons(title: "Artists"),
                Gap(10),
                AppBarButtons(title: "Albums & Playlists"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarButtons extends StatefulWidget {
  final String title;
  const AppBarButtons({Key? key, required this.title}) : super(key: key);

  @override
  State<AppBarButtons> createState() => _AppBarButtonsState();
}

class _AppBarButtonsState extends State<AppBarButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(0.25),
      ),
      child: Text(widget.title),
    );
  }
}

class ArtistsList extends StatefulWidget {
  final artistImage;
  final artistName;
  final itemLength;
  const ArtistsList(
      {Key? key,
      required this.artistImage,
      required this.artistName,
      required this.itemLength})
      : super(key: key);

  @override
  State<ArtistsList> createState() => _ArtistsListState();
}

class _ArtistsListState extends State<ArtistsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArtistWidget()));
              },
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image(
                        image: AssetImage(widget.artistImage),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                  const Gap(10),
                  Text(
                    widget.artistName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 12),
          itemCount: widget.itemLength),
    );
  }
}

class GridB extends StatefulWidget {
  final gridArtistName;
  final gridMusicName;
  final gridMusicIcon;
  final gridNumber;
  final gridInRow;
  const GridB(
      {super.key,
      required this.gridMusicName,
      required this.gridArtistName,
      required this.gridMusicIcon,
      required this.gridNumber,
      required this.gridInRow});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.667 * widget.gridInRow,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.gridInRow,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
          mainAxisExtent: 320,
        ),
        itemCount: widget.gridNumber,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: CustomColors.colorShade2,
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          image: AssetImage(
                            widget.gridMusicIcon,
                          ),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )),
                    const Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.gridMusicName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        Text(
                          widget.gridArtistName,
                          style: const TextStyle(
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
      ),
    );
  }
}

class AlbumsCard extends StatefulWidget {
  final albumImage;
  final playlistName;
  final playlistCreator;
  final itemLength;
  const AlbumsCard({
    Key? key,
    required this.albumImage,
    required this.playlistName,
    required this.playlistCreator,
    required this.itemLength,
  }) : super(key: key);

  @override
  State<AlbumsCard> createState() => _AlbumsCardState();
}

class _AlbumsCardState extends State<AlbumsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AlbumPage()));
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: AssetImage(widget.albumImage),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    widget.playlistName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Gap(5),
                  Text(
                    widget.playlistCreator,
                    style: const TextStyle(color: CustomColors.colorShade4),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 12),
          itemCount: widget.itemLength),
    );
  }
}

//
class AccountsButton extends StatelessWidget {
  final optionIcon;
  final optionText;
  final optionDescription;
  const AccountsButton({
    super.key,
    required this.optionIcon,
    required this.optionText,
    required this.optionDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Icon(optionIcon),
        const Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              optionText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(5),
            Text(
              optionDescription,
              style: const TextStyle(
                  color: CustomColors.colorShade4,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        )
      ]),
    );
  }
}

class AccountPageDown extends StatelessWidget {
  final optionText;
  final optionDescription;
  const AccountPageDown({
    super.key,
    required this.optionText,
    required this.optionDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              optionText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(5),
            Text(
              optionDescription,
              style: const TextStyle(
                  color: CustomColors.colorShade4,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ],
        )
      ]),
    );
  }
}
