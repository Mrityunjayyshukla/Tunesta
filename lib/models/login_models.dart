// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables, file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TestWidget extends StatefulWidget {
  final buttonColor;
  final textColor;
  final IconData? titleIcon;
  final titleText;

  const TestWidget({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.titleIcon,
    required this.titleText,
  }) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.titleIcon,
            color: widget.textColor,
          ),
          const Gap(12),
          Text(
            widget.titleText,
            style: TextStyle(
              color: widget.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
