import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/utils/utilities.dart';

class ListeningHistory extends StatefulWidget {
  const ListeningHistory({super.key});

  @override
  State<ListeningHistory> createState() => _ListeningHistoryState();
}

class _ListeningHistoryState extends State<ListeningHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      appBar: AppBar(
        backgroundColor: CustomColors.colorShade0,
        elevation: 0,
        title: const Text("Listening History"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            Gap(40),
            ListeningDate(
              date: "Today",
              itemCount: 2,
            ),
            Gap(40),
            ListeningDate(
              date: "Yesterday",
              itemCount: 4,
            ),
            Gap(40),
            ListeningDate(
              date: "Apr 7, 2023",
              itemCount: 5,
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}

class ListeningDate extends StatelessWidget {
  final String date;
  final int itemCount;
  const ListeningDate({super.key, required this.date, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Gap(20),
        SizedBox(
          height: (itemCount * 76.0),
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
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
                  const SizedBox(
                    height: 0,
                  ),
              itemCount: itemCount),
        )
      ],
    );
  }
}
