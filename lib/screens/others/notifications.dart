import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/utils/utilities.dart';

class NotficationPage extends StatelessWidget {
  const NotficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade0,
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
        child: Column(
          children: const [
            Gap(25),
            NotificationMusics(
              musicName: "Music Name",
              musicImage: CustomImages.imageDefault,
              artistName: "Artist Name",
            ),
            Gap(20),
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
  bool _isPlayingSong = false;
  bool _isLikedSong = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: CustomColors.colorShade2,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Music Notification will contain

              // An Image of the Song/Album
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
                  // Music Name
                  Text(
                    widget.musicName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),

                  // Artist Name
                  Text(
                    widget.artistName,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              // A Playing Icon
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
                    ? const Icon(Icons.pause_rounded, size: 32)
                    : const Icon(Icons.play_arrow_rounded, size: 32),
              ),
              const Gap(12),

              // A Like Song Button
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_isLikedSong == true) {
                      _isLikedSong = false;
                    } else {
                      _isLikedSong = true;
                    }
                  });
                },
                child: _isLikedSong
                    ? const Icon(
                        Icons.favorite_rounded,
                        size: 24,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite_rounded, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
