import 'package:flutter/material.dart';
import 'package:tunesta/utils/utilities.dart';

class CustomScaffold extends StatefulWidget {
  final body;
  final gradient;
  const CustomScaffold({Key? key, required this.gradient, required this.body})
      : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: widget.gradient),
        child: widget.body,
      ),
    );
  }
}

class ListeningHistory extends StatefulWidget {
  const ListeningHistory({super.key});

  @override
  State<ListeningHistory> createState() => _ListeningHistoryState();
}

class _ListeningHistoryState extends State<ListeningHistory> {
  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = const LinearGradient(
        colors: [CustomColors.colorShade1, Colors.black],
        begin: FractionalOffset(0.5, 0.0),
        end: FractionalOffset(0.0, 0.5),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp);
    return CustomScaffold(
      gradient: gradient,
      body: const Text("Hello World"),
    );
  }
}
