// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/utils/utilities.dart';

class TopPlayed extends StatelessWidget {
  final musicName;
  final artistName;
  final trackImage;
  final itemCount;
  const TopPlayed({
    super.key,
    required this.musicName,
    required this.artistName,
    required this.trackImage,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (itemCount * 76.0),
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Gap(20),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const Image(
                            image: AssetImage(
                              CustomImages.imageDefault,
                            ),
                            width: 60,
                            height: 60,
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
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                height: 0,
              ),
          itemCount: itemCount),
    );
  }
}
