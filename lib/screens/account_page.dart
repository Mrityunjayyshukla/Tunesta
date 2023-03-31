import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tunesta/models/custom_widgets.dart';
import 'package:tunesta/utils/utilities.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [CustomColors.colorShade2, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25),
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(120),
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
                const Gap(15),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.white)),
                    child: const Text(
                      "Manage your account",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                const Gap(50),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Gap(25),
                const AccountsButton(
                  optionIcon: Icons.history,
                  optionText: "Listening History",
                  optionDescription:
                      "Listen to the songs you have previously heard",
                ),
                const Gap(25),
                const AccountsButton(
                  optionIcon: Icons.download,
                  optionText: "Downloads",
                  optionDescription: "Songs you downloaded to listen offline",
                ),
                const Gap(25),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AccountsButton(
                        optionIcon: Icons.explicit_outlined,
                        optionText: "Allow Explicit Content",
                        optionDescription: "Turn on to play explicit content",
                      ),
                      SwitchExample(),
                    ],
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AccountsButton(
                        optionIcon: Icons.play_arrow_sharp,
                        optionText: "Autoplay",
                        optionDescription: "Play next song after finish",
                      ),
                      SwitchExample(),
                    ],
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AccountsButton(
                        optionIcon: Icons.stream,
                        optionText: "Limit Mobile Data Usage",
                        optionDescription: "Set audio quality to",
                      ),
                      SwitchExample(),
                    ],
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AccountsButton(
                        optionIcon: Icons.notifications,
                        optionText: "Playlist Update Notifications",
                        optionDescription:
                            "Notify when playlists I like are updated",
                      ),
                      SwitchExample(),
                    ],
                  ),
                ),
                const Gap(40),
                const Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Gap(25),
                const AccountPageDown(
                  optionText: "Privacy Policy",
                  optionDescription: "Important for both of us",
                ),
                const Gap(25),
                const AccountPageDown(
                  optionText: "Support",
                  optionDescription: "Get help from us and community",
                ),
                const Gap(25),
                const AccountPageDown(
                  optionText: "Open Source License",
                  optionDescription: "License details for open source software",
                ),
                const Gap(25),
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
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: CustomColors.colorShade4,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
