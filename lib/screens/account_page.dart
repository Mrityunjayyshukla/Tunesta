// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/screens/others/history.dart';
import 'package:tunesta/utils/utilities.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorShade0,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(120),

              // Account Page shows the account details
              // and settings of the App.

              // Profile Image, greeting, Name and e-mail
              // address of the user
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: const Image(
                  image: AssetImage(CustomImages.imageProfile),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(15),
              const Text(
                "Hello, Joseph Joestar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Gap(10),
              const Text(
                "boderekisbest@gmail.com",
                style: TextStyle(
                  color: CustomColors.colorShade4,
                  fontSize: 15,
                ),
              ),
              const Gap(50),

              // Settings for the App
              const Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Gap(25),

              // This will show the music listening History
              // of the user. (What Music the user listens to)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListeningHistory()));
                },
                child: const AccountsButton(
                  optionIcon: Icons.history,
                  optionText: "Listening History",
                  optionDescription:
                      "Listen to the songs you have previously heard",
                ),
              ),
              const Gap(25),

              // User can also download the music for offline listening
              const AccountsButton(
                optionIcon: Icons.download,
                optionText: "Downloads",
                optionDescription: "Songs you downloaded to listen offline",
              ),
              const Gap(25),

              // These contain toggles. So there are 2 elements.
              // One is the setting itself and other is the Toggle Switch

              // Allow Explicit Content (if you are 18 or above)
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AccountsButton(
                      optionIcon: Icons.explicit_outlined,
                      optionText: "Allow Explicit Content",
                      optionDescription: "Turn on to play explicit content",
                    ),
                    SwitchExample(switchDetail: true),
                  ],
                ),
              ),
              const Gap(15),

              // Autoplay next Song
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AccountsButton(
                      optionIcon: Icons.play_arrow_sharp,
                      optionText: "Autoplay",
                      optionDescription: "Play next song after finish",
                    ),
                    SwitchExample(
                      switchDetail: true,
                    ),
                  ],
                ),
              ),
              const Gap(15),

              // Limit Mobile Data Usage
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AccountsButton(
                      optionIcon: Icons.stream,
                      optionText: "Limit Mobile Data Usage",
                      optionDescription: "Set audio quality to",
                    ),
                    SwitchExample(
                      switchDetail: false,
                    ),
                  ],
                ),
              ),
              const Gap(15),

              // Playlist Update Notifications
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AccountsButton(
                      optionIcon: Icons.notifications,
                      optionText: "Playlist Update Notifications",
                      optionDescription:
                          "Notify when playlists I like are updated",
                    ),
                    SwitchExample(
                      switchDetail: false,
                    ),
                  ],
                ),
              ),
              const Gap(40),

              // This shows the about of the app
              // This includes legal documentations and licenses of the app
              const Text(
                "About",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const Gap(25),

              // Privacy Policy
              const AccountPageDown(
                optionText: "Privacy Policy",
                optionDescription: "Important for both of us",
              ),
              const Gap(25),

              // Support the Development of the App
              const AccountPageDown(
                optionText: "Support",
                optionDescription: "Get help from us and community",
              ),
              const Gap(25),

              // Open Source License of the App
              const AccountPageDown(
                optionText: "Open Source License",
                optionDescription: "License details for open source software",
              ),
              const Gap(25),

              // Log Out of the App
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const AccountPageDown(
                  optionText: "Log Out",
                  optionDescription: "Log Out from the App",
                ),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  bool switchDetail;
  SwitchExample({Key? key, required this.switchDetail}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  //bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: widget.switchDetail,
      activeColor: CustomColors.colorShade4,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          if (widget.switchDetail == true) {
            widget.switchDetail = false;
          } else {
            widget.switchDetail = true;
          }
          //widget.switchDetail = value;
        });
      },
    );
  }
}
