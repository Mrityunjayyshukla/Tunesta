// ignore_for_file: prefer_typing_uninitialized_variables, library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/library_widget.dart';
import 'package:tunesta/utils/utilities.dart';

class Blocks extends StatefulWidget {
  final blockIcon;
  final blockText;
  const Blocks({Key? key, required this.blockIcon, required this.blockText})
      : super(key: key);

  @override
  State<Blocks> createState() => _BlocksState();
}

class _BlocksState extends State<Blocks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 115,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.colorShade2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            widget.blockIcon,
            size: 32,
          ),
          Text(
            widget.blockText,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class GenreTabs extends StatefulWidget {
  final tileText;
  final tileBorderColor;
  const GenreTabs({
    Key? key,
    required this.tileText,
    required this.tileBorderColor,
  }) : super(key: key);

  @override
  State<GenreTabs> createState() => _GenreTabsState();
}

class _GenreTabsState extends State<GenreTabs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisExtent: 170,
              mainAxisSpacing: 15),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(8),
              //width: 120,
              decoration: BoxDecoration(
                  color: CustomColors.colorShade2,
                  //borderRadius: BorderRadius.circular(20),
                  border: Border(
                      left:
                          BorderSide(color: widget.tileBorderColor, width: 4))),
              child: Center(
                child: Text(
                  widget.tileText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> data = [
    'apple',
    'banana',
    'cherry',
    'durian',
    'elderberry',
    'fig',
    'grape',
    'honeydew',
    'jackfruit',
    'kiwi',
    'lemon',
    'mango',
    'nectarine',
    'orange',
    'pear',
    'quince',
    'raspberry',
    'strawberry',
    'tangerine',
    'watermelon',
  ];

  List<String> searchResults = [];

  final TextEditingController _controller = TextEditingController();

  void onSearchTextChanged(String value) {
    setState(() {
      searchResults = data
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });

    @override
    Widget build(BuildContext context, int index) {
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
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
    }
  }

  void onClearText() {
    setState(() {
      _controller.clear();
      searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade1,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: onSearchTextChanged,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: onClearText,
                  ),
                ],
              ),
            ),
            Expanded(
              child: searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(searchResults[index]),
                          onTap: () {
                            // navigate to search result page
                          },
                        );
                      },
                    )
                  : SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Gap(25),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              "Recent Searches",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Gap(20),
                          TopPlayed(
                            musicName: "Music Name",
                            artistName: "Artist Name",
                            trackImage: CustomImages.imageDefault,
                            itemCount: 8,
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
